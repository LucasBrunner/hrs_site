use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct PhoneType {
  pub name: String,
  pub phone_type_id: u64,
}

#[derive(Serialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Phone {
  pub phone_id: u64,
  pub number: String,
  pub phone_type: PhoneType,
}

pub struct DbPhoneData {
  pub phone_id: u64,
  pub number: String,
  pub name: String,
  pub phone_type_id: u64,
}

pub trait ToPhone {
  fn to_phone(self) -> Result<Phone, ()>;
}

impl ToPhone for DbPhoneData {
  fn to_phone(self) -> Result<Phone, ()> {

    Ok(Phone {
      phone_id: self.phone_id,
      number: self.number,
      phone_type: PhoneType { name: self.name, phone_type_id: self.phone_type_id, },
    })
  }
}

pub trait ToPhones {
  fn to_phones(self) -> Result<Vec<Phone>, ()>;
}

impl<T> ToPhones for Result<Vec<DbPhoneData>, T> {
  fn to_phones(self) -> Result<Vec<Phone>, ()> {
    let Ok(db_phone_data) = self else {
      return Err(());
    };
    Ok(db_phone_data.into_iter().filter_map(|phone_data| phone_data.to_phone().ok()).collect())
  }
}
