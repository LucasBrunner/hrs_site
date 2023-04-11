import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

part 'phone.mapper.dart';

@MappableClass()
class PhoneType with PhoneTypeMappable {
  int id;
  String name;

  PhoneType(
    this.id,
    this.name,
  );

  @override
  String toString() {
    return name;
  }
}

@MappableClass()
class Phone with PhoneMappable {
  int phoneId;
  String number;
  PhoneType phoneType;

  Phone(
    this.phoneId,
    this.number,
    this.phoneType,
  );

  @override
  String toString() {
    return '$phoneType: $number';
  }

  List<TableRowElement> toTableRows() {
    return [
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Type:',
          Element.td()..innerText = phoneType.name,
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Number:',
          Element.td()..innerText = number,
        ]),
    ];
  }
}
