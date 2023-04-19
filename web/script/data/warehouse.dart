import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

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
}
