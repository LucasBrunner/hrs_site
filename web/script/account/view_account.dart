import 'dart:html';
import 'package:http/http.dart' as http;

import '../authentication/authentication.dart';
import '../data/account.dart';

void setup() async {
  Account? account = await Account.httpGetImplicit();
  if (account == null) {
    return;
  }

  querySelector('#profile-table')?.children.addAll(account.toTableViewRows());
  querySelector('#main')?.children.add(DivElement()
    ..classes.add('edit-button-container')
    ..children.addAll([
      DivElement()
        ..className = 'div-button edit-button'
        ..innerText = 'Edit Profile'
        ..onClick.listen((event) => window.location.pathname = '/account/edit'),
      DivElement()
        ..className = 'div-button edit-button'
        ..innerText = 'Sign Out'
        ..onClick.listen((event) => signOut()),
      DivElement()
        ..children.addAll([
          SpanElement()
            ..className = 'div-button edit-button'
            ..innerText = 'Sign Out Everywhere'
            ..onClick.listen((event) async {
              final response = await http.post(Uri.http(window.location.host, '/signout_everywhere'));
              if (response.statusCode == 200) {
                signOut();
              } else {
                querySelector('#sign-out-everywhere-message')?.innerText = 'Something went wrong signing you out.';
              }
            }),
          SpanElement()
            ..className = 'error-message'
            ..id = 'sign-out-everywhere-message'
        ])
    ]));
  querySelector('#account-title')?.innerText = '${account.data.preferredName}\'s Profile';
}
