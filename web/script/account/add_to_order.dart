import 'dart:html';

import '../data.dart';
import '../data/inventory.dart';
import '../data/order.dart';
import '../data/warehouse.dart';
import '../html_utility.dart';

void setNoOrdersFound() {
  final selector = querySelector('#order-selector');
  if (selector != null) {
    selector.clearOptions(['no-orders-found']);
    selector.children.add(OptionElement()
      ..selected = true
      ..disabled = true
      ..id = 'no-orders-found'
      ..innerText = '— No Orders Found —');
  }
}

void setNoWarehousesFound() {
  final selector = querySelector('#warehouse-selector');
  if (selector != null) {
    selector.clearOptions(['no-warhouses-found']);
    selector.children.add(OptionElement()
      ..selected = true
      ..disabled = true
      ..id = 'no-warhouses-found'
      ..innerText = '— No Warehouses Stock this Item —');
  }
}

void asyncSetup(int productId) async {
  final awaitItem = InventoryItem.httpGetId(productId);
  final awaitOrderSummaries = OrderSummary.httpGetImplicit(state: OrderState.pending);
  final awaitItemWarehouses = Warehouse.httpGetWarehousesStockedWithItem(productId);

  final item = await awaitItem;
  final orderSummaries = await awaitOrderSummaries;
  final itemWarehouses = await awaitItemWarehouses;
  if (item == null) {
    querySelector('#item')?.children.add(HeadingElement.h2()..innerText = 'Could not find product');
    return;
  }

  final orderSelector = querySelector('#order-selector');
  if (orderSummaries != null && orderSummaries.isNotEmpty && orderSelector != null) {
    orderSelector.children.addAll(orderSummaries.map((orderSummary) => OptionElement()
      ..value = orderSummary.id.toString()
      ..innerText = orderSummary.data.orderName));
  } else {
    setNoOrdersFound();
  }

  final warehouseSelector = querySelector('#warehouse-selector')?.toElement<SelectElement>();
  if (itemWarehouses != null && itemWarehouses.isNotEmpty && warehouseSelector != null) {
    if (itemWarehouses.length == 1) {
      warehouseSelector.clearOptions();
      warehouseSelector.children.add(OptionElement()
        ..value = itemWarehouses.single.id.toString()
        ..selected = true
        ..innerText = '${itemWarehouses.single.data.name} - ${itemWarehouses.single.data.addressCity}');
    } else {
      warehouseSelector.children.addAll(itemWarehouses.map((warehouse) => OptionElement()
        ..value = warehouse.id.toString()
        ..innerText = '${warehouse.data.name} - ${warehouse.data.addressCity}'));
    }
  } else {
    setNoWarehousesFound();
  }

  querySelector('#item')?.children.addAll(item.toDisplayElements());
}

void setup() async {
  querySelector('#new-order-create')?.onClick.listen((event) async {
    final newOrderName = querySelector('#new-order-name')?.toElement<InputElement>()?.value;
    if (newOrderName == null || newOrderName.isEmpty) {
      querySelector('#new-order-error-message')?.innerText = 'Enter a name for the order';
      return;
    }

    final newOrder = await postNewOrder(newOrderName);
    final selector = querySelector('#order-selector');
    selector?.clearOptions(['no-orders-found']);
    if (newOrder == null) {
      selector?.children.add(OptionElement()
        ..selected = true
        ..disabled = true
        ..id = 'no-orders-found'
        ..innerText = '— No Orders Found —');
      return;
    }

    selector?.children.add(OptionElement()
      ..selected = true
      ..id = newOrder.id.toString()
      ..innerText = newOrder.data.orderName);

    querySelector('#new-order-error-message')?.innerText = '';
  });

  final productIdString = Uri.dataFromString(window.location.href).queryParameters['product_id'];
  if (productIdString == null) {
    querySelector('#item')?.children.add(HeadingElement.h2()..innerText = 'No item selected');
    return;
  }

  final productId = int.tryParse(productIdString);
  if (productId == null) {
    querySelector('#item')?.children.add(HeadingElement.h2()..innerText = 'Invalid product ID');
    return;
  }

  querySelector("#order-update-submit")?.onClick.listen((event) async {
    final orderId = int.tryParse(querySelector('#order-selector')?.toElement<SelectElement>()?.value ?? '');
    final itemCount = int.tryParse(querySelector('#count-selector')?.toElement<InputElement>()?.value ?? '');
    final warehouseId = int.tryParse(querySelector('#warehouse-selector')?.toElement<SelectElement>()?.value ?? '');
    print('$orderId, $itemCount');
    if (itemCount == null || orderId == null || warehouseId == null) {
      return;
    }
    final updateResult = await OrderUpdate(UpdateType.ignore(), UpdateType.ignore(), [
      UpdateType.put(OrderItemUpdate(
        productId,
        itemCount,
        warehouseId,
      ))
    ]).httpPut(orderId);
    if (updateResult) {
      window.location.href = document.referrer;
    }
  });

  asyncSetup(productId);
}
