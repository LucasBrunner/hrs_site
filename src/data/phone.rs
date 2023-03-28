pub struct PhoneType {
  id: u64,
  name: String,
}

pub struct DbPhone {
  id: u64,
  type_id: u64,
  number: String,
}

pub struct Phone {
  id: u64,
  phone_type: PhoneType,
  number: String,
}