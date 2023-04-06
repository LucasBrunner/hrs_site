import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../data.dart';
import '../html_utility.dart';

part 'inventory.mapper.dart';
part 'inventory.freezed.dart';

@MappableClass()
class InventoryItem with InventoryItemMappable implements ToOptionElement {
  int inventoryItemId;
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  StringOptionInternallyTagged serial;
  StringOptionInternallyTagged description;

  InventoryItem(
    this.inventoryItemId,
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.serial,
    this.description,
  );

  @override
  OptionElement toOptionElement() {
    return OptionElement()
      ..innerText = model
      ..value = inventoryItemId.toString();
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class InventoryItemResult with _$InventoryItemResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory InventoryItemResult.ok(List<InventoryItem> items) = _InventoryItemOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory InventoryItemResult.err(DataError err) = _InventoryItemErr;
}

@MappableClass()
class WarehouseInventoryItem with WarehouseInventoryItemMappable implements ToOptionElement {
  int warehouseId;
  int inventoryItemId;
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  StringOptionInternallyTagged serial;
  StringOptionInternallyTagged description;
  int amount;

  WarehouseInventoryItem(
    this.warehouseId,
    this.inventoryItemId,
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.serial,
    this.description,
    this.amount,
  );

  TableRowElement appendToTableRow(TableRowElement row) {
    row.children
      ..add(TableCellElement()..innerText = model)
      ..add(TableCellElement()..innerText = serial.when(none: () => "N/A", some: (value) => value))
      ..add(TableCellElement()..innerText = description.when(none: () => "N/A", some: (value) => value))
      ..add(TableCellElement()..innerText = amount.toString());

    return row;
  }

  TableRowElement toTableRow() {
    return appendToTableRow(TableRowElement());
  }

  @override
  OptionElement toOptionElement() {
    return OptionElement()
      ..innerText = model
      ..value = inventoryItemId.toString();
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class WarehouseInventoryResult with _$WarehouseInventoryResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory WarehouseInventoryResult.ok(List<WarehouseInventoryItem> items) = _InventoryOk;
  @MappableClass(discriminatorValue: 'Err')
  const factory WarehouseInventoryResult.err(DataError err) = _InventoryErr;
}
