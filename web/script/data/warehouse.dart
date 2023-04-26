import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:dart_mappable/dart_mappable.dart';

import '../data.dart';

part 'warehouse.mapper.dart';

@MappableClass()
class Warehouse with WarehouseMappable {
  String name;
  String phoneType;
  String phoneNumber;
  String addressStreet;
  String addressCity;
  String addressState;
  String addressZip;

  Warehouse(
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

  static Future<List<DataWithId<Warehouse>>?> httpGetWarehousesStockedWithItem(int itemId) async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/inventory/$itemId/warehouses'),
    );

    print(response.body);
    switch (response.statusCode) {
      case 200:
        if (response.body.isEmpty) {
          return null;
        }
        WarehouseMapper.ensureInitialized();
        DataWithIdMapper.ensureInitialized();
        return MapperContainer.globals.fromJson<List<DataWithId<Warehouse>>>(response.body);
      default:
        return null;
    }
  }
}
