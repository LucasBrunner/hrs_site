import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/inventory.dart';

Future<List<DataWithId<InventoryItem>>?> getProductPage(int pageNubmer, int itemsPerPage) async {
  final startItem = pageNubmer * itemsPerPage;
  final endItem = startItem + itemsPerPage;
  final response = await http.get(
    Uri.http(window.location.host, '/data/public/products'),
    headers: {'Range': 'index=$startItem-$endItem'},
  );

  print(response.body);
  switch (response.statusCode) {
    case 200:
      DataWithIdMapper.ensureInitialized();
      InventoryItemMapper.ensureInitialized();
      return MapperContainer.globals.fromJson<List<DataWithId<InventoryItem>>>(response.body);
    default:
      return null;
  }
}

void displayProductPage(List<DataWithId<InventoryItem>> items) {
  querySelector('#products')?.children
    ?..clear()
    ..addAll(items.map((item) => item.data.toDisplayRow()));
}

void displayError(DataError err) {}

void updateProducts(int pageNubmer, int itemsPerPage) async {
  final products = await getProductPage(pageNubmer, itemsPerPage);
  if (products == null) {
    querySelector('#products')?.children.add(HeadingElement.h3()..innerText = 'Couldn\'t retrive products');
    return;
  }
  displayProductPage(products);
}

void setup() async {
  updateProducts(0, 9);
}
