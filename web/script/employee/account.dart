import 'dart:html';

import '../data/account.dart';

void setup() async {
  final id = int.tryParse(Uri.dataFromString(window.location.href).queryParameters['id'] ?? '');
  if (id == null) {
    print('Error: no or invalid id');
    return;
  }

  final account = await Account.httpGetId(id);
  if (account == null) {
    print('Error: no account found');
    return;
  }

  querySelector('#account-display')?.children.addAll(account.toTableViewRows());
}
