import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;

part 'account_type.mapper.dart';

@MappableClass()
class AccountType with AccountTypeMappable {
  int accountTypeId;
  String name;

  AccountType(
    this.accountTypeId,
    this.name,
  );

  static Future<List<AccountType>?> httpGetAccountTypes() async {
    final response = await http.get(
      Uri.http(window.location.host, '/data/account_types'),
    );
    switch (response.statusCode) {
      case 200:
        print(response.body);
        AccountTypeMapper.ensureInitialized();
        return MapperContainer.globals.fromJson<List<AccountType>>(response.body);
      default:
        return null;
    }
  }

  Future<bool> addToAccount(int accountId) async {
    final response = await http.put(
      Uri.http(window.location.host, '/data/account_types/$accountTypeId/accounts/$accountId'),
    );
    switch (response.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }

  Future<bool> removeFromAccount(int accountId) async {
    final response = await http.delete(
      Uri.http(window.location.host, '/data/account_types/$accountTypeId/accounts/$accountId'),
    );
    switch (response.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }
}

class HasAccountType {
  AccountType accountType;
  bool has;

  HasAccountType(this.accountType, this.has);

  int accountTypeId() {
    return accountType.accountTypeId;
  }

  String name() {
    return accountType.name;
  }
}

extension ToSelectTable on List<HasAccountType> {
  TableElement toSelectTable() {
    return TableElement()
      ..children.addAll(map((hasAccountType) => TableRowElement()
        ..children.addAll([
          TableCellElement()
            ..children.add(InputElement()
              ..type = 'checkbox'
              ..checked = hasAccountType.has
              ..classes.add('account-type-selector')
              ..setAttribute('data-account-type-id', hasAccountType.accountType.accountTypeId)),
          TableCellElement()..innerText = hasAccountType.accountType.name
        ])));
  }

  List<Element> toEditTableRow() {
    return [
      Element.th()..innerText = 'Account Types:',
      Element.td()..children.add(toSelectTable()),
    ];
  }
}
