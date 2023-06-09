import 'dart:html';

import '../script/authentication/signin.dart' as signin;
import '../script/authentication/signup.dart' as signup;
import '../script/employee/warehouses.dart' as warehouses;
import '../script/employee/warehouse.dart' as warehouse;
import '../script/header_footer.dart' as header_footer;
import '../script/public/products.dart' as products;
import '../script/account/view_account.dart' as view_account;
import '../script/account/edit_account.dart' as edit_account;
import '../script/account/add_to_order.dart' as add_to_order;
import '../script/employee/accounts.dart' as account_search;
import '../script/employee/account.dart' as account_view;
import '../script/employee/edit_account.dart' as employee_edit_account;

const scriptElements = {
  'signin': signin.setup,
  'signup': signup.setup,
  'warehouses': warehouses.showWarehouses,
  'warehouse': warehouse.setup,
  'header_footer': header_footer.setup,
  'products': products.setup,
  'view_account': view_account.setup,
  'edit-account': edit_account.setup,
  'account-search': account_search.setup,
  'employee-account-view': account_view.setup,
  'employee-account-edit': employee_edit_account.setup,
  'add-to-order': add_to_order.setup,
};

void main(List<String> args) {
  final scriptElementsToLoad = querySelector('#script-elements');
  if (scriptElementsToLoad == null) return;

  for (var scriptElement in scriptElementsToLoad.children) {
    try {
      final value = (scriptElement as OptionElement).value;
      scriptElements[value]?.call();
    } finally {}
  }
}
