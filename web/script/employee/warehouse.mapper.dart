// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'warehouse.dart';

class WarehouseMapper extends ClassMapperBase<Warehouse> {
  WarehouseMapper._();
  static WarehouseMapper? _instance;
  static WarehouseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WarehouseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Warehouse';

  static int _$id(Warehouse v) => v.id;
  static String _$name(Warehouse v) => v.name;
  static String _$phoneType(Warehouse v) => v.phoneType;
  static String _$phoneNumber(Warehouse v) => v.phoneNumber;
  static String _$addressStreet(Warehouse v) => v.addressStreet;
  static String _$addressCity(Warehouse v) => v.addressCity;
  static String _$addressState(Warehouse v) => v.addressState;
  static String _$addressZip(Warehouse v) => v.addressZip;

  @override
  final Map<Symbol, Field<Warehouse, dynamic>> fields = const {
    #id: Field<Warehouse, int>('id', _$id),
    #name: Field<Warehouse, String>('name', _$name),
    #phoneType: Field<Warehouse, String>('phoneType', _$phoneType),
    #phoneNumber: Field<Warehouse, String>('phoneNumber', _$phoneNumber),
    #addressStreet: Field<Warehouse, String>('addressStreet', _$addressStreet),
    #addressCity: Field<Warehouse, String>('addressCity', _$addressCity),
    #addressState: Field<Warehouse, String>('addressState', _$addressState),
    #addressZip: Field<Warehouse, String>('addressZip', _$addressZip),
  };

  static Warehouse _instantiate(DecodingData data) {
    return Warehouse(
        data.get(#id),
        data.get(#name),
        data.get(#phoneType),
        data.get(#phoneNumber),
        data.get(#addressStreet),
        data.get(#addressCity),
        data.get(#addressState),
        data.get(#addressZip));
  }

  @override
  final Function instantiate = _instantiate;

  static Warehouse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Warehouse>(map));
  }

  static Warehouse fromJson(String json) {
    return _guard((c) => c.fromJson<Warehouse>(json));
  }
}

mixin WarehouseMappable {
  String toJson() {
    return WarehouseMapper._guard((c) => c.toJson(this as Warehouse));
  }

  Map<String, dynamic> toMap() {
    return WarehouseMapper._guard((c) => c.toMap(this as Warehouse));
  }

  WarehouseCopyWith<Warehouse, Warehouse, Warehouse> get copyWith =>
      _WarehouseCopyWithImpl(this as Warehouse, $identity, $identity);
  @override
  String toString() {
    return WarehouseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WarehouseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WarehouseMapper._guard((c) => c.hash(this));
  }
}

extension WarehouseValueCopy<$R, $Out extends Warehouse>
    on ObjectCopyWith<$R, Warehouse, $Out> {
  WarehouseCopyWith<$R, Warehouse, $Out> get $asWarehouse =>
      $base.as((v, t, t2) => _WarehouseCopyWithImpl(v, t, t2));
}

typedef WarehouseCopyWithBound = Warehouse;

abstract class WarehouseCopyWith<$R, $In extends Warehouse,
    $Out extends Warehouse> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      String? phoneType,
      String? phoneNumber,
      String? addressStreet,
      String? addressCity,
      String? addressState,
      String? addressZip});
  WarehouseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Warehouse>(
      Then<Warehouse, $Out2> t, Then<$Out2, $R2> t2);
}

class _WarehouseCopyWithImpl<$R, $Out extends Warehouse>
    extends ClassCopyWithBase<$R, Warehouse, $Out>
    implements WarehouseCopyWith<$R, Warehouse, $Out> {
  _WarehouseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Warehouse> $mapper =
      WarehouseMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          String? phoneType,
          String? phoneNumber,
          String? addressStreet,
          String? addressCity,
          String? addressState,
          String? addressZip}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (phoneType != null) #phoneType: phoneType,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (addressStreet != null) #addressStreet: addressStreet,
        if (addressCity != null) #addressCity: addressCity,
        if (addressState != null) #addressState: addressState,
        if (addressZip != null) #addressZip: addressZip
      }));
  @override
  Warehouse $make(CopyWithData data) => Warehouse(
      data.get(#id, or: $value.id),
      data.get(#name, or: $value.name),
      data.get(#phoneType, or: $value.phoneType),
      data.get(#phoneNumber, or: $value.phoneNumber),
      data.get(#addressStreet, or: $value.addressStreet),
      data.get(#addressCity, or: $value.addressCity),
      data.get(#addressState, or: $value.addressState),
      data.get(#addressZip, or: $value.addressZip));

  @override
  WarehouseCopyWith<$R2, Warehouse, $Out2> $chain<$R2, $Out2 extends Warehouse>(
          Then<Warehouse, $Out2> t, Then<$Out2, $R2> t2) =>
      _WarehouseCopyWithImpl($value, t, t2);
}

class WarehouseInventoryItemMapper
    extends ClassMapperBase<WarehouseInventoryItem> {
  WarehouseInventoryItemMapper._();
  static WarehouseInventoryItemMapper? _instance;
  static WarehouseInventoryItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WarehouseInventoryItemMapper._());
      StringOptionInternallyTaggedMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WarehouseInventoryItem';

  static int _$warehouse_id(WarehouseInventoryItem v) => v.warehouse_id;
  static int _$inventory_item_id(WarehouseInventoryItem v) =>
      v.inventory_item_id;
  static double _$cost(WarehouseInventoryItem v) => v.cost;
  static double _$list_price(WarehouseInventoryItem v) => v.list_price;
  static int _$brand_id(WarehouseInventoryItem v) => v.brand_id;
  static String _$brand_name(WarehouseInventoryItem v) => v.brand_name;
  static String _$model(WarehouseInventoryItem v) => v.model;
  static StringOptionInternallyTagged _$serial(WarehouseInventoryItem v) =>
      v.serial;
  static StringOptionInternallyTagged _$description(WarehouseInventoryItem v) =>
      v.description;
  static int _$amount(WarehouseInventoryItem v) => v.amount;

  @override
  final Map<Symbol, Field<WarehouseInventoryItem, dynamic>> fields = const {
    #warehouse_id:
        Field<WarehouseInventoryItem, int>('warehouse_id', _$warehouse_id),
    #inventory_item_id: Field<WarehouseInventoryItem, int>(
        'inventory_item_id', _$inventory_item_id),
    #cost: Field<WarehouseInventoryItem, double>('cost', _$cost),
    #list_price:
        Field<WarehouseInventoryItem, double>('list_price', _$list_price),
    #brand_id: Field<WarehouseInventoryItem, int>('brand_id', _$brand_id),
    #brand_name:
        Field<WarehouseInventoryItem, String>('brand_name', _$brand_name),
    #model: Field<WarehouseInventoryItem, String>('model', _$model),
    #serial: Field<WarehouseInventoryItem, StringOptionInternallyTagged>(
        'serial', _$serial),
    #description: Field<WarehouseInventoryItem, StringOptionInternallyTagged>(
        'description', _$description),
    #amount: Field<WarehouseInventoryItem, int>('amount', _$amount),
  };

  static WarehouseInventoryItem _instantiate(DecodingData data) {
    return WarehouseInventoryItem(
        data.get(#warehouse_id),
        data.get(#inventory_item_id),
        data.get(#cost),
        data.get(#list_price),
        data.get(#brand_id),
        data.get(#brand_name),
        data.get(#model),
        data.get(#serial),
        data.get(#description),
        data.get(#amount));
  }

  @override
  final Function instantiate = _instantiate;

  static WarehouseInventoryItem fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WarehouseInventoryItem>(map));
  }

  static WarehouseInventoryItem fromJson(String json) {
    return _guard((c) => c.fromJson<WarehouseInventoryItem>(json));
  }
}

mixin WarehouseInventoryItemMappable {
  String toJson() {
    return WarehouseInventoryItemMapper._guard(
        (c) => c.toJson(this as WarehouseInventoryItem));
  }

  Map<String, dynamic> toMap() {
    return WarehouseInventoryItemMapper._guard(
        (c) => c.toMap(this as WarehouseInventoryItem));
  }

  WarehouseInventoryItemCopyWith<WarehouseInventoryItem, WarehouseInventoryItem,
          WarehouseInventoryItem>
      get copyWith => _WarehouseInventoryItemCopyWithImpl(
          this as WarehouseInventoryItem, $identity, $identity);
  @override
  String toString() {
    return WarehouseInventoryItemMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WarehouseInventoryItemMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WarehouseInventoryItemMapper._guard((c) => c.hash(this));
  }
}

extension WarehouseInventoryItemValueCopy<$R,
        $Out extends WarehouseInventoryItem>
    on ObjectCopyWith<$R, WarehouseInventoryItem, $Out> {
  WarehouseInventoryItemCopyWith<$R, WarehouseInventoryItem, $Out>
      get $asWarehouseInventoryItem =>
          $base.as((v, t, t2) => _WarehouseInventoryItemCopyWithImpl(v, t, t2));
}

typedef WarehouseInventoryItemCopyWithBound = WarehouseInventoryItem;

abstract class WarehouseInventoryItemCopyWith<$R,
        $In extends WarehouseInventoryItem, $Out extends WarehouseInventoryItem>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? warehouse_id,
      int? inventory_item_id,
      double? cost,
      double? list_price,
      int? brand_id,
      String? brand_name,
      String? model,
      StringOptionInternallyTagged? serial,
      StringOptionInternallyTagged? description,
      int? amount});
  WarehouseInventoryItemCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends WarehouseInventoryItem>(
          Then<WarehouseInventoryItem, $Out2> t, Then<$Out2, $R2> t2);
}

class _WarehouseInventoryItemCopyWithImpl<$R,
        $Out extends WarehouseInventoryItem>
    extends ClassCopyWithBase<$R, WarehouseInventoryItem, $Out>
    implements
        WarehouseInventoryItemCopyWith<$R, WarehouseInventoryItem, $Out> {
  _WarehouseInventoryItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WarehouseInventoryItem> $mapper =
      WarehouseInventoryItemMapper.ensureInitialized();
  @override
  $R call(
          {int? warehouse_id,
          int? inventory_item_id,
          double? cost,
          double? list_price,
          int? brand_id,
          String? brand_name,
          String? model,
          StringOptionInternallyTagged? serial,
          StringOptionInternallyTagged? description,
          int? amount}) =>
      $apply(FieldCopyWithData({
        if (warehouse_id != null) #warehouse_id: warehouse_id,
        if (inventory_item_id != null) #inventory_item_id: inventory_item_id,
        if (cost != null) #cost: cost,
        if (list_price != null) #list_price: list_price,
        if (brand_id != null) #brand_id: brand_id,
        if (brand_name != null) #brand_name: brand_name,
        if (model != null) #model: model,
        if (serial != null) #serial: serial,
        if (description != null) #description: description,
        if (amount != null) #amount: amount
      }));
  @override
  WarehouseInventoryItem $make(CopyWithData data) => WarehouseInventoryItem(
      data.get(#warehouse_id, or: $value.warehouse_id),
      data.get(#inventory_item_id, or: $value.inventory_item_id),
      data.get(#cost, or: $value.cost),
      data.get(#list_price, or: $value.list_price),
      data.get(#brand_id, or: $value.brand_id),
      data.get(#brand_name, or: $value.brand_name),
      data.get(#model, or: $value.model),
      data.get(#serial, or: $value.serial),
      data.get(#description, or: $value.description),
      data.get(#amount, or: $value.amount));

  @override
  WarehouseInventoryItemCopyWith<$R2, WarehouseInventoryItem, $Out2>
      $chain<$R2, $Out2 extends WarehouseInventoryItem>(
              Then<WarehouseInventoryItem, $Out2> t, Then<$Out2, $R2> t2) =>
          _WarehouseInventoryItemCopyWithImpl($value, t, t2);
}

class WarehouseResultMapper extends ClassMapperBase<WarehouseResult> {
  WarehouseResultMapper._();
  static WarehouseResultMapper? _instance;
  static WarehouseResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WarehouseResultMapper._());
      _OkMapper.ensureInitialized();
      _ErrMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WarehouseResult';

  @override
  final Map<Symbol, Field<WarehouseResult, dynamic>> fields = const {};

  static WarehouseResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'WarehouseResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static WarehouseResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WarehouseResult>(map));
  }

  static WarehouseResult fromJson(String json) {
    return _guard((c) => c.fromJson<WarehouseResult>(json));
  }
}

extension WarehouseResultMapperExtension on WarehouseResult {
  String toJson() {
    return WarehouseResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return WarehouseResultMapper._guard((c) => c.toMap(this));
  }
}

typedef WarehouseResultCopyWithBound = WarehouseResult;

abstract class WarehouseResultCopyWith<$R, $In extends WarehouseResult,
    $Out extends WarehouseResult> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  WarehouseResultCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends WarehouseResult>(
          Then<WarehouseResult, $Out2> t, Then<$Out2, $R2> t2);
}

class _OkMapper extends SubClassMapperBase<_Ok> {
  _OkMapper._();
  static _OkMapper? _instance;
  static _OkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _OkMapper._());
      WarehouseResultMapper.ensureInitialized().addSubMapper(_instance!);
      WarehouseMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Ok';

  static List<Warehouse> _$warehouses(_Ok v) => v.warehouses;

  @override
  final Map<Symbol, Field<_Ok, dynamic>> fields = const {
    #warehouses: Field<_Ok, List<Warehouse>>('warehouses', _$warehouses),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      WarehouseResultMapper.ensureInitialized();

  static _Ok _instantiate(DecodingData data) {
    return _Ok(data.get(#warehouses));
  }

  @override
  final Function instantiate = _instantiate;

  static _Ok fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_Ok>(map));
  }

  static _Ok fromJson(String json) {
    return _guard((c) => c.fromJson<_Ok>(json));
  }
}

extension _OkMapperExtension on _Ok {
  String toJson() {
    return _OkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _OkMapper._guard((c) => c.toMap(this));
  }
}

class _ErrMapper extends SubClassMapperBase<_Err> {
  _ErrMapper._();
  static _ErrMapper? _instance;
  static _ErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _ErrMapper._());
      WarehouseResultMapper.ensureInitialized().addSubMapper(_instance!);
      DataErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Err';

  static DataError _$err(_Err v) => v.err;

  @override
  final Map<Symbol, Field<_Err, dynamic>> fields = const {
    #err: Field<_Err, DataError>('err', _$err),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      WarehouseResultMapper.ensureInitialized();

  static _Err _instantiate(DecodingData data) {
    return _Err(data.get(#err));
  }

  @override
  final Function instantiate = _instantiate;

  static _Err fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_Err>(map));
  }

  static _Err fromJson(String json) {
    return _guard((c) => c.fromJson<_Err>(json));
  }
}

extension _ErrMapperExtension on _Err {
  String toJson() {
    return _ErrMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _ErrMapper._guard((c) => c.toMap(this));
  }
}
