use serde::Serialize;

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Address {
  pub id: u64,
  pub street: String,
  pub city: String,
  pub state: String,
  pub zip: String,
}
