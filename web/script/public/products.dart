import 'dart:html';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/inventory.dart';

Future<InventoryItemResult> getProductPage(int pageNubmer, int itemsPerPage) async {
  final response = await http.get(
    Uri.http(window.location.host, '/data/public/products/$pageNubmer/$itemsPerPage'),
  );

  print(response.body);
  return InventoryItemResultMapper.fromJson(response.body);
}

void displayProductPage(List<InventoryItem> items) {
  querySelector('#products')?.children
    ?..clear()
    ..addAll(items.map((item) => item.toDisplayRow()));
}

void displayError(DataError err) {
  querySelector('#products')?.children.add(HeadingElement.h3()..innerText = err.getErrorMessage());
}

void updateProducts(int pageNubmer, int itemsPerPage) async {
  (await getProductPage(pageNubmer, itemsPerPage)).when(ok: (items) => displayProductPage(items), err: (err) => displayError(err));
}

void setup() async {
  updateProducts(0, 10);
}
