import 'dart:html';

import 'package:dart_mappable/dart_mappable.dart';

part 'address.mapper.dart';

@MappableClass()
class Address with AddressMappable {
  String street;
  String city;
  String state;
  String zip;

  Address(
    this.street,
    this.city,
    this.state,
    this.zip,
  );

  static Address defaultAddress() {
    uniqueNegativeId -= 1;
    return Address('', '', 'Arizona', '');
  }

  @override
  String toString() {
    return '$street, $city, $state $zip';
  }

  List<TableRowElement> toTableViewRows() {
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

  List<TableRowElement> toTableEditRows() {
    return [
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Street:',
          Element.td()
            ..children.add(InputElement()
              ..className = 'address-street'
              ..type = 'text'
              ..value = street),
          Element.td()..className = 'address-street-message',
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'City:',
          Element.td()
            ..children.add(InputElement()
              ..className = 'address-city'
              ..type = 'text'
              ..value = city),
          Element.td()..className = 'address-city-message',
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'State:',
          Element.td()..children.add(stateInput(selected: state)..className = 'address-state'),
          Element.td()..className = 'address-state-message',
        ]),
      TableRowElement()
        ..children.addAll([
          Element.th()..innerText = 'Zip:',
          Element.td()
            ..children.add(InputElement()
              ..className = 'address-zip'
              ..type = 'text'
              ..value = zip),
          Element.td()..className = 'address-zip-message',
        ]),
    ];
  }
}

int uniqueNegativeId = -1;

SelectElement stateInput({String selected = ''}) {
  final input = SelectElement();
  input.id = 'customer-state-selection';
  input.children.addAll(states.map((state) {
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
        ..selected = selected.isEmpty
        ..disabled = true);
  return input;
}

final List<String> states = List.from([
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  'Delaware',
  'Florida',
  'Georgia',
  'Hawaii',
  'Idaho',
  'Illinois',
  'Indiana',
  'Iowa',
  'Kansas',
  'Kentucky',
  'Louisiana',
  'Maine',
  'Maryland',
  'Massachusetts',
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri',
  'Montana',
  'Nebraska',
  'Nevada',
  'New Hampshire',
  'New Jersey',
  'New Mexico',
  'New York',
  'North Carolina',
  'North Dakota',
  'Ohio',
  'Oklahoma',
  'Oregon',
  'Pennsylvania',
  'Rhode Island',
  'South Carolina',
  'South Dakota',
  'Tennessee',
  'Texas',
  'Utah',
  'Vermont',
  'Virginia',
  'Washington',
  'West Virginia',
  'Wisconsin',
  'Wyoming',
]);
