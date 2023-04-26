import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import '../data.dart';
import 'package:http/http.dart' as http;

import 'address.dart';

part 'order.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum OrderState {
  pending(id: 1, formalName: 'Pending', urlName: 'pending'),
  commited(id: 2, formalName: 'Commited', urlName: 'commited'),
  inProgress(id: 3, formalName: 'InProgress', urlName: 'in_progress'),
  completed(id: 4, formalName: 'Completed', urlName: 'completed'),
  canceled(id: 5, formalName: 'Canceled', urlName: 'canceled');

  final int id;
  final String formalName;
  final String urlName;

  const OrderState({
    required this.id,
    required this.formalName,
    required this.urlName,
  });
}

@MappableClass()
class OrderSummary with OrderSummaryMappable {
  int accountId;
  String orderName;
  String accountLegalName;
  String accountPreferredName;
  int dateCreated;
  OptionInternallyTagged<int> addressId;
  OrderState state;

  OrderSummary(
    this.accountId,
    this.orderName,
    this.accountLegalName,
    this.accountPreferredName,
    this.dateCreated,
    this.addressId,
    this.state,
  );

  static Future<List<DataWithId<OrderSummary>>?> httpGetImplicit({OrderState? state}) async {
    var path = '/data/account/orders';
    if (state != null) {
      path = '$path/${state.urlName}';
    }
    final response = await http.get(
      Uri.http(window.location.host, path),
      headers: {'Range': 'index=0-20'},
    );

    print(response.body);
    switch (response.statusCode) {
      case 200:
        OrderStateMapper.ensureInitialized();
        OrderSummaryMapper.ensureInitialized();
        DataWithIdMapper.ensureInitialized();
        return MapperContainer.globals.fromJson<List<DataWithId<OrderSummary>>>(response.body);
      default:
        return null;
    }
  }
}

Future<DataWithId<OrderSummary>?> postNewOrder(String name) async {
  final response = await http.post(
    Uri.http(window.location.host, '/data/account/orders/$name'),
  );

  print(response.body);
  switch (response.statusCode) {
    case 200:
      if (response.body.isEmpty) {
        return null;
      }
      OrderStateMapper.ensureInitialized();
      OrderSummaryMapper.ensureInitialized();
      DataWithIdMapper.ensureInitialized();
      return MapperContainer.globals.fromJson<DataWithId<OrderSummary>>(response.body);
    default:
      return null;
  }
}

@MappableClass()
class OrderItemUpdate with OrderItemUpdateMappable {
  int itemId;
  int newItemAmount;
  int warehouseId;

  OrderItemUpdate(
    this.itemId,
    this.newItemAmount,
    this.warehouseId,
  );
}

@MappableClass()
class OrderUpdate with OrderUpdateMappable {
  UpdateType<Address> addressUpdate;
  UpdateType<OrderState> stateUpdate;
  List<UpdateType<OrderItemUpdate>> items;

  OrderUpdate(
    this.addressUpdate,
    this.stateUpdate,
    this.items,
  );

  Future<bool> httpPut(int orderId) async {
    print(toJson());
    final result = await http.put(
      Uri.http(window.location.host, '/data/account/orders/$orderId'),
      body: toJson(),
    );

    switch (result.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }
}
