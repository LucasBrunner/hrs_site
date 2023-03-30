use rocket::serde::json::Json;
use rocket_db_pools::Connection;
use serde::Serialize;
use sqlx::types::Decimal;

use crate::{
  authentication::{AuthSession, empoyee::AuthAccountEmployee},
  database::Db,
};

use super::{DataError, string_option_internally_tagged};

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Warehouse {
  pub id: u64,
  pub name: String,
  pub phone_type: String,
  pub phone_number: String,
  pub address_street: String,
  pub address_city: String,
  pub address_state: String,
  pub address_zip: String,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum WarehouseResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { warehouses: Vec<Warehouse> },
}

#[get("/warehouses", format = "json")]
pub async fn warehouses(
  mut db: Connection<Db>,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<WarehouseResult> {
  let query = sqlx::query_as!(
    Warehouse,
    r#"
      SELECT
        `Warehouse`.`warehouse_id` as "id",
        `Warehouse`.`name`,
        `Phone`.`number` as "phone_number",
        `PhoneType`.`name` AS "phone_type",
        `Address`.`street` AS "address_street",
        `Address`.`city` AS "address_city",
        `Address`.`state` AS "address_state",
        `Address`.`zip` AS "address_zip"
      FROM 
        `Warehouse`
        INNER JOIN `Phone` USING(`phone_id`)
        INNER JOIN `PhoneType` USING(`phone_type_id`)
        INNER JOIN `Address` USING(`address_id`);
    "#,
  )
  .fetch_all(&mut **db)
  .await;

  let Ok(warehouses) = query else {
    return Json(WarehouseResult::Err { err: DataError::DatabaseFailure });
  };

  Json(WarehouseResult::Ok { warehouses })
}

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

#[get("/warehouse/<id>/inventory", format = "json")]
pub async fn warehouse_inventory(
  mut db: Connection<Db>,
  id: u64,
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
    id,
  )
  .fetch_all(&mut **db)
  .await;

  let Ok(items) = query else {
    return Json(WarehouseInventoryResult::Err { err: DataError::DatabaseFailure });
  };

  Json(WarehouseInventoryResult::Ok { items })
}
