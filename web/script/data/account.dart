import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart';

import '../data.dart';
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

  Future<Response> httpPutImplicit() async {
    return await http.put(
      Uri.http(window.location.host, '/data/account'),
      body: toJson(),
      headers: {
        'Content-type': 'application/json',
      },
    );
  }
}
