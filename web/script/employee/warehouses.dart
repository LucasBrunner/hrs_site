import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';
import 'warehouse.dart';

part 'warehouses.mapper.dart';
part 'warehouses.freezed.dart';

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

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseResult with _$WarehouseResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseResult.ok(List<Warehouse> warehouses) = _WarehouseOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseResult.err(DataError err) = _WarehouseErr;
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
        ..onClick.listen((event) => saveWarehouseLocally(warehouse))));
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
