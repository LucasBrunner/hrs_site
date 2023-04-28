import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart';

import '../data.dart';
import '../html_utility.dart';
import 'account_type.dart';
import 'address.dart';
import 'phone.dart';

part 'account.mapper.dart';

@MappableClass()
class AccountPublicData with AccountPublicDataMappable {
  String email;
  String preferredName;
  String legalName;

  AccountPublicData(
    this.email,
    this.preferredName,
    this.legalName,
  );
}

@MappableClass(generateMethods: GenerateMethods.decode | GenerateMethods.encode)
class Account with AccountMappable {
  AccountPublicData data;
  List<DataWithId<Phone>> phones;
  List<DataWithId<Address>> addresses;

  Account(
    this.data,
    this.phones,
    this.addresses,
  );

  TableRowElement _addressRow() {
    final row = TableRowElement();
    if (addresses.isEmpty) {
      return row
        ..children.addAll([
          Element.th()..innerText = 'Address:',
          Element.td()..innerText = 'N/A',
        ]);
    }
    if (addresses.length == 1) {
      row.children.add(Element.th()..innerText = 'Address:');
    } else {
      row.children.add(Element.th()..innerText = 'Addresses:');
    }
    row.children.add(TableCellElement()..children.addAll(addresses.map((address) => TableElement()..children.addAll(address.data.toTableViewRows()))));
    return row;
  }

  TableRowElement _phoneRow() {
    final row = TableRowElement();
    if (phones.isEmpty) {
      return row
        ..children.addAll([
          Element.th()..innerText = 'Phone:',
          Element.td()..innerText = 'N/A',
        ]);
    }
    if (phones.length == 1) {
      row.children.add(Element.th()..innerText = 'Phone:');
    } else {
      row.children.add(Element.th()..innerText = 'Phones:');
    }
    row.children.add(TableCellElement()..children.addAll(phones.map((phone) => TableElement()..children.addAll(phone.data.toTableViewRows()))));
    return row;
  }

  List<TableRowElement> toTableViewRows() {
    final List<TableRowElement> rows = List.empty(growable: true);
    rows.add(TableRowElement()
      ..children.addAll([
        Element.th()..innerText = 'Legal Name:',
        Element.td()..innerText = data.legalName,
      ]));
    rows.add(TableRowElement()
      ..children.addAll([
        Element.th()..innerText = 'Perferred Name:',
        Element.td()..innerText = data.preferredName,
      ]));
    rows.add(_addressRow());
    rows.add(_phoneRow());
    return rows;
  }

  List<Element> legalNameEditRow() {
    return [
      Element.th()..innerText = 'Legal Name:',
      Element.td()..children.add(InputElement()..defaultValue = data.legalName),
    ];
  }

  List<Element> legalNameUneditableRow() {
    return [
      Element.th()..innerText = 'Legal Name:',
      Element.td()..innerHtml = '${data.legalName} <small><i>Please contact support to change your legal name.</i></small>',
    ];
  }

  List<Element> emailAddressEditRow() {
    return [
      Element.th()..innerText = 'Email Address:',
      Element.td()
        ..children.add(InputElement()
          ..defaultValue = data.email
          ..type = 'email'),
    ];
  }

  List<Element> emailAddressUneditableRow() {
    return [
      Element.th()..innerText = 'Email Address:',
      Element.td()..innerHtml = '${data.email} <small><i>Please contact support to change your email.</i></small>',
    ];
  }

  List<Element> preferredNameEditRow() {
    return [
      Element.th()..innerText = 'Preferred Name:',
      Element.td()..children.add(InputElement()..defaultValue = data.preferredName),
    ];
  }

  List<Element> addressEditRow(
    String Function() uniqueId,
  ) {
    return [
      Element.th()..innerText = 'Addresses:',
      Element.td()
        ..children.addAll([
          DivElement()
            ..id = 'addresses'
            ..children.addAll(addresses.map((address) => Address.addressInputTable(address.id.toString(), address.data))),
          DivElement()
            ..children.add(ButtonElement()
              ..innerText = 'Add address to account'
              ..onClick.listen(
                (event) => querySelector('#addresses')?.children.add(Address.addressInputTable(uniqueId.call(), Address.defaultAddress())),
              )),
        ]),
    ];
  }

  List<Element> phoneEditRow(
    String Function() uniqueId,
  ) {
    return [
      Element.th()..innerText = 'Phones:',
      Element.td()
        ..children.addAll([
          DivElement()
            ..id = 'phones'
            ..children.addAll(phones.map((phone) => Phone.phoneInputTable(phone.id.toString(), phone.data))),
          DivElement()
            ..children.add(ButtonElement()
              ..innerText = 'Add phone to account'
              ..onClick.listen(
                (event) => querySelector('#phones')?.children.add(Phone.phoneInputTable(uniqueId.call(), Phone.defaultPhone())),
              )),
        ]),
    ];
  }

  static Future<Account?> httpGetImplicit() async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/account'),
    );
    switch (response.statusCode) {
      case 200:
        print(response.body);
        return AccountMapper.fromJson(response.body);
      default:
        return null;
    }
  }

  static Future<Account?> httpGetId(int id) async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/accounts/$id'),
    );
    switch (response.statusCode) {
      case 200:
        print(response.body);
        return AccountMapper.fromJson(response.body);
      default:
        return null;
    }
  }

  Future<bool> saveData(
    String pronoun,
    Future<Response> Function(AccountUpdate accountUpdate) applyAccountUpdate,
  ) async {
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
    } else if (preferredName != data.preferredName) {
      querySelector('.preferred-name-error-message')?.innerText = '';
      accountUpdate.preferredName = UpdateType.put(preferredName);
    }

    for (var addressInputTable in querySelectorAll('.address-input')) {
      final id = addressInputTable.getAttribute('data-address-id');
      if (id == null) {
        querySelector('#general-error-message')?.innerText = 'There was an error serializing $pronoun account.';
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

        final compareAddress = addresses.firstWhere(
          (element) => element.id.toString() == id,
          orElse: () => DataWithId(-1, Address.defaultAddress()),
        );
        if (compareAddress.id == -1) {
          dataValid = false;
          querySelector('#general-error-message')?.innerText = 'There was an error serializing $pronoun account.';
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
        querySelector('#general-error-message')?.innerText = 'There was an error serializing $pronoun account.';
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

        final comparePhone = phones.firstWhere(
          (element) => element.id.toString() == id,
          orElse: () => DataWithId(-1, Phone.defaultPhone()),
        );
        if (comparePhone.id == -1) {
          dataValid = false;
          querySelector('#general-error-message')?.innerText = 'There was an error serializing $pronoun account.';
          continue;
        } else if (phone == comparePhone.data) {
          continue;
        } else {
          accountUpdate.phones.add(UpdateType.put(DataMaybeId.id(comparePhone.id, phone)));
        }
      }
    }

    for (DataWithId<Address> address in addresses) {
      if (querySelector('.address-input[data-address-id="${address.id}"]') == null) {
        accountUpdate.addresses.add(UpdateType.delete(address.id));
      }
    }

    for (DataWithId<Phone> phone in phones) {
      if (querySelector('.phone-input[data-phone-id="${phone.id}"]') == null) {
        accountUpdate.phones.add(UpdateType.delete(phone.id));
      }
    }

    if (dataValid) {
      querySelector('#general-error-message')?.innerText = '';
      final response = await applyAccountUpdate.call(accountUpdate);
      switch (response.statusCode) {
        case 201:
          return true;
        case 401:
          querySelector('#general-error-message')?.innerText = 'Login session expired.';
          return false;
        case 422:
          querySelector('#general-error-message')?.innerText = 'There was an error serializing $pronoun account.';
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
}

extension GetAccountTypes on DataWithId<Account> {
  Future<List<AccountType>?> getAccountTypes() async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/accounts/$id/account_types'),
    );
    print('Account types on account: ${response.body}');
    switch (response.statusCode) {
      case 200:
        print(response.body);
        AccountTypeMapper.ensureInitialized();
        return MapperContainer.globals.fromJson<List<AccountType>>(response.body);
      default:
        return null;
    }
  }

  Future<List<HasAccountType>?> getHasAccountTypes() async {
    final awaitAccountTypes = AccountType.httpGetAccountTypes();
    final awaitAccountTypesOnAccount = getAccountTypes();

    final accountTypes = await awaitAccountTypes;
    final accountTypesOnAccount = await awaitAccountTypesOnAccount;

    if (accountTypes == null || accountTypesOnAccount == null) {
      return null;
    }

    return accountTypes.map((accountType) => HasAccountType(accountType, accountTypesOnAccount.contains(accountType))).toList();
  }
}

@MappableClass()
class AccountUpdate with AccountUpdateMappable {
  UpdateType<String> email;
  UpdateType<String> legalName;
  UpdateType<String> preferredName;
  List<UpdateType<DataMaybeId<Phone>>> phones;
  List<UpdateType<DataMaybeId<Address>>> addresses;

  AccountUpdate(
    this.email,
    this.legalName,
    this.preferredName,
    this.phones,
    this.addresses,
  );

  static Future<Response> httpPutImplicit(AccountUpdate accountUpdate) async {
    return await http.put(
      Uri.http(window.location.host, '/data/account'),
      body: accountUpdate.toJson(),
      headers: {
        'Content-type': 'application/json',
      },
    );
  }

  static Future<Response> httpPutId(int id, AccountUpdate accountUpdate) async {
    return await http.put(
      Uri.http(window.location.host, '/data/accounts/$id'),
      body: accountUpdate.toJson(),
      headers: {
        'Content-type': 'application/json',
      },
    );
  }
}
