import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/inventory.dart';
import '../data/warehouse.dart';
import '../html_utility.dart';

part 'warehouse.mapper.dart';

Future<List<ItemCount<DataWithId<InventoryItem>>>?> fetchWarehouseInventory(int warehouseId) async {
  final response = await http.get(
    Uri.http(window.location.host, '/data/employee/warehouse/$warehouseId/inventory'),
  );

  print(response.body);
  if (response.statusCode != 200) {
    querySelector('body')?.children.add(HeadingElement.h2()..text = 'Bad data recived');
    return null;
  }

  try {
    ItemCountMapper.ensureInitialized();
    DataWithIdMapper.ensureInitialized();
    InventoryItemMapper.ensureInitialized();
    return MapperContainer.globals.fromJson<List<ItemCount<DataWithId<InventoryItem>>>>(response.body);
  } catch (e) {
    print(e);
    return null;
  }
}

saveWarehouseLocally(DataWithId<Warehouse> warehouse) {
  window.sessionStorage['warehouse'] = warehouse.toJson();
  window.location.pathname = '/employee/warehouse.html';
}

_setWarehousesInventory(List<ItemCount<DataWithId<InventoryItem>>> inventory) {
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

  for (var itemCount in inventory) {
    table.children.add(TableRowElement()
      ..children.addAll([
        TableCellElement()..innerText = itemCount.item.data.model,
        TableCellElement()..innerText = itemCount.item.data.description.when(none: () => "N/A", some: (value) => value),
        TableCellElement()..innerText = itemCount.count.toString(),
      ]));
  }
}

void _clearWarehouseInventory() {
  querySelector('#inventory')?.children.clear();
}

void _appendAdjustInventoryItems(List<DataWithId<InventoryItem>> items) {
  var optionItems = items.map((e) => e.toOptionElement()).toList();
  final children = querySelector('#item-update-select')?.children.toElements<OptionElement>();
  if (children == null) {
    print('Cannot find #item-update-select');
    return;
  }

  optionItems = optionItems.where((item) => children.where((option) => option.value == item.value).isEmpty).toList();
  querySelector('#item-update-select')?.children.addAll(optionItems);
}

void _resetSelectedAdjustInventoryItem([String selected = 'default']) {
  final children = querySelector('#item-update-select')?.children.toElements<OptionElement>();
  if (children == null) {
    return;
  }

  for (var element in children) {
    element.selected = false;
  }
  children
      .firstWhere(
        (option) => option.value == selected,
        orElse: () => OptionElement(),
      )
      .selected = true;
}

void _displayWarehouseInventory(DataWithId<Warehouse> warehouse) async {
  final warehouseItems = await fetchWarehouseInventory(warehouse.id);
  if (warehouseItems == null) {
    return;
  }
  _setWarehousesInventory(warehouseItems);
  _appendAdjustInventoryItems(warehouseItems.itemList());
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
    if (response.statusCode == 200) {
      DataWithIdMapper.ensureInitialized();
      InventoryItemMapper.ensureInitialized();
      final items = MapperContainer.globals.fromJson<List<DataWithId<InventoryItem>>>(response.body);
      if (items.isEmpty) {
        _setSearchResult('No items found');
        return;
      }
      _appendAdjustInventoryItems(items);
      if (items.length == 1) {
        _resetSelectedAdjustInventoryItem(items.single.id.toString());
        _setSearchResult('Item found');
        return;
      }
      _setSearchResult('Many items found');
    }
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

void _updateItemCount(DataWithId<Warehouse> warehouse) async {
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
      'Content-type': 'application/json',
    },
    body: update.toJson(),
  );

  if (response.statusCode == 201) {
    _clearWarehouseInventory();
    _displayWarehouseInventory(warehouse);
  }
}

void _setupInventorySearchButton(DataWithId<Warehouse> warehouse) {
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

DataWithId<Warehouse>? _getWarehouseFromLocalStorage() {
  try {
    DataWithIdMapper.ensureInitialized();
    WarehouseMapper.ensureInitialized();
    return MapperContainer.globals.fromJson<DataWithId<Warehouse>>(window.sessionStorage['warehouse'] ?? "");
  } catch (e) {
    return null;
  }
}
