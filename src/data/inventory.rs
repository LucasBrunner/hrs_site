use rocket::serde::json::Json;
use rocket_db_pools::Connection;
use serde::{Serialize, Deserialize};
use sqlx::{types::Decimal, Acquire};
use time::OffsetDateTime;

use crate::{
  authentication::{AuthSession, empoyee::AuthAccountEmployee},
  database::Db,
};

use super::{DataError, string_option_internally_tagged};

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct WarehouseInventoryItem {
  warehouse_id: u64,
  inventory_item_id: u64,
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  brand_name: String,
  model: String,
  #[serde(serialize_with = "string_option_internally_tagged")]
  serial: Option<String>,
  #[serde(serialize_with = "string_option_internally_tagged")]
  description: Option<String>,
  amount: u32,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum WarehouseInventoryResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { items: Vec<WarehouseInventoryItem> },
}

#[get("/warehouse/<warehouse_id>/inventory", format = "json")]
pub async fn warehouse_inventory(
  mut db: Connection<Db>,
  warehouse_id: u64,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<WarehouseInventoryResult> {
  let query = sqlx::query_as!(
    WarehouseInventoryItem,
    r#"
      SELECT
        `warehouse_id`,
        `inventory_item_id`,
        `cost`,
        `list_price`,
        `brand_id`,
        `Brand`.`name` AS "brand_name",
        `model`,
        `serial`,
        `description`,
        `amount`
      FROM 
        `WarehouseItem`
        INNER JOIN `InventoryItem` USING(`inventory_item_id`)
        INNER JOIN `Brand` USING(`brand_id`)
      WHERE `WarehouseItem`.`warehouse_id` = ?;
    "#,
    warehouse_id,
  )
  .fetch_all(&mut **db)
  .await;

  let Ok(items) = query else {
    return Json(WarehouseInventoryResult::Err { err: DataError::DatabaseFailure });
  };

  Json(WarehouseInventoryResult::Ok { items })
}

#[derive(Debug, Serialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct InventoryItem {
  inventory_item_id: u64,
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  brand_name: String,
  model: String,
  #[serde(serialize_with = "string_option_internally_tagged")]
  serial: Option<String>,
  #[serde(serialize_with = "string_option_internally_tagged")]
  description: Option<String>,
}

#[derive(Debug, Serialize)]
#[serde(tag = "Type")]
pub enum InventoryItemResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { items: Vec<InventoryItem> },
}

#[get("/inventory/search/<item_name>", format = "json")]
pub async fn get_inventory_item_data(
  mut db: Connection<Db>,
  item_name: String,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<InventoryItemResult> {
  let Ok(item_name) = urlencoding::decode(&item_name) else {
    return Json(InventoryItemResult::Err { err: DataError::JsonParseError });
  };
  let name_conditions = item_name
    .split_whitespace()
    .fold(String::new(), |mut acc, name_word| {
      acc.push_str(&format!(
        " OR `model` LIKE \"%{}%\" OR `Brand`.`name` LIKE \"%{}%\"", 
        name_word, 
        name_word,
      ));
      acc
    });
  let query = sqlx::query_as::<_, InventoryItem>(&format!(
      r#"
        SELECT
          `inventory_item_id`,
          `cost`,
          `list_price`,
          `brand_id`,
          `Brand`.`name` AS "brand_name",
          `model`,
          `serial`,
          `description`
        FROM 
          `InventoryItem`
          INNER JOIN `Brand` USING(`brand_id`)
        WHERE `InventoryItem`.`inventory_item_id` < 0
          {};
      "#, 
      name_conditions,
    ))
    .fetch_all(&mut **db)
    .await;

  match query {
    Ok(items) => Json(InventoryItemResult::Ok { items }),
    Err(err) => {println!("{}", err.to_string()); Json(InventoryItemResult::Err { err: DataError::DatabaseFailure })},
  }
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct WarehouseItemManulUpdate {
  inventory_item_id: u64,
  amount: i32,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum WarehouseInventoryManulUpdateResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok {},
}

#[post("/warehouse/<warehouse_id>/inventory/manual_update", format = "json", data = "<item_update>")]
pub async fn warehouse_inventory_manual_update(
  mut db: Connection<Db>,
  warehouse_id: u64,
  item_update: rocket::serde::json::Json<WarehouseItemManulUpdate>,
  auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<WarehouseInventoryManulUpdateResult> {
  let Ok(mut tx) = db.begin().await else {
    return Json(WarehouseInventoryManulUpdateResult::Err { err:DataError::DatabaseFailure });
  };
  let order_result = sqlx::query!(
    r#"
    INSERT INTO `WarehouseOrder`(
      `warehouse_id`,
      `account_id`,
      `date`,
      `supplier_id`,
      `order_state_id`
    )
    VALUES(
      ?,
      ?,
      ?,
      (SELECT `supplier_id` FROM `Supplier` WHERE `name` = "HRS"),
      (SELECT `order_state_id` FROM `OrderState` WHERE `name` = "commited")
    );
    "#,
    warehouse_id,
    auth_session.session.account_id,
    OffsetDateTime::now_utc().unix_timestamp(),
  )
  .execute(&mut tx)
  .await;

  let Ok(order) = order_result else {
    _ = tx.rollback().await;
    return Json(WarehouseInventoryManulUpdateResult::Err { err: DataError::DatabaseFailure });
  };

  _ = sqlx::query!(
    r#"
    INSERT INTO `WarehouseOrderItem`(
      `warehouse_order_id`,
      `inventory_item_id`,
      `amount`,
      `current_cost`
    )
    VALUES(
      ?,
      ?,
      ?,
      0
    );
    "#,
    order.last_insert_id(),
    item_update.inventory_item_id,
    item_update.amount,
  )
  .execute(&mut tx)
  .await;

  _ = sqlx::query!(
    r#"
    INSERT INTO `WarehouseItem`(
      `warehouse_id`,
      `inventory_item_id`,
      `amount`
    )
    VALUES(
      ?,
      ?,
      ?
    )
    ON DUPLICATE KEY UPDATE
    `amount` = `amount` + ?;
    "#,
    warehouse_id,
    item_update.inventory_item_id,
    item_update.amount,
    item_update.amount,
  )
  .execute(&mut tx)
  .await;

  let update = tx.commit().await;

  if update.is_err() {
    return Json(WarehouseInventoryManulUpdateResult::Err { err: DataError::DatabaseFailure });
  }

  Json(WarehouseInventoryManulUpdateResult::Ok {})
}
