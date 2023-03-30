use serde::Serialize;

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct PhoneType {
  pub id: u64,
  pub name: String,
}

pub struct DbPhone {
  phone_id: u64,
  phone_type_id: u64,
  number: String,
}

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Phone {
  pub id: u64,
  pub phone_type: PhoneType,
  pub number: String,
}
