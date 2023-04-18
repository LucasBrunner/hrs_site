use serde::Serialize;
use sqlx::FromRow;

use crate::data::IdColumnName;

#[derive(Serialize, Clone, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Address {
  pub address_id: u64,
  pub street: String,
  pub city: String,
  pub state: String,
  pub zip: String,
}

impl IdColumnName for Address {
  const ID_COLUMN_NAME: &'static str = "address_id";
}
