use std::{error::Error, fmt::Display};

use serde::{Deserialize, Serialize};
use sqlx::{mysql::MySqlRow, Database, Decode, FromRow, Row, Type};

use crate::data::{IdColumnName, ToSqlxError};

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub enum PhoneType {
  Landline = 1,
  Mobile = 2,
}

#[derive(Debug, Clone)]
pub struct PhoneTypeDecodeError();

impl Display for PhoneTypeDecodeError {
  fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
    f.write_str("PhoneTypeDecodeError")
  }
}

impl Error for PhoneTypeDecodeError {}

impl PhoneType {
  pub fn from_id(id: u64) -> Result<PhoneType, PhoneTypeDecodeError> {
    match id {
      1 => Ok(PhoneType::Landline),
      2 => Ok(PhoneType::Mobile),
      _ => Err(PhoneTypeDecodeError()),
    }
  }
}

impl ToSqlxError<PhoneType> for Result<PhoneType, PhoneTypeDecodeError> {
  fn to_sql_error(self) -> Result<PhoneType, sqlx::Error> {
    match self {
      Ok(value) => Ok(value),
      Err(_) => Err(sqlx::Error::Decode(Box::new(PhoneTypeDecodeError()))),
    }
  }

  fn to_boxdyn_error(self) -> Result<PhoneType, sqlx::error::BoxDynError> {
    match self {
      Ok(value) => Ok(value),
      Err(_) => Err(Box::new(PhoneTypeDecodeError())),
    }
  }
}

impl Type<sqlx::MySql> for PhoneType {
  fn type_info() -> <sqlx::MySql as sqlx::Database>::TypeInfo {
    <u64 as sqlx::Type<sqlx::MySql>>::type_info()
  }
}

impl<'r, DB> Decode<'r, DB> for PhoneType
where
  DB: Database,
  u64: sqlx::Decode<'r, DB>,
{
  fn decode(
    value: <DB as sqlx::database::HasValueRef<'r>>::ValueRef,
  ) -> Result<Self, sqlx::error::BoxDynError> {
    PhoneType::from_id(<u64 as Decode<DB>>::decode(value)?).to_boxdyn_error()
  }
}

impl IdColumnName for PhoneType {
  const ID_COLUMN_NAME: &'static str = "phone_type_id";
}

impl FromRow<'_, MySqlRow> for PhoneType {
  fn from_row(row: &MySqlRow) -> Result<Self, sqlx::Error> {
    PhoneType::from_id(row.try_get(Self::ID_COLUMN_NAME)?).to_sql_error()
  }
}

#[derive(Serialize, Clone, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct Phone {
  pub number: String,
  pub phone_type: PhoneType,
}

impl IdColumnName for Phone {
  const ID_COLUMN_NAME: &'static str = "phone_id";
}
