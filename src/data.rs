pub mod warehouses;
pub mod inventory;
pub mod warehouse;

use rocket::{routes, Route};
use serde::{Serialize, Deserialize, Serializer};

use crate::session::SessionError;

pub fn data_routes() -> Vec<Route> {
  routes![]
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
