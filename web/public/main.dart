import 'dart:html';

import '../script/authentication/signin.dart' as signin;
import '../script/authentication/signup.dart' as signup;
import '../script/employee/warehouse.dart' as warehouse;

const scriptElements = {
  'signin': signin.setup,
  'signup': signup.setup,
  'warehouses': warehouse.showWarehouses,
  'warehouse': warehouse.showWarehouse,
};

void main(List<String> args) {
  final scriptElementsToLoad = querySelector('#script-elements');
  if (scriptElementsToLoad == null) return;

  for (var scriptElement in scriptElementsToLoad.children) {
    try {
      scriptElements[(scriptElement as OptionElement).value]?.call();
    } finally {}
  }
}
