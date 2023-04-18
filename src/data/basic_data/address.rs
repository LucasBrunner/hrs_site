use serde::{Serialize, Deserialize};
use sqlx::FromRow;

use crate::data::IdColumnName;

#[derive(Serialize, Deserialize, Clone, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Address {
  pub street: String,
  pub city: String,
  pub state: String,
  pub zip: String,
}

impl IdColumnName for Address {
  const ID_COLUMN_NAME: &'static str = "address_id";
}
