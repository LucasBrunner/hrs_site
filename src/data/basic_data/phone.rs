use serde::{Deserialize, Serialize};

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Phone {
  pub phone_id: u64,
  pub number: String,
  pub phone_type: PhoneType,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum PhoneType {
  Landline,
  Mobile,
}

pub struct DbPhoneData {
  pub phone_id: u64,
  pub number: String,
  pub phone_type_name: String,
}

#[cfg(test)]
mod test {
  use crate::data::basic_data::phone::PhoneType;

  #[test]
  fn phone_type_serialize() {
    println!("{:?}", serde_json::to_string(&PhoneType::Mobile));
    println!("{:?}", serde_json::from_str::<PhoneType>("\"mobile\""));
  }
}

pub trait ToPhone {
  fn to_phone(self) -> Result<Phone, ()>;
}

impl ToPhone for DbPhoneData {
  fn to_phone(self) -> Result<Phone, ()> {
    let Ok(phone_type) = serde_json::from_str(&format!("\"{}\"", self.phone_type_name)) else {
      return Err(());
    };

    Ok(Phone {
      phone_id: self.phone_id,
      number: self.number,
      phone_type,
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
