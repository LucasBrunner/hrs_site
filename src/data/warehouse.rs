use rocket::{http::CookieJar, serde::json::Json};
use rocket_db_pools::Connection;
use serde::Serialize;

use crate::{
  authentication::{AuthAccountEmployee, AuthSession},
  database::Db,
  session::LoginSesion,
};

use super::{address::Address, inventory_item::InventoryItem, phone::Phone, DataError};

pub struct DbWarehouse {
  warehouse_id: u64,
  name: String,
  address: u64,
  phone_id: u64,
}

#[derive(Serialize)]
pub struct Warehouse {
  id: u64,
  name: String,
  address: Address,
  phone: Phone,
}

pub struct DbWarehouseItem {
  warehouse_item_id: u64,
  item_id: u64,
  amount: u32,
}

pub struct WarehouseItem {
  warehouse: Warehouse,
  item: InventoryItem,
  amount: u32,
}

#[derive(Serialize)]
#[serde(tag = "Type")]
pub enum WarehouseResult {
  #[serde(rename_all = "camelCase")]
  Err { err: DataError },
  #[serde(rename_all = "camelCase")]
  Ok { warehouses: Vec<Warehouse> },
}

// #[post("/warehouses", format = "json")]
// pub async fn warehouses(
//   mut db: Connection<Db>,
//   _auth_session: AuthSession,
//   _auth_employee: AuthAccountEmployee,
// ) -> Json<WarehouseResult> {
//   let query = sqlx::query!(
//     r#"
//       SELECT
//         `Warehouse`.`id` as "warehouse_id",
//         `Warehouse`.`name`
//       FROM 
//         `Warehouse`
//         INNER JOIN `Phone` ON (`Warehouse`.`phone_id` = `Phone`.`id`)
//         INNER JOIN `Address` ON (`Warehouse`.`address_id` = `Address`.`id`);
//     "#,
//   )
//   .fetch_all(&mut **db)
//   .await;

//   todo!()
// }
