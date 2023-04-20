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
    if (addresses.isEmpty) {
      return row
        ..children.addAll([
          Element.th()..innerText = 'Phone:',
          Element.td()..innerText = 'N/A',
        ]);
    }
    if (addresses.length == 1) {
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
