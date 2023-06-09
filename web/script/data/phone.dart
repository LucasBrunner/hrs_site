import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

import '../data.dart';

part 'phone.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum PhoneType {
  landline(id: 1, formalName: 'Landline'),
  mobile(id: 2, formalName: 'Mobile');

  final int id;
  final String formalName;

  const PhoneType({
    required this.id,
    required this.formalName,
  });
}

@MappableClass()
class Phone with PhoneMappable {
  String number;
  PhoneType phoneType;

  Phone(
    this.number,
    this.phoneType,
  );

  @override
  String toString() {
    return '$phoneType: $number';
  }

  static Phone defaultPhone() {
    return Phone('', PhoneType.mobile);
  }

  List<TableRowElement> toTableViewRows() {
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

  List<TableRowElement> toTableEditRows() {
    return List.from([
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Number',
          Element.td()
            ..children.add(InputElement()
              ..value = number
              ..className = 'phone-number'),
          Element.td()..classes.addAll(['phone-number-message', 'error-message']),
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Type',
          Element.td()..children.add(phoneTypeInput(selected: phoneType)..className = 'phone-type'),
          Element.td()..classes.addAll(['phone-type-message', 'error-message']),
        ]),
    ]);
  }

  static TableElement phoneInputTable(String id, Phone phone) {
    return TableElement()
      ..setAttribute('data-phone-id', id)
      ..className = 'phone-input'
      ..children.addAll(phone.toTableEditRows()
        ..addDeleteButton(
          'Remove phone',
          'deleting phone with id of $id',
          () => querySelector('.phone-input[data-phone-id="$id"]')?.remove(),
        ));
  }
}

int uniqueNegativeId = -1;

SelectElement phoneTypeInput({PhoneType? selected}) {
  final input = SelectElement();
  input.children.addAll(PhoneType.values.map((type) {
    return OptionElement()
      ..value = type.formalName
      ..innerText = type.formalName
      ..selected = type.name == selected?.name;
  }));
  input.children.insert(
      0,
      OptionElement()
        ..value = ''
        ..innerText = '— Select One —'
        ..selected = selected == null
        ..disabled = true);
  return input;
}
