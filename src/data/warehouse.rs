use rocket::serde::json::Json;
use rocket_db_pools::Connection;
use serde::Serialize;

use crate::{
  authentication::{AuthSession, empoyee::AuthAccountEmployee},
  database::Db,
  data::phone::PhoneType,
};

use super::{address::Address, inventory_item::InventoryItem, phone::Phone, DataError};

pub struct DbWarehouse {
  warehouse_id: u64,
  name: String,
  address: u64,
  phone_id: u64,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Warehouse {
  pub id: u64,
  pub name: String,
  pub address: Address,
  pub phone: Phone,
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

#[get("/warehouses", format = "json")]
pub async fn warehouses(
  mut db: Connection<Db>,
  _auth_session: AuthSession,
  _auth_employee: AuthAccountEmployee,
) -> Json<WarehouseResult> {
  let query = sqlx::query!(
    r#"
      SELECT
        `Warehouse`.`warehouse_id`,
        `Warehouse`.`name`AS "warehouse_name",
        `Phone`.`phone_id`,
        `Phone`.`phone_type_id`,
        `Phone`.`number`,
        `PhoneType`.`name` AS "phone_type_name",
        `Address`.`address_id`,
        `Address`.`street`,
        `Address`.`city`,
        `Address`.`state`,
        `Address`.`zip`
      FROM 
        `Warehouse`
        INNER JOIN `Phone` USING(`phone_id`)
        INNER JOIN `PhoneType` USING(`phone_type_id`)
        INNER JOIN `Address` USING(`address_id`);
    "#,
  )
  .fetch_all(&mut **db)
  .await;

  let Ok(result) = query else {
    return Json(WarehouseResult::Err { err: DataError::DatabaseFailure });
  };

  let warehouses: Vec<_> = result.iter()
    .map(|result| {
      Warehouse {
        id: result.warehouse_id,
        name: result.warehouse_name.clone(),
        address: Address {
          id: result.address_id,
          street: result.street.clone(),
          city: result.city.clone(),
          state: result.state.clone(),
          zip: result.zip.clone(),
        },
        phone: Phone {
          id: result.phone_id,
          phone_type: PhoneType {
            id: result.phone_type_id,
            name: result.phone_type_name.clone(),
          },
          number: result.number.clone(),
        },
      }
    })
    .collect();

  println!("{}", serde_json::to_string(&warehouses).unwrap());
  Json(WarehouseResult::Ok { warehouses })
}
