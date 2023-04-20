use rocket::http::Status;
use rocket_db_pools::Connection;
use serde::{Deserialize, Serialize};
use sqlx::{types::Decimal, Acquire, FromRow};
use time::OffsetDateTime;

use crate::{
  authentication::{empoyee::AuthAccountEmployee, AuthSession},
  database::Db,
};

use super::{
  inventory::InventoryItem, option_internally_tagged, ApiResponse, DataWithId, IdColumnName,
  ItemCount,
};

#[derive(Serialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct WarehouseInventoryItem {
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  brand_name: String,
  model: String,
  #[serde(serialize_with = "option_internally_tagged")]
  description: Option<String>,
  amount: u32,
}

impl IdColumnName for WarehouseInventoryItem {
  const ID_COLUMN_NAME: &'static str = "inventory_item_id";
}

#[get("/warehouses/<warehouse_id>/inventory", format = "json")]
pub async fn get_warehouse_inventory(
  mut db: Connection<Db>,
  warehouse_id: u64,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let query = sqlx::query_as::<_, ItemCount<DataWithId<InventoryItem>>>(&format!(
    r#"
      SELECT
        `inventory_item_id`,
        `WarehouseItem`.`amount` AS "count",
        `cost`,
        `list_price`,
        `brand_id`,
        `Brand`.`name` AS "brand_name",
        `model`,
        `description`
      FROM 
        `WarehouseItem`
        INNER JOIN `InventoryItem` USING(`inventory_item_id`)
        INNER JOIN `Brand` USING(`brand_id`)
      WHERE `WarehouseItem`.`warehouse_id` = {};
    "#,
    warehouse_id,
  ))
  .fetch_all(&mut **db)
  .await;

  let items = match query {
    Err(_) => {
      return ApiResponse::WithoutBody {
        status: Status::InternalServerError,
      }
    }
    Ok(items) => items,
  };

  match serde_json::to_string(&items) {
    Ok(items) => ApiResponse::WithBody {
      json: items,
      status: Status::Ok,
    },
    Err(_) => ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    },
  }
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct WarehouseItemManulUpdate {
  inventory_item_id: u64,
  amount: i32,
}

#[put(
  "/warehouses/<warehouse_id>/inventory",
  format = "json",
  data = "<item_update>"
)]
pub async fn post_warehouse_inventory(
  mut db: Connection<Db>,
  warehouse_id: u64,
  item_update: rocket::serde::json::Json<WarehouseItemManulUpdate>,
  auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> ApiResponse {
  let Ok(mut tx) = db.begin().await else {
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
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
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
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
    return ApiResponse::WithoutBody {
      status: Status::InternalServerError,
    };
  }

  ApiResponse::WithBody {
    status: Status::Created,
    json: String::new(),
  }
}
