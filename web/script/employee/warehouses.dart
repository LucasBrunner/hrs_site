import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';
import 'warehouse.dart';
import '../data/warehouse.dart';

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
    Uri.http(window.location.host, '/data/employee/warehouses'),
  );

  print(response.body);
  try {
    final warehouses = WarehouseResultMapper.fromJson(response.body);
    warehouses.when(ok: (warehouses) => displayWarehouses(warehouses), err: (err) => {});
  } catch (e) {
    print(e.toString());
  }
}
