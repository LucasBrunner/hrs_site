pub struct DbSaleOrder {
  sale_order_id: u64,
  account_id: u64,
  date: i64,
  address_id: u64,
  state_id: u64,
}

pub struct DbSaleOrderItem {
  sale_order_id: u64,
  inventory_item_id: u64,
  warehouse_id: u64,
  amount: u32,
  current_price: Decimal,
}

pub struct SaleOrder {
  id: u64,
  account: Account,
  date: i64,
  address: Address,
  state: OrderState,
}