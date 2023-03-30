import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../data/address.dart';
import '../data/phone.dart';
import '../html_utility.dart';

part 'warehouse.mapper.dart';
part 'warehouse.freezed.dart';

@MappableClass()
class Warehouse with WarehouseMappable {
  int id;
  String name;
  Address address;
  Phone phone;

  Warehouse(
    this.id,
    this.name,
    this.address,
    this.phone,
  );

  TableRowElement appendToTableRow(TableRowElement row) {
    row.children
      ..add(TableCellElement()..innerText = name)
      ..add(TableCellElement()..innerText = address.toString())
      ..add(TableCellElement()..innerText = phone.toString());

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

displayWarehouses(List<Warehouse> warehouses) {
  final warehouseTable = querySelector('#warehouses')?.toElement<TableElement>();
  if (warehouseTable == null) {
    return;
  }

  for (var warehouse in warehouses) {
    warehouseTable.children.add(warehouse.toTableRow());
  }
}

setup() async {
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
