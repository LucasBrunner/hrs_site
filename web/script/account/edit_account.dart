import 'dart:html';

import '../data.dart';
import '../data/account.dart';
import '../data/address.dart';
import '../data/phone.dart';

int _tempId = 0;

String nextTempId() => 'temp-${_tempId++}';

TableElement addressInputTable(String id, Address address) {
  return TableElement()
    ..setAttribute('data-address-id', id)
    ..className = 'address-input'
    ..children.addAll(address.toTableEditRows()
      ..addDeleteButton(
        'Remove address',
        'deleting address with id of $id',
        () => querySelector('.address-input[data-address-id="$id"]')?.remove(),
      ));
}

TableElement _localAddressInputTable() {
  return addressInputTable(nextTempId(), Address.defaultAddress());
}

TableElement phoneInputTable(String id, Phone phone) {
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

TableElement _localPhoneInputTable() {
  return phoneInputTable(nextTempId(), Phone.defaultPhone());
}

bool _saveData(Account account) {
  return false;
}

List<Element> accountEditTableRows(Account account) {
  final rows = List<Element>.empty(growable: true);

  rows.add(TableRowElement()
    ..children.addAll([
      Element.th()..innerText = 'Legal Name:',
      Element.td()..innerHtml = '${account.data.legalName} <small><i>Please contact support to change your legal name.</i></small>',
    ]));
  rows.add(TableRowElement()
    ..children.addAll([
      Element.th()..innerText = 'Email Address:',
      Element.td()..innerHtml = '${account.data.email} <small><i>Please contact support to change your email.</i></small>',
    ]));
  rows.add(TableRowElement()
    ..children.addAll([
      Element.th()..innerText = 'Preferred Name:',
      Element.td()
        ..children.add(InputElement()
          ..id = 'account-preferred-name'
          ..type = 'text'
          ..value = account.data.preferredName),
    ]));

  final addressRow = TableRowElement();
  addressRow.children.add(Element.th()..innerText = 'Addresses:');
  addressRow.children.add(Element.td()
    ..children.addAll([
      DivElement()
        ..id = 'addresses'
        ..children.addAll(account.addresses.map((address) => addressInputTable(address.id.toString(), address.data))),
      DivElement()
        ..children.add(ButtonElement()
          ..innerText = 'Add address to account'
          ..onClick.listen(
            (event) => querySelector('#addresses')?.children.add(_localAddressInputTable()),
          )),
    ]));
  rows.add(addressRow);

  final phoneRow = TableRowElement();
  phoneRow.children.add(Element.th()..innerText = 'Phones:');
  phoneRow.children.add(Element.td()
    ..children.addAll([
      DivElement()
        ..id = 'phones'
        ..children.addAll(account.phones.map((phone) => phoneInputTable(phone.id.toString(), phone.data))),
      DivElement()
        ..children.add(ButtonElement()
          ..innerText = 'Add phone to account'
          ..onClick.listen(
            (event) => querySelector('#phones')?.children.add(_localPhoneInputTable()),
          )),
    ]));
  rows.add(phoneRow);

  final finishButtonsRow = TableRowElement()
    ..children.addAll([
      TableCellElement()
        ..style.display = 'flex'
        ..style.justifyContent = 'right'
        ..children.add(DivElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Save changes'
          ..onClick.listen((event) {
            if (_saveData(account)) {
              // window.location.pathname = '/customer/account.html';
            }
          })),
      TableCellElement()
        ..children.add(DivElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Don\'t save changes'
          ..onClick.listen((event) => window.location.pathname = '/customer/account.html')),
    ]);
  rows.add(finishButtonsRow);

  return rows;
}

void setup() async {
  final account = await Account.httpGetImplicit();
  if (account == null) {
    querySelector('body')?.children.insert(1, HeadingElement.h2()..text = 'Account not found');
    return;
  }

  querySelector('#account-edit-table')?.children.addAll(accountEditTableRows(account));
}
