import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';

part 'warehouse.mapper.dart';
part 'warehouse.freezed.dart';

@MappableClass()
class Warehouse with WarehouseMappable {
  int id;
  String name;
  String phoneType;
  String phoneNumber;
  String addressStreet;
  String addressCity;
  String addressState;
  String addressZip;

  Warehouse(
    this.id,
    this.name,
    this.phoneType,
    this.phoneNumber,
    this.addressStreet,
    this.addressCity,
    this.addressState,
    this.addressZip,
  );

  TableRowElement appendToTableRow(TableRowElement row) {
    row.children
      ..add(TableCellElement()..innerText = name)
      ..add(TableCellElement()..innerText = '$addressStreet, $addressCity, $addressState $addressZip')
      ..add(TableCellElement()..innerText = '$phoneType: $phoneNumber');

    return row;
  }

  TableRowElement toTableRow() {
    return appendToTableRow(TableRowElement());
  }
}

@MappableClass()
class WarehouseInventoryItem with WarehouseInventoryItemMappable {
  int warehouse_id;
  int inventory_item_id;
  double cost;
  double list_price;
  int brand_id;
  String brand_name;
  String model;
  StringOptionInternallyTagged serial;
  StringOptionInternallyTagged description;
  int amount;

  WarehouseInventoryItem(
    this.warehouse_id,
    this.inventory_item_id,
    this.cost,
    this.list_price,
    this.brand_id,
    this.brand_name,
    this.model,
    this.serial,
    this.description,
    this.amount,
  );

  TableRowElement appendToTableRow(TableRowElement row) {
    row.children
      ..add(TableCellElement()..innerText = model)
      ..add(TableCellElement()..innerText = serial.when(none: () => "", some: (value) => value));

    return row;
  }

  TableRowElement toTableRow() {
    return appendToTableRow(TableRowElement());
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseResult with _$WarehouseResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseResult.ok(List<Warehouse> warehouses) = _Ok;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseResult.err(DataError err) = _Err;
}

showWarehouseSetup(Warehouse warehouse) {
  window.sessionStorage['warehouse'] = warehouse.toJson();
  window.location.pathname = '/employee/warehouse.html';
}

displayWarehouses(List<Warehouse> warehouses) {
  final warehouseTable = querySelector('#warehouses')?.toElement<TableElement>();
  if (warehouseTable == null) {
    return;
  }

  for (var warehouse in warehouses) {
    final warehouseRow = TableRowElement();
    warehouseRow.children.add(TableCellElement()
      ..children.add(ButtonElement()
        ..innerText = 'View Inventory'
        ..onClick.listen((event) => showWarehouseSetup(warehouse))));
    warehouseTable.children.add(warehouse.appendToTableRow(warehouseRow));
  }
}

showWarehouses() async {
  final response = await http.get(
    Uri.http('127.0.0.1:8000', '/data/employee/warehouses'),
  );

  print(response.body);
  try {
    final warehouses = WarehouseResultMapper.fromJson(response.body);
    warehouses.when(ok: (warehouses) => displayWarehouses(warehouses), err: (err) => {});
  } catch (e) {
    print(e.toString());
  }
}

showWarehouse() async {
  Warehouse warehouse;
  try {
    warehouse = WarehouseMapper.fromJson(window.sessionStorage['warehouse'] ?? "");
  } catch (e) {
    querySelector('body')?.children.add(HeadingElement.h2()..text = 'Warehouse not found');
  }
}
