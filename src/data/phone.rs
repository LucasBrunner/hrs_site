use serde::Serialize;

#[derive(Serialize)]
pub struct PhoneType {
  id: u64,
  name: String,
}

pub struct DbPhone {
  phone_id: u64,
  phone_type_id: u64,
  number: String,
}

#[derive(Serialize)]
pub struct Phone {
  id: u64,
  phone_type: PhoneType,
  number: String,
}
