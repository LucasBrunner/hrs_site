import 'dart:html';
import './html_utility.dart';

setup() {
  print(querySelector('#view-warehouses-button'));
  print(querySelector('#view-warehouses-button')?.toElement<ButtonElement>());
  querySelector('#view-warehouses-button')?.toElement<ButtonElement>()?.onClick.listen((event) => window.location.pathname = '/html/warehouse.html');
}
