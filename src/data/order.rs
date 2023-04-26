use std::{
  error::Error,
  fmt::{Display, Write},
  ops::Range,
};

use rocket::http::Status;
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{
  mysql::MySqlRow, types::Decimal, Acquire, Database, Decode, FromRow, MySql, Row, Transaction,
  Type,
};
use time::OffsetDateTime;

use crate::database::Db;

use super::{
  basic_data::address::Address, inventory::InventoryItem, option_internally_tagged, ApiResponse,
  DataWithId, IdColumnName, ItemCount, OptionInternallyTagged, SortColumn, SortOrder, ToSqlxError,
  UpdateType,
};

#[derive(Serialize, Deserialize, Debug, Clone, Copy)]
#[serde(rename_all = "camelCase")]
pub enum OrderState {
  Pending = 1,
  Commited = 2,
  InProgress = 3,
  Completed = 4,
  Canceled = 5,
}

impl OrderState {
  pub fn value(&self) -> u64 {
    match self {
      OrderState::Pending => 1,
      OrderState::Commited => 2,
      OrderState::InProgress => 3,
      OrderState::Completed => 4,
      OrderState::Canceled => 5,
    }
  }

  pub fn match_str(string: &str) -> Result<OrderState, ()> {
    match string {
      "pending" => Ok(OrderState::Pending),
      "commited" => Ok(OrderState::Commited),
      "in_progress" => Ok(OrderState::InProgress),
      "completed" => Ok(OrderState::Completed),
      "canceled" => Ok(OrderState::Canceled),
      _ => Err(()),
    }
  }
}

impl Display for OrderState {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_fmt(format_args!("{}", self.value()))
  }
}

#[derive(Debug, Clone)]
pub struct OrderStateDecodeError();

impl Display for OrderStateDecodeError {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str("OrderStateDecodeError")
  }
}

impl Error for OrderStateDecodeError {}

impl OrderState {
  pub fn from_id(id: u64) -> Result<OrderState, OrderStateDecodeError> {
    match id {
      1 => Ok(OrderState::Pending),
      2 => Ok(OrderState::Commited),
      3 => Ok(OrderState::InProgress),
      4 => Ok(OrderState::Completed),
      5 => Ok(OrderState::Canceled),
      _ => Err(OrderStateDecodeError()),
    }
  }
}

impl ToSqlxError<OrderState> for Result<OrderState, OrderStateDecodeError> {
  fn to_sql_error(self) -> Result<OrderState, sqlx::Error> {
    match self {
      Ok(value) => Ok(value),
      Err(_) => Err(sqlx::Error::Decode(Box::new(OrderStateDecodeError()))),
    }
  }

  fn to_boxdyn_error(self) -> Result<OrderState, sqlx::error::BoxDynError> {
    match self {
      Ok(value) => Ok(value),
      Err(_) => Err(Box::new(OrderStateDecodeError())),
    }
  }
}

impl Type<sqlx::MySql> for OrderState {
  fn type_info() -> <sqlx::MySql as sqlx::Database>::TypeInfo {
    <u64 as sqlx::Type<sqlx::MySql>>::type_info()
  }
}

impl<'r, DB> Decode<'r, DB> for OrderState
where
  DB: Database,
  u64: sqlx::Decode<'r, DB>,
{
  fn decode(
    value: <DB as sqlx::database::HasValueRef<'r>>::ValueRef,
  ) -> Result<Self, sqlx::error::BoxDynError> {
    OrderState::from_id(<u64 as Decode<DB>>::decode(value)?).to_boxdyn_error()
  }
}

impl IdColumnName for OrderState {
  const ID_COLUMN_NAME: &'static str = "order_state_id";
}

impl FromRow<'_, MySqlRow> for OrderState {
  fn from_row(row: &MySqlRow) -> Result<Self, sqlx::Error> {
    OrderState::from_id(row.try_get(Self::ID_COLUMN_NAME)?).to_sql_error()
  }
}

#[derive(Serialize, Clone, FromRow, Debug)]
#[serde(rename_all = "camelCase")]
pub struct SaleOrderSummary {
  pub account_id: u64,
  pub order_name: String,
  pub account_legal_name: String,
  pub account_preferred_name: String,
  pub date_created: i64,
  #[serde(serialize_with = "option_internally_tagged")]
  pub address_id: Option<u64>,
  pub state: OrderState,
}

impl IdColumnName for SaleOrderSummary {
  const ID_COLUMN_NAME: &'static str = "sale_order_id";
}

pub async fn get_sale_order_summary(
  sale_order_id: u64,
  db: &mut Connection<Db>,
) -> Result<SaleOrderSummary, sqlx::Error> {
  sqlx::query_as::<_, SaleOrderSummary>(&format!(
    r#"
      SELECT 
        `SaleOrder`.`account_id`,
        `Account`.`legal_name` AS "account_legal_name",
        `Account`.`preferred_name` AS "account_preferred_name",
        `SaleOrder`.`date_created`,
        `SaleOrder`.`order_name`,
        `SaleOrder`.`address_id`,
        `SaleOrder`.`order_state_id` AS "state"
      FROM 
        `SaleOrder`
        INNER JOIN `Account` USING(`account_id`)
      WHERE `SaleOrder`.`sale_order_id` = {};
    "#,
    sale_order_id,
  ))
  .fetch_one(&mut **db)
  .await
}

pub enum SaleOrderSortType {
  Date,
}

impl SortColumn for SaleOrderSortType {
  fn sort_column(&self) -> &'static str {
    match self {
      SaleOrderSortType::Date => "`SaleOrder`.`date_created`",
    }
  }
}

pub async fn get_sale_order_summary_page(
  accounts: Vec<u64>,
  before: Option<i64>,
  after: Option<i64>,
  state_filters: Vec<OrderState>,
  sort_order: Vec<SortOrder<SaleOrderSortType>>,
  item_range: Option<Range<u64>>,
  db: &mut Connection<Db>,
) -> Result<Vec<DataWithId<SaleOrderSummary>>, sqlx::Error> {
  let mut query_string = r#"
      SELECT 
        `SaleOrder`.`sale_order_id`,
        `SaleOrder`.`account_id`,
        `Account`.`legal_name` AS "account_legal_name",
        `Account`.`preferred_name` AS "account_preferred_name",
        `SaleOrder`.`date_created`,
        `SaleOrder`.`order_name`,
        `SaleOrder`.`address_id`,
        `SaleOrder`.`order_state_id` AS "state"
      FROM 
        `SaleOrder`
        INNER JOIN `Account` USING(`account_id`)
    "#
  .to_owned();

  let mut where_clauses = Vec::new();

  if !accounts.is_empty() {
    let mut accounts = accounts.into_iter();
    let first = format!("`SaleOrder`.`account_id` = {}", accounts.next().unwrap());
    where_clauses.push(format!(
      "(\n{}\n)",
      accounts.fold(first, |mut acc, account_id| {
        _ = write!(&mut acc, "\nOR `SaleOrder`.`account_id` = {}", account_id);
        acc
      })
    ));
  }

  if let Some(before_timestamp) = before {
    where_clauses.push(format!("`SaleOrder`.`date_created` < {}", before_timestamp));
  }

  if let Some(after_timestamp) = after {
    where_clauses.push(format!("`SaleOrder`.`date_created` > {}", after_timestamp));
  }

  if !state_filters.is_empty() {
    let mut state_filters = state_filters.into_iter();
    let first = format!(
      "`SaleOrder`.`order_state_id` = {}",
      state_filters.next().unwrap()
    );
    where_clauses.push(format!(
      "(\n{}\n)",
      state_filters.fold(first, |mut acc, state_filter| {
        _ = write!(
          &mut acc,
          "\n`SaleOrder`.`order_state_id` = {}",
          state_filter
        );
        acc
      })
    ))
  }

  if !where_clauses.is_empty() {
    let mut where_clauses = where_clauses.into_iter();
    let first = format!("WHERE\n{}", where_clauses.next().unwrap());
    _ = write!(
      &mut query_string,
      "\n{}",
      where_clauses.fold(first, |mut acc, clause| {
        _ = write!(&mut acc, "\nAND {}", clause);
        acc
      })
    )
  }

  if !sort_order.is_empty() {
    let mut sort_order = sort_order.into_iter();
    let first = format!("ORDER BY\n{}", sort_order.next().unwrap().get_clause());
    _ = write!(
      &mut query_string,
      "\n{}",
      sort_order.fold(first, |mut acc, clause| {
        _ = write!(&mut acc, ",\n{}", clause.get_clause());
        acc
      })
    )
  }

  if let Some(item_numbers) = item_range {
    _ = write!(
      &mut query_string,
      "\nLIMIT {}\nOFFSET {}",
      item_numbers.end - item_numbers.start,
      item_numbers.start
    );
  }

  // println!("{}", query_string);

  sqlx::query_as::<_, DataWithId<SaleOrderSummary>>(&query_string)
    .fetch_all(&mut **db)
    .await
}

#[derive(Debug, Serialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub struct SaleOrderItem<T> {
  pub item: T,
  pub warehouse_id: u64,
  pub cost: Decimal,
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for SaleOrderItem<T>
where
  'r: 'a,
  T: FromRow<'a, MySqlRow>,
{
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get("current_price") {
      Ok(cost) => Ok(SaleOrderItem {
        item: T::from_row(row)?,
        warehouse_id: match row.try_get("warehouse_id") {
          Ok(warehouse_id) => warehouse_id,
          Err(_) => return Err(sqlx::Error::ColumnNotFound("warehouse_id".to_owned())),
        },
        cost,
      }),
      Err(_) => Err(sqlx::Error::ColumnNotFound("count".to_owned())),
    }
  }
}

#[derive(Serialize, FromRow, Debug)]
#[serde(rename_all = "camelCase")]
pub struct SaleOrder {
  pub summary: SaleOrderSummary,
  pub address: OptionInternallyTagged<DataWithId<Address>>,
  pub items: Vec<ItemCount<SaleOrderItem<InventoryItem>>>,
}

pub async fn get_sale_order(order_id: u64, db: &mut Connection<Db>) -> Result<SaleOrder, ()> {
  let summary = sqlx::query_as::<_, SaleOrderSummary>(&format!(
    r#"
      SELECT 
        `SaleOrder`.`account_id`,
        `Account`.`legal_name` AS "account_legal_name",
        `Account`.`preferred_name` AS "account_preferred_name",
        `SaleOrder`.`date_created`,
        `SaleOrder`.`order_name`,
        `SaleOrder`.`address_id`,
        `SaleOrder`.`order_state_id` AS "state"
      FROM 
        `SaleOrder`
        INNER JOIN `Account` USING(`account_id`)
      WHERE
        `SaleOrder`.`account_id`,
    "#,
  ))
  .fetch_one(&mut **db)
  .await;

  let Ok(summary) = summary else {
    return Err(());
  };

  let address = sqlx::query_as!(
    Address,
    r#"
      SELECT 
        `Address`.`street`,
        `Address`.`city`,
        `Address`.`state`,
        `Address`.`zip`
      FROM `hrs_database`.`Address`
      WHERE `Address`.`address_id` = ?;
    "#,
    summary.address_id,
  )
  .fetch_one(&mut **db)
  .await;

  let Ok(address) = address else {
    return Err(());
  };

  let address = match summary.address_id {
    Some(address_id) => OptionInternallyTagged::Some {
      data: DataWithId {
        data: address,
        id: address_id,
      },
    },
    None => OptionInternallyTagged::None,
  };

  let items = sqlx::query_as::<_, ItemCount<SaleOrderItem<InventoryItem>>>(&format!(
    r#"
      SELECT 
        `SaleOrderItem`.`sale_order_id`,
        `SaleOrderItem`.`inventory_item_id`,
        `SaleOrderItem`.`warehouse_id`,
        `SaleOrderItem`.`amount`,
        `SaleOrderItem`.`current_cost`
      FROM `hrs_database`.`SaleOrderItem`
      WHERE `SaleOrderItem`.`sale_order_id` = {};
    "#,
    order_id
  ))
  .fetch_all(&mut **db)
  .await;

  let Ok(items) = items else {
    return Err(());
  };

  Ok(SaleOrder {
    summary,
    items,
    address,
  })
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OrderItemUpdate {
  item_id: u64,
  new_item_amount: u64,
  warehouse_id: u64,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OrderUpdate {
  pub address_update: UpdateType<Address>,
  pub state_update: UpdateType<OrderState>,
  pub items: Vec<UpdateType<OrderItemUpdate>>,
}

#[derive(Debug)]
struct ItemAmount {
  amount: u32,
}

async fn put_order_address<'a>(
  order_id: u64,
  address: Address,
  tx: &mut Transaction<'a, MySql>,
) -> Result<(), sqlx::Error> {
  let address_id = sqlx::query!(
    r#"
      INSERT INTO `Address` (
        `street`,
        `city`,
        `state`,
        `zip`
      )
      VALUES (
        ?,
        ?,
        ?,
        ?
      );
    "#,
    address.street,
    address.city,
    address.state,
    address.zip,
  )
  .execute(&mut *tx)
  .await?
  .last_insert_id();

  _ = sqlx::query!(
    r#"
      UPDATE `SaleOrder`
      SET `SaleOrder`.`address_id` = ?
      WHERE `SaleOrder`.`sale_order_id` = ?;
    "#,
    address_id,
    order_id,
  )
  .execute(tx)
  .await?;

  Ok(())
}

async fn post_order_item<'a>(
  order_id: u64,
  order_item_update: &OrderItemUpdate,
  tx: &mut Transaction<'a, MySql>,
) -> Result<(), ()> {
  let insert_result = sqlx::query!(
    r#"
      INSERT INTO `SaleOrderItem`(
        `sale_order_id`,
        `inventory_item_id`,
        `warehouse_id`,
        `amount`,
        `current_cost`
      )
      VALUES (
        ?,
        ?,
        ?,
        ?,
        (
          SELECT `InventoryItem`.`list_price`
          FROM `InventoryItem`
          WHERE `InventoryItem`.`inventory_item_id` = ?
        )
      );
    "#,
    order_id,
    order_item_update.item_id,
    order_item_update.warehouse_id,
    order_item_update.new_item_amount,
    order_item_update.item_id,
  )
  .execute(&mut **tx)
  .await;

  println!("{:?}", insert_result);

  match insert_result {
    Ok(_) => Ok(()),
    Err(_) => Err(()),
  }
}

async fn put_order_item<'a>(
  order_id: u64,
  order_item_update: &OrderItemUpdate,
  tx: &mut Transaction<'a, MySql>,
) -> Result<(), ()> {
  let current_item_count = sqlx::query_as!(
    ItemAmount,
    r#"
      SELECT `SaleOrderItem`.`amount`
      FROM `SaleOrderItem`
      WHERE 
        `SaleOrderItem`.`inventory_item_id` = ?
        AND `SaleOrderItem`.`sale_order_id` = ?
        AND `SaleOrderItem`.`warehouse_id` = ?;
    "#,
    order_item_update.item_id,
    order_id,
    order_item_update.warehouse_id,
  )
  .fetch_one(&mut **tx)
  .await;

  println!("row: {:?}", current_item_count);
  println!("update: {:?}", order_item_update);

  match current_item_count {
    Ok(_) => (),
    Err(err) => {
      println!("{:?}", err);
      return match err {
        sqlx::Error::RowNotFound => post_order_item(order_id, order_item_update, tx).await,
        _ => Err(()),
      };
    }
  };

  if order_item_update.new_item_amount == 0 {
    return delete_order_item(order_id, order_item_update.item_id, tx).await;
  }

  let update_result = sqlx::query!(
    r#"
      UPDATE `SaleOrderItem`
      SET `SaleOrderItem`.`amount` = ?
      WHERE 
        `SaleOrderItem`.`sale_order_id` = ?
        AND `SaleOrderItem`.`inventory_item_id` = ?
        AND `SaleOrderItem`.`warehouse_id` = ?;
    "#,
    order_item_update.new_item_amount,
    order_id,
    order_item_update.item_id,
    order_item_update.warehouse_id,
  )
  .execute(&mut **tx)
  .await;

  println!("update: {:?}", update_result);

  match update_result {
    Ok(_) => Ok(()),
    Err(_) => Err(()),
  }
}

async fn put_order_state<'a>(
  order_id: u64,
  order_state: OrderState,
  tx: &mut Transaction<'a, MySql>,
) -> Result<(), ()> {
  let update_result = sqlx::query!(
    r#"
    UPDATE `SaleOrder`
    SET `SaleOrder`.`order_state_id` = ?
    WHERE 
      `SaleOrder`.`sale_order_id` = ?;
    "#,
    order_state.value(),
    order_id,
  )
  .execute(&mut **tx)
  .await;

  match update_result {
    Ok(_) => Ok(()),
    Err(_) => Err(()),
  }
}

async fn delete_order_item<'a>(
  order_id: u64,
  order_item_id: u64,
  tx: &mut Transaction<'a, MySql>,
) -> Result<(), ()> {
  let commit = sqlx::query!(
    r#"
      DELETE FROM `SaleOrderItem`
      WHERE 
        `SaleOrderItem`.`inventory_item_id` = ?
        AND `SaleOrderItem`.`sale_order_id` = ?;
    "#,
    order_item_id,
    order_id,
  )
  .execute(&mut **tx)
  .await;

  match commit {
    Ok(_) => Ok(()),
    Err(_) => Err(()),
  }
}

pub async fn put_order<'a>(
  order_id: u64,
  order_update: OrderUpdate,
  mut db: Connection<Db>,
) -> ApiResponse<'a> {
  let mut tx = match db.begin().await {
    Ok(tx) => tx,
    Err(_) => {
      return ApiResponse::status(Status::InternalServerError);
    }
  };

  for update_item in order_update.items.iter() {
    _ = match update_item {
      UpdateType::Put { item } => put_order_item(order_id, item, &mut tx).await,
      UpdateType::Delete { id: order_item_id } => {
        delete_order_item(order_id, *order_item_id, &mut tx).await
      }
      UpdateType::Ignore => Ok(()),
    };
  }

  let address_update_result = match order_update.address_update {
    UpdateType::Put { item } => put_order_address(order_id, item, &mut tx).await,
    UpdateType::Delete { id: _ } => {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::UnprocessableEntity);
    }
    UpdateType::Ignore => Ok(()),
  };

  match address_update_result {
    Ok(_) => (),
    Err(_) => {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }
  }

  let order_state_update_result = match order_update.state_update {
    UpdateType::Put { item: order_state } => put_order_state(order_id, order_state, &mut tx).await,
    UpdateType::Delete { id: _ } => {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::UnprocessableEntity);
    }
    UpdateType::Ignore => Ok(()),
  };

  match order_state_update_result {
    Ok(_) => (),
    Err(_) => {
      _ = tx.rollback().await;
      return ApiResponse::status(Status::InternalServerError);
    }
  }
  
  match tx.commit().await {
    Ok(_) => ApiResponse::status(Status::Ok),
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}

pub async fn create_order<'a>(
  account_id: u64,
  order_name: String,
  mut db: Connection<Db>,
) -> ApiResponse<'a> {
  let creation_result = sqlx::query!(
    r#"
    INSERT INTO `SaleOrder` (
      `account_id`,
      `date_created`,
      `order_name`,
      `order_state_id`
    )
    VALUES (
      ?,
      ?,
      ?,
      ?
    );  
    "#,
    account_id,
    OffsetDateTime::now_utc().unix_timestamp(),
    order_name,
    OrderState::Pending.value(),
  )
  .execute(&mut **db)
  .await;

  match creation_result {
    Ok(creation_result) => {
      let order = get_sale_order_summary(creation_result.last_insert_id(), &mut db).await;
      match order {
        Ok(order) => {
          println!("{}, {:?}", creation_result.last_insert_id(), order);
          let json = serde_json::to_string(&DataWithId {
            data: order,
            id: creation_result.last_insert_id(),
          });
          if let Ok(json) = json {
            return ApiResponse::json_success(json);
          };
          ApiResponse::status(Status::Ok)
        }
        Err(err) => {
          println!("{:?}", err);
          ApiResponse::status(Status::Ok)
        }
      }
    }
    Err(_) => ApiResponse::status(Status::InternalServerError),
  }
}
