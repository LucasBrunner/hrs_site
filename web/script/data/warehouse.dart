import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data.dart';

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

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseResult with _$WarehouseResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseResult.ok(List<Warehouse> warehouses) = _WarehouseOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseResult.err(DataError err) = _WarehouseErr;
}
