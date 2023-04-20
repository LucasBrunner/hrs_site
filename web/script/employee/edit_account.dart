import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:http/http.dart' as http;

import '../data.dart';
import '../data/account.dart';
import '../html_utility.dart';

enum AccountSearchType {
  id(formalName: 'Id', urlName: "id"),
  email(formalName: 'Email', urlName: "email"),
  name(formalName: 'Name', urlName: "name"),
  address(formalName: 'Address', urlName: "address"),
  phoneNumber(formalName: 'Phone Number', urlName: "phonenumber");

  final String formalName;
  final String urlName;

  const AccountSearchType({
    required this.formalName,
    required this.urlName,
  });
}

void displayAccountSearchResults(List<DataWithId<Account>> accounts) {
  print(accounts);
  querySelector('#search-results')?.children.add(TableRowElement()
    ..children.addAll([
      Element.td(),
      Element.th()..innerText = 'Legal Name',
      Element.th()..innerText = 'Preferred Name',
      Element.th()..innerText = 'Email',
    ]));
  querySelector('#search-results')?.children.addAll(accounts.map((account) => TableRowElement()
    ..children.addAll([
      TableCellElement()..children.add(ButtonElement()..innerText = 'View account'),
      TableCellElement()..innerText = account.data.data.legalName,
      TableCellElement()..innerText = account.data.data.preferredName,
      TableCellElement()..innerText = account.data.data.email,
    ])));
}

void search() async {
  final searchValue = querySelector('#search-box')?.toElement<InputElement>()?.value;
  if (searchValue == null || searchValue.isEmpty) {
    return;
  }

  final searchTypeSelection = querySelector('#search-type-selector')?.toElement<SelectElement>()?.value;
  if (searchTypeSelection == null) {
    querySelector('#search-message')?.innerText = 'Error searching';
    return;
  }
  if (searchTypeSelection.isEmpty) {
    querySelector('#search-message')?.innerText = 'Select a search type';
    return;
  }

  AccountSearchType? searchType;
  try {
    searchType = AccountSearchType.values.firstWhere((searchType) => searchType.name == searchTypeSelection);
  } catch (e) {
    searchType = null;
  }

  if (searchType == null) {
    querySelector('#search-message')?.innerText = 'Invalid search type';
    return;
  }

  querySelector('#search-message')?.innerText = '';
  final response = await http.get(
    Uri.http(
      window.location.host,
      '/data/employee/accounts',
      {
        searchType.urlName: searchValue,
      },
    ),
  );

  querySelector('#search-result-message')?.innerText = '';
  querySelector('#search-results')?.children.clear();
  switch (response.statusCode) {
    case 200:
      try {
        DataWithIdMapper.ensureInitialized();
        AccountMapper.ensureInitialized();
        displayAccountSearchResults(MapperContainer.globals.fromJson<List<DataWithId<Account>>>(response.body));
      } catch (e) {
        print(e);
      }
      break;
    case 204:
      querySelector('#search-result-message')?.innerText = 'No matching accounts found';
      break;
    default:
      print('status code: ${response.statusCode}\nbody: ${response.body}');
      break;
  }
}

void setup() {
  querySelector('#search-type-selector')?.children.addAll(AccountSearchType.values.map((e) => OptionElement()
    ..innerText = e.formalName
    ..value = e.name));

  querySelector('#search-button')?.onClick.listen((event) => search());
}
