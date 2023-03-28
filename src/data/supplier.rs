use super::{phone::Phone, address::Address};

pub struct DbSupplier {
  id: u64,
  name: String,
  website: String,
  phone_id: u64,
  address_id: u64,
}

pub struct Supplier {
  id: u64,
  name: String,
  website: String,
  phone: Phone,
  address: Address,
}