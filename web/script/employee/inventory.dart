import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';
import 'warehouses.dart';

part 'inventory.mapper.dart';
part 'inventory.freezed.dart';

@MappableClass()
class WarehouseInventoryItem with WarehouseInventoryItemMappable implements ToOptionElement {
  int warehouseId;
  int inventoryItemId;
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  StringOptionInternallyTagged serial;
  StringOptionInternallyTagged description;
  int amount;

  WarehouseInventoryItem(
    this.warehouseId,
    this.inventoryItemId,
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.serial,
    this.description,
    this.amount,
  );

  TableRowElement appendToTableRow(TableRowElement row) {
    row.children
      ..add(TableCellElement()..innerText = model)
      ..add(TableCellElement()..innerText = serial.when(none: () => "N/A", some: (value) => value))
      ..add(TableCellElement()..innerText = description.when(none: () => "N/A", some: (value) => value))
      ..add(TableCellElement()..innerText = amount.toString());

    return row;
  }

  TableRowElement toTableRow() {
    return appendToTableRow(TableRowElement());
  }

  @override
  OptionElement toOptionElement() {
    return OptionElement()
      ..innerText = model
      ..value = inventoryItemId.toString();
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseInventoryResult with _$WarehouseInventoryResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseInventoryResult.ok(List<WarehouseInventoryItem> items) = _InventoryOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseInventoryResult.err(DataError err) = _InventoryErr;
}

Future<WarehouseInventoryResult> fetchWarehouseInventory(int warehouseId) async {
  final response = await http.get(
    Uri.http('127.0.0.1:8000', '/data/employee/warehouse/$warehouseId/inventory'),
  );

  print(response.body);
  try {
    return WarehouseInventoryResultMapper.fromJson(response.body);
  } catch (e) {
    print(e.toString());
    querySelector('body')?.children.add(HeadingElement.h2()..text = 'Bad data recived');
    return WarehouseInventoryResult.err(DataError.badData());
  }
}

saveWarehouseLocally(Warehouse warehouse) {
  window.sessionStorage['warehouse'] = warehouse.toJson();
  window.location.pathname = '/employee/warehouse.html';
}

_setWarehousesInventory(List<WarehouseInventoryItem> inventory) {
  final table = querySelector('#inventory');
  if (table == null) {
    return;
  }

  if (inventory.isEmpty) {
    print('No items in inventory');
    querySelector('body')?.children.insert(0, HeadingElement.h2()..text = 'No items in inventory');
    return;
  }

  table.querySelector('#inventory-table-header')?.style.display = 'table-row';

  for (var item in inventory) {
    final warehouseRow = TableRowElement();
    table.children.add(item.appendToTableRow(warehouseRow));
  }
}

void _appendAdjustInventoryItems(List<ToOptionElement> items) {
  print(items);
  var optionItems = items.map((e) => e.toOptionElement()).toList();
  print(optionItems);
  final children = querySelector('#item-update-select')?.children.toElements<OptionElement>();
  print(children);
  if (children == null) {
    print('Cannot find #item-update-select');
    return;
  }

  optionItems = optionItems.where((item) => children.where((option) => option.value == item.value).isEmpty).toList();
  print(optionItems.length);
  querySelector('#item-update-select')?.children.addAll(optionItems);
}

void _resetSelectedAdjustInventoryItem([String selected = 'default']) {
  final children = querySelector('#item-update-select')?.children.toElements<OptionElement>();
  if (children == null) {
    return;
  }

  children.forEach((element) => element.selected = false);
  children
      .firstWhere(
        (option) => option.value == selected,
        orElse: () => OptionElement(),
      )
      .selected = true;
}

void _displayWarehouseInventory(Warehouse warehouse) async {
  (await fetchWarehouseInventory(warehouse.id)).when(
      ok: (inventory) {
        _setWarehousesInventory(inventory);
        _appendAdjustInventoryItems(inventory);
      },
      err: (err) => {});
}

@MappableClass()
class InventoryItem with InventoryItemMappable implements ToOptionElement {
  int inventoryItemId;
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  StringOptionInternallyTagged serial;
  StringOptionInternallyTagged description;

  InventoryItem(
    this.inventoryItemId,
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.serial,
    this.description,
  );

  @override
  OptionElement toOptionElement() {
    return OptionElement()
      ..innerText = model
      ..value = inventoryItemId.toString();
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class InventoryItemResult with _$InventoryItemResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory InventoryItemResult.ok(List<InventoryItem> items) = _InventoryItemOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory InventoryItemResult.err(DataError err) = _InventoryItemErr;
}

void _setSearchResult(String text) {
  querySelector('#item-update-search-result')?.innerText = text;
}

void _searchItems(KeyboardEvent event) async {
  if (event.key == 'Enter') {
    final searchWords = querySelector('#item-update-search')?.toElement<InputElement>()?.value;
    if (searchWords == null || searchWords.isEmpty) {
      _setSearchResult('No input');
      return;
    }
    final response = await http.get(
      Uri.http(window.location.host, '/data/employee/inventory/search/${Uri.encodeComponent(searchWords)}'),
    );

    print(response.body);
    final result = InventoryItemResultMapper.fromJson(response.body);
    result.when(
      ok: (items) {
        if (items.isEmpty) {
          _setSearchResult('No items found');
          return;
        }
        _appendAdjustInventoryItems(items);
        if (items.length == 1) {
          _resetSelectedAdjustInventoryItem(items.single.inventoryItemId.toString());
          _setSearchResult('Item found');
          return;
        }
        _setSearchResult('Many items found');
      },
      err: (err) => {},
    );
  }
}

@MappableClass()
class WarehouseInventoryManualUpdate with WarehouseInventoryManualUpdateMappable {
  int inventoryItemId;
  int amount;

  WarehouseInventoryManualUpdate(
    this.inventoryItemId,
    this.amount,
  );
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseInventoryManualUpdateResult with _$WarehouseInventoryManualUpdateResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseInventoryManualUpdateResult.ok(List<WarehouseInventoryItem> items) = _InventoryUpdateOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseInventoryManualUpdateResult.err(DataError err) = _InventoryUpdateErr;
}

void _updateItemCount(Warehouse warehouse) async {
  final List<OptionElement> options = querySelector('#item-update-select')?.children.toElements() ?? List.empty();
  final selected = options.firstWhere((option) => option.selected == true, orElse: () => OptionElement()..value = 'default');
  if (selected.value == 'default') {
    return;
  }
  final selectedId = int.tryParse(selected.value);
  if (selectedId == null) {
    return;
  }

  final adjustCountString = querySelector('#inventory-item-update-amount')?.toElement<InputElement>()?.value ?? "0";
  final adjustCount = int.tryParse(adjustCountString);
  if (adjustCount == null) {
    return;
  }

  final update = WarehouseInventoryManualUpdate(
    selectedId,
    adjustCount,
  );

  final response = await http.post(
    Uri.http(window.location.host, '/data/employee/warehouse/${warehouse.id}/inventory/manual_update'),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
    body: update.toJson(),
  );
}

void _setupInventorySearchButton(Warehouse warehouse) {
  querySelector('#item-update-search')?.toElement<InputElement>()?.onKeyPress.listen((event) => _searchItems(event));

  querySelector('#item-update-submit')?.toElement<ButtonElement>()?.onClick.listen((event) => _updateItemCount(warehouse));
}

void setup() {
  final warehouse = _getWarehouseFromLocalStorage();
  if (warehouse == null) {
    querySelector('body')?.children.insert(0, HeadingElement.h2()..text = 'Warehouse not found');
    return;
  }
  _displayWarehouseInventory(warehouse);
  _setupInventorySearchButton(warehouse);
  _resetSelectedAdjustInventoryItem();
}

Warehouse? _getWarehouseFromLocalStorage() {
  try {
    return WarehouseMapper.fromJson(window.sessionStorage['warehouse'] ?? "");
  } catch (e) {
    return null;
  }
}
