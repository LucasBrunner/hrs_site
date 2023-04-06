import 'dart:html';

import '../script/authentication/signin.dart' as signin;
import '../script/authentication/signup.dart' as signup;
import '../script/employee/warehouse.dart' as warehouse;
import '../script/employee/inventory.dart' as inventory;
import '../script/public_page.dart' as public_page;

const scriptElements = {
  'signin': signin.setup,
  'signup': signup.setup,
  'warehouses': warehouse.showWarehouses,
  'warehouse': inventory.setup,
  'public_page': public_page.setup,
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
