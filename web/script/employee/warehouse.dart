import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;
import '../data/address.dart';
import '../data/phone.dart';
import '../html_utility.dart';

part 'warehouse.mapper.dart';

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

setup() async {
  final warehouseTable = querySelector('#warehouses')?.toElement<TableElement>();
  if (warehouseTable == null) {
    return;
  }

  final response = await http.get(
    Uri.http('127.0.0.1:8000', '/employee/warehouses'),
  );

  List<Warehouse> warehouses = MapperContainer().fromJson(response.body);
  for (var warehouse in warehouses) {}
}
