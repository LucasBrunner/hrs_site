import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import '../data.dart';

part 'inventory.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.encode | GenerateMethods.decode)
class InventoryItem with InventoryItemMappable implements HasTitle, ToDisplayRow {
  double cost;
  double listPrice;
  int brandId;
  String brandName;
  String model;
  OptionInternallyTagged<String> description;
  OptionInternallyTagged<String> imageUrl;

  InventoryItem(
    this.cost,
    this.listPrice,
    this.brandId,
    this.brandName,
    this.model,
    this.description,
    this.imageUrl,
  );

  @override
  String title() {
    return '$model${description.when(some: (some) => ' - $some', none: () => '')}';
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
        Element.td()..innerText = '\$${listPrice.toStringAsFixed(2)}',
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
    container.children.add(ImageElement()
      ..src = imageUrl.when(some: (url) => './$url', none: () => '')
      ..alt = "model: $model, brand: $brandName, description: ${descriptionString()}");
    container.children.add(DivElement()..children.add(TableElement()..children.addAll(_productTableRows())));
    if (belowTable != null) {
      container.children.add(belowTable);
    }
    return container;
  }
}
