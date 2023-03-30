use sqlx::types::Decimal;

use super::{
  account::Account, inventory_item::InventoryItem, order_state::OrderState, warehouse::Warehouse,
};

pub struct DbWarehouseOrder {
  warehouse_order_id: u64,
  warehouse_id: u64,
  account_id: u64,
  supplier: u64,
  date: i64,
  state_id: u64,
}

pub struct DbWarehouseOrderItem {
  warehouse_order_id: u64,
  inventory_item_id: u64,
  amount: u32,
  current_cost: Decimal,
}

pub struct WarehouseOrderItem {
  item: InventoryItem,
  amount: u32,
  current_cost: Decimal,
}

pub struct WarehouseOrder {
  id: u64,
  warehouse: Warehouse,
  account: Account,
  supplier: u64,
  date: i64,
  state: OrderState,
  items: Vec<WarehouseOrderItem>,
}
