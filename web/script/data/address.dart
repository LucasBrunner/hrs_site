import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

part 'address.mapper.dart';

@MappableClass()
class Address with AddressMappable {
  int id;
  String street;
  String city;
  String state;
  String zip;

  Address(
    this.id,
    this.street,
    this.city,
    this.state,
    this.zip,
  );

  @override
  String toString() {
    return '$street, $city, $state $zip';
  }

  List<TableRowElement> toTableRows() {
    return [
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Street:',
          Element.td()..innerText = street,
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'City:',
          Element.td()..innerText = city,
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'State:',
          Element.td()..innerText = state,
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Zip:',
          Element.td()..innerText = zip,
        ]),
    ];
  }
}
