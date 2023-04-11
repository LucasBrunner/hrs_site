import 'dart:html';

import '../script/authentication/signin.dart' as signin;
import '../script/authentication/signup.dart' as signup;
import '../script/employee/warehouses.dart' as warehouses;
import '../script/employee/warehouse.dart' as warehouse;
import '../script/public_page.dart' as public_page;
import '../script/public/products.dart' as products;
import '../script/account/view_account.dart' as view_account;

const scriptElements = {
  'signin': signin.setup,
  'signup': signup.setup,
  'warehouses': warehouses.showWarehouses,
  'warehouse': warehouse.setup,
  'public_page': public_page.setup,
  'products': products.setup,
  'view_account': view_account.setup,
};

void main(List<String> args) {
  final scriptElementsToLoad = querySelector('#script-elements');
  if (scriptElementsToLoad == null) return;

  for (var scriptElement in scriptElementsToLoad.children) {
    try {
      final value = (scriptElement as OptionElement).value;
      print(value);
      scriptElements[value]?.call();
    } finally {}
  }
}
