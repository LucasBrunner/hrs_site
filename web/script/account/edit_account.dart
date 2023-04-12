import 'dart:html';

import '../data/account.dart';
import '../data/address.dart';
import '../data/phone.dart';

TableElement _defaultPhone() {
  final phone = Phone.defaultPhone();
  return phone.toInputTable(PhoneOptions.fromPhone(phone));
}

TableElement _defaultAddress() {
  final address = Address.defaultAddress();
  return address.toInputTable(AddressOptions.fromAddress(address));
}

List<TableRowElement> accountEditTableRows(Account account) {
  List<TableRowElement> rows = List.empty(growable: true);
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
          ..type = 'text'
          ..value = account.data.preferredName),
    ]));

  final addressRow = TableRowElement();
  addressRow.children.add(Element.th()..innerText = 'Addresses:');
  addressRow.children.add(Element.td()
    ..children.addAll([
      DivElement()
        ..id = 'addresses'
        ..children.addAll(account.addresses.map((address) => address.toInputTable(AddressOptions.fromAddress(address)))),
      DivElement()
        ..children.add(ButtonElement()
          ..innerText = 'Add address to account'
          ..onClick.listen(
            (event) => querySelector('#addresses')?.children.add(_defaultAddress()),
          )),
    ]));
  rows.add(addressRow);

  final phoneRow = TableRowElement();
  phoneRow.children.add(Element.th()..innerText = 'Phones:');
  phoneRow.children.add(Element.td()
    ..children.addAll([
      DivElement()
        ..id = 'phones'
        ..children.addAll(account.phones.map((phone) => phone.toInputTable(PhoneOptions.fromPhone(phone)))),
      DivElement()
        ..children.add(ButtonElement()
          ..innerText = 'Add phone to account'
          ..onClick.listen(
            (event) => querySelector('#phones')?.children.add(_defaultPhone()),
          )),
    ]));
  rows.add(phoneRow);

  rows.add(TableRowElement()
    ..children.addAll([
      TableCellElement()
        ..style.display = 'flex'
        ..style.justifyContent = 'right'
        ..children.add(DivElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Save changes'
          ..onClick.listen((event) {
            if (_saveData()) {
              window.location.pathname = '/customer/account.html';
            }
          })),
      TableCellElement()
        ..children.add(DivElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Don\'t save changes'
          ..onClick.listen((event) => window.location.pathname = '/customer/account.html')),
    ]));

  return rows;
}

bool _saveData() {
  return true;
}

void setup() async {
  final account = await Account.getAccount();
  if (account == null) {
    querySelector('body')?.children.insert(1, HeadingElement.h2()..text = 'Account not found');
    return;
  }

  querySelector('#account-edit-table')?.children.addAll(accountEditTableRows(account));
}
