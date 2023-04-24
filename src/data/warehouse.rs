use serde::{Deserialize, Serialize};
use sqlx::FromRow;

use super::IdColumnName;

#[derive(Serialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Warehouse {
  pub name: String,
  pub phone_type: String,
  pub phone_number: String,
  pub address_street: String,
  pub address_city: String,
  pub address_state: String,
  pub address_zip: String,
}

impl IdColumnName for Warehouse {
  const ID_COLUMN_NAME: &'static str = "warehouse_id";
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct WarehouseItemManulUpdate {
  pub inventory_item_id: u64,
  pub amount: i32,
}
