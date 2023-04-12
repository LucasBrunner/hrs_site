import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

import '../data.dart';

part 'phone.mapper.dart';

@MappableClass()
class PhoneType with PhoneTypeMappable {
  int phoneTypeId;
  String name;

  PhoneType(
    this.phoneTypeId,
    this.name,
  );

  @override
  String toString() {
    return name;
  }
}

class PhoneOptions {
  String onDeleteMessage;
  void Function() onDelete;

  PhoneOptions(
    this.onDeleteMessage,
    this.onDelete,
  );

  static PhoneOptions fromPhone(Phone phone) {
    return PhoneOptions(
      'Remove phone from account',
      () => querySelector('.phone-input[data-phone-id="${phone.phoneId}"]')?.remove(),
    );
  }
}

@MappableClass()
class Phone extends ToInputTable<PhoneOptions> with PhoneMappable {
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

  static Phone defaultPhone() {
    uniqueNegativeId -= 1;
    return Phone(uniqueNegativeId, '', PhoneType(0, 'Mobile'));
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

  List<TableRowElement> _toTableEditRows() {
    return List.from([
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Number',
          Element.td()
            ..children.add(InputElement()..value = number)
            ..className = 'phone-number'
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Phone Type',
          Element.td()..children.add(phoneTypeInput(selected: phoneType.name)..className = 'phone-type'),
        ]),
    ]);
  }

  @override
  TableElement toInputTable(PhoneOptions options) {
    return TableElement()
      ..setAttribute('data-phone-id', phoneId)
      ..className = 'phone-input'
      ..children.addAll(_toTableEditRows()
        ..addDeleteButton(
          options.onDeleteMessage,
          options.onDelete,
        ));
  }
}

int uniqueNegativeId = -1;

SelectElement phoneTypeInput({String selected = ''}) {
  final input = SelectElement();
  input.children.addAll(phoneTypes.map((state) {
    return OptionElement()
      ..value = state
      ..innerText = state
      ..selected = state == selected;
  }));
  input.children.insert(
      0,
      OptionElement()
        ..value = ''
        ..innerText = '— Select One —'
        ..selected = selected.isEmpty);
  return input;
}

final List<String> phoneTypes = List.from([
  'Landline',
  'Mobile',
]);
