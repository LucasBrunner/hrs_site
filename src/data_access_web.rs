use rocket::Route;

use crate::data_access_web::account::get_account_implicit;

pub mod account;
pub mod product;
pub mod warehouse;

use account::*;
use product::*;
use warehouse::*;

pub fn data_routes() -> Vec<Route> {
  routes![
    // accounts
    get_account_implicit,
    get_account_from_id,
    put_account_implicit,
    search_account,
    // products
    get_inventory_item_range,
    get_inventory_item_data,
    // warehouses
    get_warehouses,
    get_warehouse,
    get_warehouse_inventory,
    post_warehouse_inventory,
  ]
}
