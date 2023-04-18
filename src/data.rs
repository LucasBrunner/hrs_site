pub mod warehouses;
pub mod inventory;
pub mod warehouse;
pub mod account;
mod basic_data;

use rocket::{routes, Route};
use serde::{Serialize, Deserialize, Serializer};
use sqlx::{FromRow, mysql::MySqlRow, Row};

use crate::session::SessionError;

pub fn data_routes() -> Vec<Route> {
  routes![]
}

pub trait IdColumnName {
  const ID_COLUMN_NAME: &'static str;
}

pub trait ToSqlxError<T> {
  fn to_boxdyn_error(self) -> Result<T, sqlx::error::BoxDynError>;
  fn to_sql_error(self) -> Result<T, sqlx::Error>;
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum DataMaybeId<T> {
  Id {
    data: T,
    id: u64,
  },
  NoId {
    data: T,
  },
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for DataMaybeId<T> where 'r: 'a, T: FromRow<'a, MySqlRow> + IdColumnName {
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get(T::ID_COLUMN_NAME) {
      Ok(id) => Ok(DataMaybeId::Id { data: T::from_row(row)?, id }),
      Err(_) => Err(sqlx::Error::ColumnNotFound(T::ID_COLUMN_NAME.to_owned())),
    }
  }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct DataWithId<T> {
  pub data: T,
  pub id: u64,
}

impl<'a, 'r, T> FromRow<'r, MySqlRow> for DataWithId<T> where 'r: 'a, T: FromRow<'a, MySqlRow> + IdColumnName {
  fn from_row(row: &'r MySqlRow) -> Result<Self, sqlx::Error> {
    match row.try_get(T::ID_COLUMN_NAME) {
      Ok(id) => Ok(DataWithId { data: T::from_row(row)?, id }),
      Err(_) => Err(sqlx::Error::ColumnNotFound(T::ID_COLUMN_NAME.to_owned())),
    }
  }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum UpdateType<T> {
  #[serde(rename_all = "camelCase")]
  Put { item: T },
  #[serde(rename_all = "camelCase")]
  Delete { id: u64 },
  Ignore,
}

#[derive(Debug, Clone, Copy, Serialize)]
#[serde(tag = "Type")]
pub enum DataError {
  #[serde(rename_all = "camelCase")]
  SessionError {
    session_error: SessionError,
  },
  DatabaseFailure,
  JsonParseError,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(tag = "Type")]
pub enum StringOptionInternallyTagged {
  Some{data: String},
  #[default]
  None,
}

pub fn string_option_internally_tagged<S>(x: &Option<String>, s: S) -> Result<S::Ok, S::Error> where S: Serializer {
  match x {
    Some(data) => StringOptionInternallyTagged::Some { data: data.clone() },
    None => StringOptionInternallyTagged::None,
  }.serialize(s)
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(tag = "Type")]
pub enum IntOptionInternallyTagged {
  Some{data: u64},
  #[default]
  None,
}

pub fn int_option_internally_tagged<S>(x: &Option<u64>, s: S) -> Result<S::Ok, S::Error> where S: Serializer {
  match x {
    Some(data) => IntOptionInternallyTagged::Some { data: data.clone() },
    None => IntOptionInternallyTagged::None,
  }.serialize(s)
}

// #[derive(Debug, Clone, Serialize, Deserialize, Default)]
// #[serde(tag = "Type")]
// pub enum InternallyTaggedOption<T> {
//   Some{data: T},
//   #[default]
//   None,
// }

// pub trait ToInternallyTagged<T> {
//   fn to_internally_tagged(self) -> T;
// }

// impl ToInternallyTagged<StringOption> for Option<String> {
//   fn to_internally_tagged(self) -> StringOption {
//     match self {
//       Some(data) => StringOption::Some { data },
//       None => StringOption::None,
//     }
//   }
// }

// pub trait ToInternallyTaggedClone<T> where T: Clone {
//   fn to_internally_tagged_clone(&self) -> T;
// }

// impl ToInternallyTaggedClone<StringOption> for Option<String> {
//   fn to_internally_tagged_clone(&self) -> StringOption {
//     match self {
//       Some(data) => StringOption::Some { data: data.clone() },
//       None => StringOption::None,
//     }
//   }
// }

// pub fn option_internally_tagged<T, S>(x: &Option<T>, s: S) -> Result<S::Ok, S::Error> where S: Serializer, T:  {
//   x.to_internally_tagged_clone().serialize(s)
// }
