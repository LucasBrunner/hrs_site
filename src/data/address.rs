use serde::Serialize;

#[derive(Serialize)]
pub struct Address {
  id: u64,
  street: String,
  city: String,
  region: String,
  zip: String,
}
