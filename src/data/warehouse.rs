use super::{address::Address, phone::Phone, inventory_item::InventoryItem};

pub struct DbWarehouse {
  id: u64,
  name: String,
  address: u64,
  phone_id: u64,
}

pub struct Warehouse {
  id: u64,
  name: String,
  address: Address,
  phone: Phone,
}

pub struct DbWarehouseItem {
  warehouse_id: u64,
  item_id: u64,
  amount: u32,
}

pub struct WarehouseItem {
  warehouse: Warehouse,
  item: InventoryItem,
  amount: u32,
}