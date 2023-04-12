import 'dart:html';

import '../data/account.dart';

void setup() async {
  Account? account = await Account.getAccount();
  if (account == null) {
    return;
  }

  querySelector('#profile-table')?.children.addAll(account.toTableRows()
    ..add(TableRowElement()
      ..style.display = 'flex'
      ..style.justifyContent = 'right'
      ..children.add(DivElement()
        ..className = 'div-button edit-button'
        ..innerText = 'Edit Profile'
        ..onClick.listen((event) => window.location.pathname = '/customer/edit_account.html'))));
  querySelector('#account-title')?.innerText = '${account.data.preferredName}\'s Profile';
}
