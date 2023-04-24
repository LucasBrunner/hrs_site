use serde::Serialize;
use sqlx::types::Decimal;

use super::{option_internally_tagged, IdColumnName};

#[derive(Debug, Serialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct InventoryItem {
  pub cost: Decimal,
  pub list_price: Decimal,
  pub brand_id: u64,
  pub brand_name: String,
  pub model: String,
  #[serde(serialize_with = "option_internally_tagged")]
  pub description: Option<String>,
  #[serde(serialize_with = "option_internally_tagged")]
  pub image_url: Option<String>,
}

impl IdColumnName for InventoryItem {
  const ID_COLUMN_NAME: &'static str = "inventory_item_id";
}
