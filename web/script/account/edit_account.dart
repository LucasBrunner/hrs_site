import 'dart:html';

import '../data.dart';
import '../data/account.dart';
import '../data/address.dart';
import '../data/phone.dart';
import '../html_utility.dart';

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

Future<bool> _saveData(Account account) async {
  bool dataValid = true;
  final accountUpdate = AccountUpdate(
    UpdateType.ignore(),
    UpdateType.ignore(),
    UpdateType.ignore(),
    List.empty(growable: true),
    List.empty(growable: true),
  );

  final preferredName = querySelector('#account-preferred-name')?.toElement<InputElement>()?.value;
  if (preferredName == null || preferredName.isEmpty) {
    querySelector('.preferred-name-error-message')?.innerText = 'Preferred name cannot be empty';
  } else if (preferredName != account.data.preferredName) {
    querySelector('.preferred-name-error-message')?.innerText = '';
    accountUpdate.preferredName = UpdateType.put(preferredName);
  }

  for (var addressInputTable in querySelectorAll('.address-input')) {
    final id = addressInputTable.getAttribute('data-address-id');
    if (id == null) {
      querySelector('#general-error-message')?.innerText = 'There was an error serializing your account.';
      dataValid = false;
      continue;
    }

    final street = addressInputTable.querySelector('.address-street')?.toElement<InputElement>()?.value;
    if (street == null || street.isEmpty) {
      addressInputTable.querySelector('.address-street-message')?.innerText = 'Street is a mandatory field';
      dataValid = false;
    } else {
      addressInputTable.querySelector('.address-street-message')?.innerText = '';
    }

    final city = addressInputTable.querySelector('.address-city')?.toElement<InputElement>()?.value;
    if (city == null || city.isEmpty) {
      addressInputTable.querySelector('.address-city-message')?.innerText = 'City is a mandatory field';
      dataValid = false;
    } else {
      addressInputTable.querySelector('.address-city-message')?.innerText = '';
    }

    final state = addressInputTable.querySelector('.address-state')?.toElement<SelectElement>()?.value;
    if (state == null || state.isEmpty || state == '— Select One —') {
      addressInputTable.querySelector('.address-state-message')?.innerText = 'State is a mandatory field';
      dataValid = false;
    } else {
      addressInputTable.querySelector('.address-state-message')?.innerText = '';
    }

    final zip = addressInputTable.querySelector('.address-zip')?.toElement<InputElement>()?.value;
    if (zip == null || zip.isEmpty) {
      addressInputTable.querySelector('.address-zip-message')?.innerText = 'Zip is a mandatory field';
      dataValid = false;
    } else {
      addressInputTable.querySelector('.address-zip-message')?.innerText = '';
    }

    if (dataValid) {
      final address = Address(street!, city!, state!, zip!);

      if (id.startsWith('temp-')) {
        accountUpdate.addresses.add(UpdateType.put(DataMaybeId.noId(address)));
        continue;
      }

      final compareAddress = account.addresses.firstWhere(
        (element) => element.id.toString() == id,
        orElse: () => DataWithId(-1, Address.defaultAddress()),
      );
      if (compareAddress.id == -1) {
        dataValid = false;
        querySelector('#general-error-message')?.innerText = 'There was an error serializing your account.';
        continue;
      } else if (address == compareAddress.data) {
        continue;
      } else {
        accountUpdate.addresses.add(UpdateType.put(DataMaybeId.id(compareAddress.id, address)));
      }
    }
  }

  for (var phoneInputTable in querySelectorAll('.phone-input')) {
    final id = phoneInputTable.getAttribute('data-phone-id');
    if (id == null) {
      querySelector('#general-error-message')?.innerText = 'There was an error serializing your account.';
      dataValid = false;
      continue;
    }

    final number = phoneInputTable.querySelector('.phone-number')?.toElement<InputElement>()?.value;
    if (number == null || number.isEmpty) {
      phoneInputTable.querySelector('.phone-number-message')?.innerText = 'Phone number is a mandatory field';
      dataValid = false;
    } else {
      phoneInputTable.querySelector('.phone-number-message')?.innerText = '';
    }

    final type = phoneInputTable.querySelector('.phone-type')?.toElement<SelectElement>()?.value;
    if (type == null || type.isEmpty || type == '— Select One —') {
      phoneInputTable.querySelector('.phone-type-message')?.innerText = 'Phone type is a mandatory field';
      dataValid = false;
    } else {
      phoneInputTable.querySelector('.phone-type-message')?.innerText = '';
    }

    if (dataValid) {
      Phone? phone;
      try {
        phone = Phone(number!, PhoneType.values.firstWhere((element) => element.formalName == type));
      } finally {}

      if (id.startsWith('temp-')) {
        accountUpdate.phones.add(UpdateType.put(DataMaybeId.noId(phone)));
        continue;
      }

      final comparePhone = account.phones.firstWhere(
        (element) => element.id.toString() == id,
        orElse: () => DataWithId(-1, Phone.defaultPhone()),
      );
      if (comparePhone.id == -1) {
        dataValid = false;
        querySelector('#general-error-message')?.innerText = 'There was an error serializing your account.';
        continue;
      } else if (phone == comparePhone.data) {
        continue;
      } else {
        accountUpdate.phones.add(UpdateType.put(DataMaybeId.id(comparePhone.id, phone)));
      }
    }
  }

  for (DataWithId<Address> address in account.addresses) {
    if (querySelector('.address-input[data-address-id="${address.id}"]') == null) {
      accountUpdate.addresses.add(UpdateType.delete(address.id));
    }
  }

  for (DataWithId<Phone> phone in account.phones) {
    if (querySelector('.phone-input[data-phone-id="${phone.id}"]') == null) {
      accountUpdate.phones.add(UpdateType.delete(phone.id));
    }
  }

  if (dataValid) {
    querySelector('#general-error-message')?.innerText = '';
    final response = await accountUpdate.httpPut();
    switch (response.statusCode) {
      case 200:
        return true;
      case 401:
        querySelector('#general-error-message')?.innerText = 'Login session expired.';
        return false;
      case 422:
        querySelector('#general-error-message')?.innerText = 'There was an error serializing your account.';
        return false;
      case 500:
        querySelector('#general-error-message')?.innerText = 'There was a server error.';
        return false;
      default:
        querySelector('#general-error-message')?.innerText = 'There was a client error.';
        return false;
    }
  }

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
      Element.td()..classes.addAll(['input-error-message', 'preferred-name-error-message']),
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
        ..children.addAll([
          SpanElement()
            ..className = 'input-error-message'
            ..id = 'general-error-message',
          SpanElement()
            ..className = 'div-button edit-button'
            ..innerText = 'Save changes'
            ..onClick.listen((event) async {
              if (await _saveData(account)) {
                window.location.pathname = '/customer/account.html';
              }
            }),
        ]),
      TableCellElement()
        ..children.add(SpanElement()
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
  querySelector('#account-title')?.innerText = 'Currently Editing ${account.data.preferredName}\'s account';
  querySelector('#account-edit-table')?.children.addAll(accountEditTableRows(account));
}
