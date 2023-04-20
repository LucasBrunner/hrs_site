import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';
import 'warehouse.dart';
import '../data/warehouse.dart';

displayWarehouses(List<DataWithId<Warehouse>> warehouses) {
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
    warehouseTable.children.add(warehouse.data.appendToTableRow(warehouseRow));
  }
}

showWarehouses() async {
  final response = await http.get(
    Uri.http(window.location.host, '/data/warehouses'),
  );

  print(response.body);
  if (response.statusCode == 200) {
    try {
      DataWithIdMapper.ensureInitialized();
      WarehouseMapper.ensureInitialized();
      final warehouses = MapperContainer.globals.fromJson<List<DataWithId<Warehouse>>>(response.body);
      displayWarehouses(warehouses);
    } catch (e) {
      print(e.toString());
    }
  }
}
