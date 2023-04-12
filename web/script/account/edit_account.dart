import 'dart:html';

import '../data/account.dart';
import '../data/address.dart';
import '../data/phone.dart';
import '../html_utility.dart';

TableElement _defaultPhone() {
  final phone = Phone.defaultPhone();
  return phone.toInputTable(PhoneOptions.fromPhone(phone));
}

TableElement _defaultAddress() {
  final address = Address.defaultAddress();
  return address.toInputTable(AddressOptions.fromAddress(address));
}

bool _getAddress(Element element, final Address fillAddress) {
  var dataValid = true;
  final street = element.querySelector('.address-street')?.toElement<InputElement>()?.value;
  if (street == null || street.trim().isEmpty) {
    element.querySelector('.address-street-message')?.innerText = 'Address must have a street';
    dataValid &= false;
  } else {
    fillAddress.street = street;
  }

  final city = element.querySelector('.address-city')?.toElement<InputElement>()?.value;
  if (city == null || city.trim().isEmpty) {
    element.querySelector('.address-city-message')?.innerText = 'Address must have a city';
    dataValid &= false;
  } else {
    fillAddress.city = city;
  }

  final state = element.querySelector('.address-state')?.toElement<SelectElement>()?.value;
  if (state == null || state.trim().isEmpty) {
    element.querySelector('.address-state-message')?.innerText = 'Address must have a state';
    dataValid &= false;
  } else {
    fillAddress.state = state;
  }

  final zip = element.querySelector('.address-zip')?.toElement<InputElement>()?.value;
  if (zip == null || zip.trim().isEmpty) {
    element.querySelector('.address-zip-message')?.innerText = 'Address must have a zip';
    dataValid &= false;
  } else {
    fillAddress.zip = zip;
  }

  return dataValid;
}

bool _getPhone(Element element, final Phone fillPhone) {
  var dataValid = true;

  final number = element.querySelector('.phone-number')?.toElement<InputElement>()?.value;
  if (number == null || number.trim().isEmpty) {
    element.querySelector('.phone-number-message')?.innerText = 'Phone must have a number';
    dataValid &= false;
  } else {
    fillPhone.number = number;
  }

  final phoneType = element.querySelector('.phone-type')?.toElement<SelectElement>()?.value;
  if (phoneType == null || phoneType.trim().isEmpty) {
    element.querySelector('.phone-type-message')?.innerText = 'Must select a type for this phone';
    dataValid &= false;
  } else {
    fillPhone.phoneType.name = phoneType;
  }

  return dataValid;
}

bool _saveData(final Account accountBase) {
  var dataValid = true;
  final preferredName = querySelector('#account-preferred-name')?.toElement<InputElement>()?.value;
  dataValid &= !(preferredName == null || preferredName.trim().isEmpty);

  final addresses = List<Address>.empty(growable: true);
  for (var element in querySelectorAll('.address-input')) {
    final address = Address.defaultAddress();
    dataValid &= _getAddress(element, address);
    print('${_getAddress(element, address)}');
    addresses.add(address);
  }

  final phones = List<Phone>.empty(growable: true);
  for (var element in querySelectorAll('.phone-input')) {
    final phone = Phone.defaultPhone();
    dataValid &= _getPhone(element, phone);
    print('${_getPhone(element, phone)}');
    phones.add(phone);
  }

  if (dataValid) {
    accountBase.data.preferredName = preferredName!;
    accountBase.addresses = addresses;
    accountBase.phones = phones;
    accountBase.put();
  }

  return dataValid;
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
            if (_saveData(account)) {
              // window.location.pathname = '/customer/account.html';
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

void setup() async {
  final account = await Account.getAccount();
  if (account == null) {
    querySelector('body')?.children.insert(1, HeadingElement.h2()..text = 'Account not found');
    return;
  }

  querySelector('#account-edit-table')?.children.addAll(accountEditTableRows(account));
}
