import 'dart:html';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/account.dart';
import '../data/account_type.dart';
import '../html_utility.dart';

int _tempId = 0;

String nextTempId() => 'temp-${_tempId++}';

void putAccoutData(DataWithId<Account> account, List<HasAccountType> hasAccountTypes) async {
  bool accountTypeSave = true;
  for (HasAccountType hasAccountType in hasAccountTypes) {
    final selector = querySelector('.account-type-selector[data-account-type-id="${hasAccountType.accountTypeId()}"]')?.toElement<InputElement>();
    print(selector);
    if (selector == null) {
      continue;
    }
    if (hasAccountType.has == true && selector.checked == false) {
      accountTypeSave &= await hasAccountType.accountType.removeFromAccount(account.id);
    } else if (hasAccountType.has == false && selector.checked == true) {
      accountTypeSave &= await hasAccountType.accountType.addToAccount(account.id);
    }
  }
  final mainSave = await account.data.saveData('this', (accountUpdate) => AccountUpdate.httpPutId(account.id, accountUpdate));
  if (mainSave && accountTypeSave) {
    window.location.pathname = '/employee/account';
  }
}

Future<List<Element>?> accountEditTableRows(
  DataWithId<Account> account,
) async {
  final hasAccountTypes = await account.getHasAccountTypes();
  if (hasAccountTypes == null) {
    return null;
  }
  final accountTypeSelectionTable = hasAccountTypes.toEditTableRow().toTableRow();

  final rows = List<Element>.empty(growable: true);

  rows.addAll([
    account.data.legalNameEditRow().toTableRow(),
    account.data.emailAddressEditRow().toTableRow(),
    account.data.preferredNameEditRow().toTableRow(),
    account.data.addressEditRow(nextTempId).toTableRow(),
    account.data.phoneEditRow(nextTempId).toTableRow(),
    accountTypeSelectionTable,
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
          ButtonElement()
            ..className = 'edit-button'
            ..innerText = 'Save changes'
            ..onClick.listen((event) => putAccoutData(account, hasAccountTypes)),
        ]),
      TableCellElement()
        ..children.add(ButtonElement()
          ..className = 'edit-button'
          ..innerText = 'Don\'t save changes'
          ..onClick.listen((event) => window.location.pathname = '/employee/account')),
    ]);
  rows.add(finishButtonsRow);

  return rows;
}

void setupData(DataWithId<Account> account) async {
  querySelector('#account-title')?.innerText = 'Currently Editing ${account.data.data.preferredName}\'s account';
  final accountData = await accountEditTableRows(account);
  if (accountData == null) {
    return;
  }
  querySelector('#account-edit-table')?.children.addAll(accountData);
}

setup() async {
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
