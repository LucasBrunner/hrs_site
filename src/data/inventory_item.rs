use sqlx::types::Decimal;

use super::brand::Brand;

pub struct DbInventoryItem {
  id: u64,
  cost: Decimal,
  list_price: Decimal,
  brand_id: u64,
  model: String,
  serial: String,
  description: String,
}

pub struct InventoryItem {
  id: u64,
  cost: Decimal,
  list_price: Decimal,
  brand_id: Brand,
  model: String,
  serial: String,
  description: String,
}