use serde::Serialize;

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Address {
  pub address_id: u64,
  pub street: String,
  pub city: String,
  pub state: String,
  pub zip: String,
}
