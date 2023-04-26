// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'order.dart';

class OrderSummaryMapper extends ClassMapperBase<OrderSummary> {
  OrderSummaryMapper._();
  static OrderSummaryMapper? _instance;
  static OrderSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderSummaryMapper._());
      OptionInternallyTaggedMapper.ensureInitialized();
      OrderStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OrderSummary';

  static int _$accountId(OrderSummary v) => v.accountId;
  static const Field<OrderSummary, int> _f$accountId =
      Field('accountId', _$accountId);
  static String _$orderName(OrderSummary v) => v.orderName;
  static const Field<OrderSummary, String> _f$orderName =
      Field('orderName', _$orderName);
  static String _$accountLegalName(OrderSummary v) => v.accountLegalName;
  static const Field<OrderSummary, String> _f$accountLegalName =
      Field('accountLegalName', _$accountLegalName);
  static String _$accountPreferredName(OrderSummary v) =>
      v.accountPreferredName;
  static const Field<OrderSummary, String> _f$accountPreferredName =
      Field('accountPreferredName', _$accountPreferredName);
  static int _$dateCreated(OrderSummary v) => v.dateCreated;
  static const Field<OrderSummary, int> _f$dateCreated =
      Field('dateCreated', _$dateCreated);
  static OptionInternallyTagged<int> _$addressId(OrderSummary v) => v.addressId;
  static const Field<OrderSummary, OptionInternallyTagged<int>> _f$addressId =
      Field('addressId', _$addressId);
  static OrderState _$state(OrderSummary v) => v.state;
  static const Field<OrderSummary, OrderState> _f$state =
      Field('state', _$state);

  @override
  final Map<Symbol, Field<OrderSummary, dynamic>> fields = const {
    #accountId: _f$accountId,
    #orderName: _f$orderName,
    #accountLegalName: _f$accountLegalName,
    #accountPreferredName: _f$accountPreferredName,
    #dateCreated: _f$dateCreated,
    #addressId: _f$addressId,
    #state: _f$state,
  };

  static OrderSummary _instantiate(DecodingData data) {
    return OrderSummary(
        data.dec(_f$accountId),
        data.dec(_f$orderName),
        data.dec(_f$accountLegalName),
        data.dec(_f$accountPreferredName),
        data.dec(_f$dateCreated),
        data.dec(_f$addressId),
        data.dec(_f$state));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderSummary fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<OrderSummary>(map));
  }

  static OrderSummary fromJson(String json) {
    return _guard((c) => c.fromJson<OrderSummary>(json));
  }
}

mixin OrderSummaryMappable {
  String toJson() {
    return OrderSummaryMapper._guard((c) => c.toJson(this as OrderSummary));
  }

  Map<String, dynamic> toMap() {
    return OrderSummaryMapper._guard((c) => c.toMap(this as OrderSummary));
  }

  OrderSummaryCopyWith<OrderSummary, OrderSummary, OrderSummary> get copyWith =>
      _OrderSummaryCopyWithImpl(this as OrderSummary, $identity, $identity);
  @override
  String toString() {
    return OrderSummaryMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderSummaryMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OrderSummaryMapper._guard((c) => c.hash(this));
  }
}

extension OrderSummaryValueCopy<$R, $Out extends OrderSummary>
    on ObjectCopyWith<$R, OrderSummary, $Out> {
  OrderSummaryCopyWith<$R, OrderSummary, $Out> get $asOrderSummary =>
      $base.as((v, t, t2) => _OrderSummaryCopyWithImpl(v, t, t2));
}

typedef OrderSummaryCopyWithBound = OrderSummary;

abstract class OrderSummaryCopyWith<$R, $In extends OrderSummary,
    $Out extends OrderSummary> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? accountId,
      String? orderName,
      String? accountLegalName,
      String? accountPreferredName,
      int? dateCreated,
      OptionInternallyTagged<int>? addressId,
      OrderState? state});
  OrderSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends OrderSummary>(
      Then<OrderSummary, $Out2> t, Then<$Out2, $R2> t2);
}

class _OrderSummaryCopyWithImpl<$R, $Out extends OrderSummary>
    extends ClassCopyWithBase<$R, OrderSummary, $Out>
    implements OrderSummaryCopyWith<$R, OrderSummary, $Out> {
  _OrderSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderSummary> $mapper =
      OrderSummaryMapper.ensureInitialized();
  @override
  $R call(
          {int? accountId,
          String? orderName,
          String? accountLegalName,
          String? accountPreferredName,
          int? dateCreated,
          OptionInternallyTagged<int>? addressId,
          OrderState? state}) =>
      $apply(FieldCopyWithData({
        if (accountId != null) #accountId: accountId,
        if (orderName != null) #orderName: orderName,
        if (accountLegalName != null) #accountLegalName: accountLegalName,
        if (accountPreferredName != null)
          #accountPreferredName: accountPreferredName,
        if (dateCreated != null) #dateCreated: dateCreated,
        if (addressId != null) #addressId: addressId,
        if (state != null) #state: state
      }));
  @override
  OrderSummary $make(CopyWithData data) => OrderSummary(
      data.get(#accountId, or: $value.accountId),
      data.get(#orderName, or: $value.orderName),
      data.get(#accountLegalName, or: $value.accountLegalName),
      data.get(#accountPreferredName, or: $value.accountPreferredName),
      data.get(#dateCreated, or: $value.dateCreated),
      data.get(#addressId, or: $value.addressId),
      data.get(#state, or: $value.state));

  @override
  OrderSummaryCopyWith<$R2, OrderSummary, $Out2>
      $chain<$R2, $Out2 extends OrderSummary>(
              Then<OrderSummary, $Out2> t, Then<$Out2, $R2> t2) =>
          _OrderSummaryCopyWithImpl($value, t, t2);
}

class OrderItemUpdateMapper extends ClassMapperBase<OrderItemUpdate> {
  OrderItemUpdateMapper._();
  static OrderItemUpdateMapper? _instance;
  static OrderItemUpdateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderItemUpdateMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OrderItemUpdate';

  static int _$itemId(OrderItemUpdate v) => v.itemId;
  static const Field<OrderItemUpdate, int> _f$itemId =
      Field('itemId', _$itemId);
  static int _$newItemAmount(OrderItemUpdate v) => v.newItemAmount;
  static const Field<OrderItemUpdate, int> _f$newItemAmount =
      Field('newItemAmount', _$newItemAmount);
  static int _$warehouseId(OrderItemUpdate v) => v.warehouseId;
  static const Field<OrderItemUpdate, int> _f$warehouseId =
      Field('warehouseId', _$warehouseId);

  @override
  final Map<Symbol, Field<OrderItemUpdate, dynamic>> fields = const {
    #itemId: _f$itemId,
    #newItemAmount: _f$newItemAmount,
    #warehouseId: _f$warehouseId,
  };

  static OrderItemUpdate _instantiate(DecodingData data) {
    return OrderItemUpdate(data.dec(_f$itemId), data.dec(_f$newItemAmount),
        data.dec(_f$warehouseId));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderItemUpdate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<OrderItemUpdate>(map));
  }

  static OrderItemUpdate fromJson(String json) {
    return _guard((c) => c.fromJson<OrderItemUpdate>(json));
  }
}

mixin OrderItemUpdateMappable {
  String toJson() {
    return OrderItemUpdateMapper._guard(
        (c) => c.toJson(this as OrderItemUpdate));
  }

  Map<String, dynamic> toMap() {
    return OrderItemUpdateMapper._guard(
        (c) => c.toMap(this as OrderItemUpdate));
  }

  OrderItemUpdateCopyWith<OrderItemUpdate, OrderItemUpdate, OrderItemUpdate>
      get copyWith => _OrderItemUpdateCopyWithImpl(
          this as OrderItemUpdate, $identity, $identity);
  @override
  String toString() {
    return OrderItemUpdateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderItemUpdateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OrderItemUpdateMapper._guard((c) => c.hash(this));
  }
}

extension OrderItemUpdateValueCopy<$R, $Out extends OrderItemUpdate>
    on ObjectCopyWith<$R, OrderItemUpdate, $Out> {
  OrderItemUpdateCopyWith<$R, OrderItemUpdate, $Out> get $asOrderItemUpdate =>
      $base.as((v, t, t2) => _OrderItemUpdateCopyWithImpl(v, t, t2));
}

typedef OrderItemUpdateCopyWithBound = OrderItemUpdate;

abstract class OrderItemUpdateCopyWith<$R, $In extends OrderItemUpdate,
    $Out extends OrderItemUpdate> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? itemId, int? newItemAmount, int? warehouseId});
  OrderItemUpdateCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends OrderItemUpdate>(
          Then<OrderItemUpdate, $Out2> t, Then<$Out2, $R2> t2);
}

class _OrderItemUpdateCopyWithImpl<$R, $Out extends OrderItemUpdate>
    extends ClassCopyWithBase<$R, OrderItemUpdate, $Out>
    implements OrderItemUpdateCopyWith<$R, OrderItemUpdate, $Out> {
  _OrderItemUpdateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderItemUpdate> $mapper =
      OrderItemUpdateMapper.ensureInitialized();
  @override
  $R call({int? itemId, int? newItemAmount, int? warehouseId}) =>
      $apply(FieldCopyWithData({
        if (itemId != null) #itemId: itemId,
        if (newItemAmount != null) #newItemAmount: newItemAmount,
        if (warehouseId != null) #warehouseId: warehouseId
      }));
  @override
  OrderItemUpdate $make(CopyWithData data) => OrderItemUpdate(
      data.get(#itemId, or: $value.itemId),
      data.get(#newItemAmount, or: $value.newItemAmount),
      data.get(#warehouseId, or: $value.warehouseId));

  @override
  OrderItemUpdateCopyWith<$R2, OrderItemUpdate, $Out2>
      $chain<$R2, $Out2 extends OrderItemUpdate>(
              Then<OrderItemUpdate, $Out2> t, Then<$Out2, $R2> t2) =>
          _OrderItemUpdateCopyWithImpl($value, t, t2);
}

class OrderUpdateMapper extends ClassMapperBase<OrderUpdate> {
  OrderUpdateMapper._();
  static OrderUpdateMapper? _instance;
  static OrderUpdateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderUpdateMapper._());
      UpdateTypeMapper.ensureInitialized();
      AddressMapper.ensureInitialized();
      OrderStateMapper.ensureInitialized();
      OrderItemUpdateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OrderUpdate';

  static UpdateType<Address> _$addressUpdate(OrderUpdate v) => v.addressUpdate;
  static const Field<OrderUpdate, UpdateType<Address>> _f$addressUpdate =
      Field('addressUpdate', _$addressUpdate);
  static UpdateType<OrderState> _$stateUpdate(OrderUpdate v) => v.stateUpdate;
  static const Field<OrderUpdate, UpdateType<OrderState>> _f$stateUpdate =
      Field('stateUpdate', _$stateUpdate);
  static List<UpdateType<OrderItemUpdate>> _$items(OrderUpdate v) => v.items;
  static const Field<OrderUpdate, List<UpdateType<OrderItemUpdate>>> _f$items =
      Field('items', _$items);

  @override
  final Map<Symbol, Field<OrderUpdate, dynamic>> fields = const {
    #addressUpdate: _f$addressUpdate,
    #stateUpdate: _f$stateUpdate,
    #items: _f$items,
  };

  static OrderUpdate _instantiate(DecodingData data) {
    return OrderUpdate(data.dec(_f$addressUpdate), data.dec(_f$stateUpdate),
        data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderUpdate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<OrderUpdate>(map));
  }

  static OrderUpdate fromJson(String json) {
    return _guard((c) => c.fromJson<OrderUpdate>(json));
  }
}

mixin OrderUpdateMappable {
  String toJson() {
    return OrderUpdateMapper._guard((c) => c.toJson(this as OrderUpdate));
  }

  Map<String, dynamic> toMap() {
    return OrderUpdateMapper._guard((c) => c.toMap(this as OrderUpdate));
  }

  OrderUpdateCopyWith<OrderUpdate, OrderUpdate, OrderUpdate> get copyWith =>
      _OrderUpdateCopyWithImpl(this as OrderUpdate, $identity, $identity);
  @override
  String toString() {
    return OrderUpdateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderUpdateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OrderUpdateMapper._guard((c) => c.hash(this));
  }
}

extension OrderUpdateValueCopy<$R, $Out extends OrderUpdate>
    on ObjectCopyWith<$R, OrderUpdate, $Out> {
  OrderUpdateCopyWith<$R, OrderUpdate, $Out> get $asOrderUpdate =>
      $base.as((v, t, t2) => _OrderUpdateCopyWithImpl(v, t, t2));
}

typedef OrderUpdateCopyWithBound = OrderUpdate;

abstract class OrderUpdateCopyWith<$R, $In extends OrderUpdate,
    $Out extends OrderUpdate> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      UpdateType<OrderItemUpdate>,
      ObjectCopyWith<$R, UpdateType<OrderItemUpdate>,
          UpdateType<OrderItemUpdate>>> get items;
  $R call(
      {UpdateType<Address>? addressUpdate,
      UpdateType<OrderState>? stateUpdate,
      List<UpdateType<OrderItemUpdate>>? items});
  OrderUpdateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends OrderUpdate>(
      Then<OrderUpdate, $Out2> t, Then<$Out2, $R2> t2);
}

class _OrderUpdateCopyWithImpl<$R, $Out extends OrderUpdate>
    extends ClassCopyWithBase<$R, OrderUpdate, $Out>
    implements OrderUpdateCopyWith<$R, OrderUpdate, $Out> {
  _OrderUpdateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderUpdate> $mapper =
      OrderUpdateMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      UpdateType<OrderItemUpdate>,
      ObjectCopyWith<$R, UpdateType<OrderItemUpdate>,
          UpdateType<OrderItemUpdate>>> get items => ListCopyWith($value.items,
      (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(items: v));
  @override
  $R call(
          {UpdateType<Address>? addressUpdate,
          UpdateType<OrderState>? stateUpdate,
          List<UpdateType<OrderItemUpdate>>? items}) =>
      $apply(FieldCopyWithData({
        if (addressUpdate != null) #addressUpdate: addressUpdate,
        if (stateUpdate != null) #stateUpdate: stateUpdate,
        if (items != null) #items: items
      }));
  @override
  OrderUpdate $make(CopyWithData data) => OrderUpdate(
      data.get(#addressUpdate, or: $value.addressUpdate),
      data.get(#stateUpdate, or: $value.stateUpdate),
      data.get(#items, or: $value.items));

  @override
  OrderUpdateCopyWith<$R2, OrderUpdate, $Out2>
      $chain<$R2, $Out2 extends OrderUpdate>(
              Then<OrderUpdate, $Out2> t, Then<$Out2, $R2> t2) =>
          _OrderUpdateCopyWithImpl($value, t, t2);
}

class OrderStateMapper extends EnumMapper<OrderState> {
  OrderStateMapper._();
  static OrderStateMapper? _instance;
  static OrderStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderStateMapper._());
    }
    return _instance!;
  }

  static OrderState fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OrderState decode(dynamic value) {
    switch (value) {
      case 'pending':
        return OrderState.pending;
      case 'commited':
        return OrderState.commited;
      case 'inProgress':
        return OrderState.inProgress;
      case 'completed':
        return OrderState.completed;
      case 'canceled':
        return OrderState.canceled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OrderState self) {
    switch (self) {
      case OrderState.pending:
        return 'pending';
      case OrderState.commited:
        return 'commited';
      case OrderState.inProgress:
        return 'inProgress';
      case OrderState.completed:
        return 'completed';
      case OrderState.canceled:
        return 'canceled';
    }
  }
}

extension OrderStateMapperExtension on OrderState {
  String toValue() {
    OrderStateMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
