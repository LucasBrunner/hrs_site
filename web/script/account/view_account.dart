import 'dart:html';

import 'package:http/http.dart' as http;

import '../data/account.dart';

Future<Account?> getAccount() async {
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

void setup() async {
  Account? account = await getAccount();
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
