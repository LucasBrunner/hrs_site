use rocket::Route;

use crate::data_access_web::account::get_account_implicit;

pub mod account;
pub mod product;
pub mod warehouse;
pub mod order;
pub mod account_type;

use account::*;
use product::*;
use warehouse::*;
use order::*;
use account_type::*;

pub fn data_routes() -> Vec<Route> {
  routes![
    // accounts
    get_account_implicit,
    get_account_from_id,
    put_account_implicit,
    put_account_id,
    search_account,
    get_types_for_account,
    account::post_account_type,
    account::delete_account_type,
    // products
    get_inventory_item_range,
    get_inventory_item_search_data,
    get_inventory_item_data_id,
    // warehouses
    get_warehouses,
    get_warehouse,
    get_warehouse_inventory,
    post_warehouse_inventory,
    get_warehouse_stocked_with_item,
    // orders
    get_order_summaries_implicit,
    get_order_summaries_with_state_implicit,
    get_order_summaries_id,
    get_order,
    put_order_implicit,
    put_order_employee,
    post_order_implicit,
    post_order_employee,
    // account type
    get_account_types,
    account_type::post_account_type,
    account_type::delete_account_type,
  ]
}
