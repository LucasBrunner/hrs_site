import 'dart:html';

import '../data/account.dart';
import '../html_utility.dart';

int _tempId = 0;

String nextTempId() => 'temp-${_tempId++}';

List<Element> accountEditTableRows(Account account) {
  final rows = List<Element>.empty(growable: true);

  rows.addAll([
    account.legalNameUneditableRow().toTableRow(),
    account.emailAddressUneditableRow().toTableRow(),
    account.preferredNameEditRow().toTableRow(),
    account.addressEditRow(nextTempId).toTableRow(),
    account.phoneEditRow(nextTempId).toTableRow(),
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
              if (await account.saveData('your', AccountUpdate.httpPutImplicit)) {
                window.location.pathname = '/account';
              }
            }),
        ]),
      TableCellElement()
        ..children.add(SpanElement()
          ..className = 'div-button edit-button'
          ..innerText = 'Don\'t save changes'
          ..onClick.listen((event) => window.location.pathname = '/account')),
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
