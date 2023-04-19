import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data.dart';

part 'inventory.mapper.dart';
part 'inventory.freezed.dart';

@MappableClass(generateMethods: GenerateMethods.encode | GenerateMethods.decode)
class InventoryItem with InventoryItemMappable implements HasTitle, ToDisplayRow {
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  OptionInternallyTagged<String> description;

  InventoryItem(
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.description,
  );

  @override
  String title() {
    return model;
  }

  String descriptionString() {
    return description.when(
      none: () => "N/A",
      some: (data) => data,
    );
  }

  TableRowElement _modelRow() {
    return TableRowElement()
      ..children.addAll([
        Element.th()..innerText = 'Product:',
        Element.td()..innerText = model,
      ]);
  }

  TableRowElement? _descriptionRow() {
    return description.when(
      none: () => null,
      some: (data) => TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Description:',
          Element.td()..innerText = data,
        ]),
    );
  }

  TableRowElement _priceRow() {
    return TableRowElement()
      ..children.addAll([
        Element.th()..innerText = 'Price:',
        Element.td()..innerText = listPrice.toString(),
      ]);
  }

  TableRowElement _brandRow() {
    return TableRowElement()
      ..children.addAll([
        Element.th()..innerText = 'Brand:',
        Element.td()..innerText = brandName,
      ]);
  }

  List<TableRowElement> _productTableRows() {
    final rows = <TableRowElement>[];
    rows.add(_modelRow());
    final desc = _descriptionRow();
    if (desc != null) {
      rows.add(desc);
    }
    rows.add(_priceRow());
    rows.add(_brandRow());
    return rows;
  }

  @override
  DivElement toDisplayRow({Element? belowTable}) {
    final container = DivElement()..className = 'product-item';
    container.children.add(ImageElement()..alt = "model: $model, brand: $brandName, description: ${descriptionString()}");
    container.children.add(DivElement()..children.add(TableElement()..children.addAll(_productTableRows())));
    if (belowTable != null) {
      container.children.add(belowTable);
    }
    return container;
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

@MappableClass(generateMethods: GenerateMethods.encode | GenerateMethods.decode)
class WarehouseInventoryItem with WarehouseInventoryItemMappable implements HasTitle {
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  OptionInternallyTagged<String> description;
  int amount;

  WarehouseInventoryItem(
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.description,
    this.amount,
  );

  @override
  String title() {
    return model;
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
