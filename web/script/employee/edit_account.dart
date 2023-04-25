import 'dart:html';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/account.dart';
import '../html_utility.dart';

int _tempId = 0;

String nextTempId() => 'temp-${_tempId++}';

List<Element> accountEditTableRows(DataWithId<Account> account) {
  final rows = List<Element>.empty(growable: true);

  rows.addAll([
    account.data.legalNameUneditableRow().toTableRow(),
    account.data.emailAddressUneditableRow().toTableRow(),
    account.data.preferredNameEditRow().toTableRow(),
    account.data.addressEditRow(nextTempId).toTableRow(),
    account.data.phoneEditRow(nextTempId).toTableRow(),
  ]);

  final finishButtonsRow = TableRowElement()
    ..children.addAll([
      TableCellElement()
        ..style.display = 'flex'
        ..style.justifyContent = 'right'
        ..children.addAll([
          SpanElement()
            ..className = 'error-message'
            ..id = 'general-error-message',
          SpanElement()
            ..className = 'div-button edit-button'
            ..innerText = 'Save changes'
            ..onClick.listen((event) async {
              if (await account.data.saveData('this', (accountUpdate) => AccountUpdate.httpPutId(account.id, accountUpdate))) {
                window.location.pathname = '/employee/account';
              }
            }),
        ]),
      TableCellElement()
        ..children.add(SpanElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Don\'t save changes'
          ..onClick.listen((event) => window.location.pathname = '/employee/account')),
    ]);
  rows.add(finishButtonsRow);

  return rows;
}

void setupData(DataWithId<Account> account) {
  querySelector('#account-title')?.innerText = 'Currently Editing ${account.data.data.preferredName}\'s account';
  querySelector('#account-edit-table')?.children.addAll(accountEditTableRows(account));
}

Future<void> setup() async {
  final id = int.tryParse(Uri.dataFromString(window.location.href).queryParameters['id'] ?? '');
  if (id == null) {
    print('Error: no or invalid id');
    return;
  }

  final response = await http.get(
    Uri.http(window.location.host, '/data/accounts/$id'),
  );

  switch (response.statusCode) {
    case 200:
      try {
        setupData(DataWithId(id, AccountMapper.fromJson(response.body)));
      } catch (e) {
        querySelector('body')?.children.insert(0, HeadingElement.h2()..text = 'Problem deserializing data');
      }
      break;
    default:
      querySelector('body')?.children.insert(0, HeadingElement.h2()..text = 'Account not found');
      return;
  }
}
