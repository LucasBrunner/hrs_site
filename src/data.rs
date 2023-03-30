pub mod account;
pub mod address;
pub mod brand;
pub mod inventory_item;
pub mod order_state;
pub mod phone;
pub mod supplier;
pub mod warehouse;
pub mod warehouse_order;

use rocket::{routes, Route};
use serde::Serialize;

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
}
