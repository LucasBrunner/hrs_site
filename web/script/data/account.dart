import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data.dart';
import 'address.dart';
import 'phone.dart';

part 'account.mapper.dart';
part 'account.freezed.dart';

@MappableClass()
class AccountPublicData with AccountPublicDataMappable {
  int accountId;
  String email;
  String preferredName;
  String legalName;

  AccountPublicData(
    this.accountId,
    this.email,
    this.preferredName,
    this.legalName,
  );
}

@MappableClass()
class Account with AccountMappable {
  AccountPublicData data;
  List<Phone> phones;
  List<Address> addresses;

  Account(
    this.data,
    this.phones,
    this.addresses,
  );

  TableCellElement addressTables() {
    final cell = TableCellElement();
    for (Address address in addresses) {
      cell.children.add(TableElement()..children.addAll(address.toTableViewRows()));
    }
    return cell;
  }

  TableCellElement phoneTables() {
    final cell = TableCellElement();
    for (Phone phone in phones) {
      cell.children.add(TableElement()..children.addAll(phone.toTableRows()));
    }
    return cell;
  }

  TableRowElement addressRow() {
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
    row.children.addAll(addresses.map((address) => TableElement()..children.addAll(address.toTableViewRows())));
    return row;
  }

  TableRowElement phoneRow() {
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
    row.children.addAll(phones.map((phone) => TableElement()..children.addAll(phone.toTableRows())));
    return row;
  }

  List<TableRowElement> toTableRows() {
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
    rows.add(addressRow());
    rows.add(phoneRow());
    return rows;
  }

  static Future<Account?> getAccount() async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/account'),
    );
    try {
      return AccountResultMapper.fromJson(response.body).when(ok: (ok) => ok, err: (err) => null);
    } catch (e) {
      print(e.toString());
      querySelector('body')?.children.add(HeadingElement.h2()..text = 'Bad data recived');
      return null;
    }
  }

  void put() {
    http.put(
      Uri.http(window.location.host, '/account'),
      body: toJson(),
    );
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class AccountResult with _$AccountResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory AccountResult.ok(Account account) = _Ok;
  @MappableClass(discriminatorValue: 'Err')
  const factory AccountResult.err(DataError err) = _Err;
}
