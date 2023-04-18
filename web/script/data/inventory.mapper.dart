// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'inventory.dart';

class InventoryItemMapper extends ClassMapperBase<InventoryItem> {
  InventoryItemMapper._();
  static InventoryItemMapper? _instance;
  static InventoryItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InventoryItemMapper._());
      StringOptionInternallyTaggedMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'InventoryItem';

  static int _$inventoryItemId(InventoryItem v) => v.inventoryItemId;
  static const Field<InventoryItem, int> _f$inventoryItemId =
      Field('inventoryItemId', _$inventoryItemId);
  static double _$cost(InventoryItem v) => v.cost;
  static const Field<InventoryItem, double> _f$cost = Field('cost', _$cost);
  static double _$listPrice(InventoryItem v) => v.listPrice;
  static const Field<InventoryItem, double> _f$listPrice =
      Field('listPrice', _$listPrice);
  static int _$brandId(InventoryItem v) => v.brandId;
  static const Field<InventoryItem, int> _f$brandId =
      Field('brandId', _$brandId);
  static String _$brandName(InventoryItem v) => v.brandName;
  static const Field<InventoryItem, String> _f$brandName =
      Field('brandName', _$brandName);
  static String _$model(InventoryItem v) => v.model;
  static const Field<InventoryItem, String> _f$model = Field('model', _$model);
  static StringOptionInternallyTagged _$serial(InventoryItem v) => v.serial;
  static const Field<InventoryItem, StringOptionInternallyTagged> _f$serial =
      Field('serial', _$serial);
  static StringOptionInternallyTagged _$description(InventoryItem v) =>
      v.description;
  static const Field<InventoryItem, StringOptionInternallyTagged>
      _f$description = Field('description', _$description);

  @override
  final Map<Symbol, Field<InventoryItem, dynamic>> fields = const {
    #inventoryItemId: _f$inventoryItemId,
    #cost: _f$cost,
    #listPrice: _f$listPrice,
    #brandId: _f$brandId,
    #brandName: _f$brandName,
    #model: _f$model,
    #serial: _f$serial,
    #description: _f$description,
  };

  static InventoryItem _instantiate(DecodingData data) {
    return InventoryItem(
        data.dec(_f$inventoryItemId),
        data.dec(_f$cost),
        data.dec(_f$listPrice),
        data.dec(_f$brandId),
        data.dec(_f$brandName),
        data.dec(_f$model),
        data.dec(_f$serial),
        data.dec(_f$description));
  }

  @override
  final Function instantiate = _instantiate;

  static InventoryItem fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<InventoryItem>(map));
  }

  static InventoryItem fromJson(String json) {
    return _guard((c) => c.fromJson<InventoryItem>(json));
  }
}

mixin InventoryItemMappable {
  String toJson() {
    return InventoryItemMapper._guard((c) => c.toJson(this as InventoryItem));
  }

  Map<String, dynamic> toMap() {
    return InventoryItemMapper._guard((c) => c.toMap(this as InventoryItem));
  }

  InventoryItemCopyWith<InventoryItem, InventoryItem, InventoryItem>
      get copyWith => _InventoryItemCopyWithImpl(
          this as InventoryItem, $identity, $identity);
  @override
  String toString() {
    return InventoryItemMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InventoryItemMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return InventoryItemMapper._guard((c) => c.hash(this));
  }
}

extension InventoryItemValueCopy<$R, $Out extends InventoryItem>
    on ObjectCopyWith<$R, InventoryItem, $Out> {
  InventoryItemCopyWith<$R, InventoryItem, $Out> get $asInventoryItem =>
      $base.as((v, t, t2) => _InventoryItemCopyWithImpl(v, t, t2));
}

typedef InventoryItemCopyWithBound = InventoryItem;

abstract class InventoryItemCopyWith<$R, $In extends InventoryItem,
    $Out extends InventoryItem> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? inventoryItemId,
      double? cost,
      double? listPrice,
      int? brandId,
      String? brandName,
      String? model,
      StringOptionInternallyTagged? serial,
      StringOptionInternallyTagged? description});
  InventoryItemCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends InventoryItem>(
          Then<InventoryItem, $Out2> t, Then<$Out2, $R2> t2);
}

class _InventoryItemCopyWithImpl<$R, $Out extends InventoryItem>
    extends ClassCopyWithBase<$R, InventoryItem, $Out>
    implements InventoryItemCopyWith<$R, InventoryItem, $Out> {
  _InventoryItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InventoryItem> $mapper =
      InventoryItemMapper.ensureInitialized();
  @override
  $R call(
          {int? inventoryItemId,
          double? cost,
          double? listPrice,
          int? brandId,
          String? brandName,
          String? model,
          StringOptionInternallyTagged? serial,
          StringOptionInternallyTagged? description}) =>
      $apply(FieldCopyWithData({
        if (inventoryItemId != null) #inventoryItemId: inventoryItemId,
        if (cost != null) #cost: cost,
        if (listPrice != null) #listPrice: listPrice,
        if (brandId != null) #brandId: brandId,
        if (brandName != null) #brandName: brandName,
        if (model != null) #model: model,
        if (serial != null) #serial: serial,
        if (description != null) #description: description
      }));
  @override
  InventoryItem $make(CopyWithData data) => InventoryItem(
      data.get(#inventoryItemId, or: $value.inventoryItemId),
      data.get(#cost, or: $value.cost),
      data.get(#listPrice, or: $value.listPrice),
      data.get(#brandId, or: $value.brandId),
      data.get(#brandName, or: $value.brandName),
      data.get(#model, or: $value.model),
      data.get(#serial, or: $value.serial),
      data.get(#description, or: $value.description));

  @override
  InventoryItemCopyWith<$R2, InventoryItem, $Out2>
      $chain<$R2, $Out2 extends InventoryItem>(
              Then<InventoryItem, $Out2> t, Then<$Out2, $R2> t2) =>
          _InventoryItemCopyWithImpl($value, t, t2);
}

class InventoryItemResultMapper extends ClassMapperBase<InventoryItemResult> {
  InventoryItemResultMapper._();
  static InventoryItemResultMapper? _instance;
  static InventoryItemResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InventoryItemResultMapper._());
      _InventoryItemOkMapper.ensureInitialized();
      _InventoryItemErrMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'InventoryItemResult';

  @override
  final Map<Symbol, Field<InventoryItemResult, dynamic>> fields = const {};

  static InventoryItemResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'InventoryItemResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static InventoryItemResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<InventoryItemResult>(map));
  }

  static InventoryItemResult fromJson(String json) {
    return _guard((c) => c.fromJson<InventoryItemResult>(json));
  }
}

extension InventoryItemResultMapperExtension on InventoryItemResult {
  String toJson() {
    return InventoryItemResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return InventoryItemResultMapper._guard((c) => c.toMap(this));
  }
}

typedef InventoryItemResultCopyWithBound = InventoryItemResult;

abstract class InventoryItemResultCopyWith<$R, $In extends InventoryItemResult,
    $Out extends InventoryItemResult> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  InventoryItemResultCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends InventoryItemResult>(
          Then<InventoryItemResult, $Out2> t, Then<$Out2, $R2> t2);
}

class _InventoryItemOkMapper extends SubClassMapperBase<_InventoryItemOk> {
  _InventoryItemOkMapper._();
  static _InventoryItemOkMapper? _instance;
  static _InventoryItemOkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryItemOkMapper._());
      InventoryItemResultMapper.ensureInitialized().addSubMapper(_instance!);
      InventoryItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InventoryItemOk';

  static List<InventoryItem> _$items(_InventoryItemOk v) => v.items;
  static const Field<_InventoryItemOk, List<InventoryItem>> _f$items =
      Field('items', _$items);

  @override
  final Map<Symbol, Field<_InventoryItemOk, dynamic>> fields = const {
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      InventoryItemResultMapper.ensureInitialized();

  static _InventoryItemOk _instantiate(DecodingData data) {
    return _InventoryItemOk(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryItemOk fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryItemOk>(map));
  }

  static _InventoryItemOk fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryItemOk>(json));
  }
}

extension _InventoryItemOkMapperExtension on _InventoryItemOk {
  String toJson() {
    return _InventoryItemOkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryItemOkMapper._guard((c) => c.toMap(this));
  }
}

class _InventoryItemErrMapper extends SubClassMapperBase<_InventoryItemErr> {
  _InventoryItemErrMapper._();
  static _InventoryItemErrMapper? _instance;
  static _InventoryItemErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryItemErrMapper._());
      InventoryItemResultMapper.ensureInitialized().addSubMapper(_instance!);
      DataErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InventoryItemErr';

  static DataError _$err(_InventoryItemErr v) => v.err;
  static const Field<_InventoryItemErr, DataError> _f$err = Field('err', _$err);

  @override
  final Map<Symbol, Field<_InventoryItemErr, dynamic>> fields = const {
    #err: _f$err,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      InventoryItemResultMapper.ensureInitialized();

  static _InventoryItemErr _instantiate(DecodingData data) {
    return _InventoryItemErr(data.dec(_f$err));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryItemErr fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryItemErr>(map));
  }

  static _InventoryItemErr fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryItemErr>(json));
  }
}

extension _InventoryItemErrMapperExtension on _InventoryItemErr {
  String toJson() {
    return _InventoryItemErrMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryItemErrMapper._guard((c) => c.toMap(this));
  }
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

  static int _$warehouseId(WarehouseInventoryItem v) => v.warehouseId;
  static const Field<WarehouseInventoryItem, int> _f$warehouseId =
      Field('warehouseId', _$warehouseId);
  static int _$inventoryItemId(WarehouseInventoryItem v) => v.inventoryItemId;
  static const Field<WarehouseInventoryItem, int> _f$inventoryItemId =
      Field('inventoryItemId', _$inventoryItemId);
  static double _$cost(WarehouseInventoryItem v) => v.cost;
  static const Field<WarehouseInventoryItem, double> _f$cost =
      Field('cost', _$cost);
  static double _$listPrice(WarehouseInventoryItem v) => v.listPrice;
  static const Field<WarehouseInventoryItem, double> _f$listPrice =
      Field('listPrice', _$listPrice);
  static int _$brandId(WarehouseInventoryItem v) => v.brandId;
  static const Field<WarehouseInventoryItem, int> _f$brandId =
      Field('brandId', _$brandId);
  static String _$brandName(WarehouseInventoryItem v) => v.brandName;
  static const Field<WarehouseInventoryItem, String> _f$brandName =
      Field('brandName', _$brandName);
  static String _$model(WarehouseInventoryItem v) => v.model;
  static const Field<WarehouseInventoryItem, String> _f$model =
      Field('model', _$model);
  static StringOptionInternallyTagged _$serial(WarehouseInventoryItem v) =>
      v.serial;
  static const Field<WarehouseInventoryItem, StringOptionInternallyTagged>
      _f$serial = Field('serial', _$serial);
  static StringOptionInternallyTagged _$description(WarehouseInventoryItem v) =>
      v.description;
  static const Field<WarehouseInventoryItem, StringOptionInternallyTagged>
      _f$description = Field('description', _$description);
  static int _$amount(WarehouseInventoryItem v) => v.amount;
  static const Field<WarehouseInventoryItem, int> _f$amount =
      Field('amount', _$amount);

  @override
  final Map<Symbol, Field<WarehouseInventoryItem, dynamic>> fields = const {
    #warehouseId: _f$warehouseId,
    #inventoryItemId: _f$inventoryItemId,
    #cost: _f$cost,
    #listPrice: _f$listPrice,
    #brandId: _f$brandId,
    #brandName: _f$brandName,
    #model: _f$model,
    #serial: _f$serial,
    #description: _f$description,
    #amount: _f$amount,
  };

  static WarehouseInventoryItem _instantiate(DecodingData data) {
    return WarehouseInventoryItem(
        data.dec(_f$warehouseId),
        data.dec(_f$inventoryItemId),
        data.dec(_f$cost),
        data.dec(_f$listPrice),
        data.dec(_f$brandId),
        data.dec(_f$brandName),
        data.dec(_f$model),
        data.dec(_f$serial),
        data.dec(_f$description),
        data.dec(_f$amount));
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
      {int? warehouseId,
      int? inventoryItemId,
      double? cost,
      double? listPrice,
      int? brandId,
      String? brandName,
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
          {int? warehouseId,
          int? inventoryItemId,
          double? cost,
          double? listPrice,
          int? brandId,
          String? brandName,
          String? model,
          StringOptionInternallyTagged? serial,
          StringOptionInternallyTagged? description,
          int? amount}) =>
      $apply(FieldCopyWithData({
        if (warehouseId != null) #warehouseId: warehouseId,
        if (inventoryItemId != null) #inventoryItemId: inventoryItemId,
        if (cost != null) #cost: cost,
        if (listPrice != null) #listPrice: listPrice,
        if (brandId != null) #brandId: brandId,
        if (brandName != null) #brandName: brandName,
        if (model != null) #model: model,
        if (serial != null) #serial: serial,
        if (description != null) #description: description,
        if (amount != null) #amount: amount
      }));
  @override
  WarehouseInventoryItem $make(CopyWithData data) => WarehouseInventoryItem(
      data.get(#warehouseId, or: $value.warehouseId),
      data.get(#inventoryItemId, or: $value.inventoryItemId),
      data.get(#cost, or: $value.cost),
      data.get(#listPrice, or: $value.listPrice),
      data.get(#brandId, or: $value.brandId),
      data.get(#brandName, or: $value.brandName),
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

class WarehouseInventoryResultMapper
    extends ClassMapperBase<WarehouseInventoryResult> {
  WarehouseInventoryResultMapper._();
  static WarehouseInventoryResultMapper? _instance;
  static WarehouseInventoryResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WarehouseInventoryResultMapper._());
      _InventoryOkMapper.ensureInitialized();
      _InventoryErrMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WarehouseInventoryResult';

  @override
  final Map<Symbol, Field<WarehouseInventoryResult, dynamic>> fields = const {};

  static WarehouseInventoryResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'WarehouseInventoryResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static WarehouseInventoryResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WarehouseInventoryResult>(map));
  }

  static WarehouseInventoryResult fromJson(String json) {
    return _guard((c) => c.fromJson<WarehouseInventoryResult>(json));
  }
}

extension WarehouseInventoryResultMapperExtension on WarehouseInventoryResult {
  String toJson() {
    return WarehouseInventoryResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return WarehouseInventoryResultMapper._guard((c) => c.toMap(this));
  }
}

typedef WarehouseInventoryResultCopyWithBound = WarehouseInventoryResult;

abstract class WarehouseInventoryResultCopyWith<
        $R,
        $In extends WarehouseInventoryResult,
        $Out extends WarehouseInventoryResult>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  WarehouseInventoryResultCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends WarehouseInventoryResult>(
          Then<WarehouseInventoryResult, $Out2> t, Then<$Out2, $R2> t2);
}

class _InventoryOkMapper extends SubClassMapperBase<_InventoryOk> {
  _InventoryOkMapper._();
  static _InventoryOkMapper? _instance;
  static _InventoryOkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryOkMapper._());
      WarehouseInventoryResultMapper.ensureInitialized()
          .addSubMapper(_instance!);
      WarehouseInventoryItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InventoryOk';

  static List<WarehouseInventoryItem> _$items(_InventoryOk v) => v.items;
  static const Field<_InventoryOk, List<WarehouseInventoryItem>> _f$items =
      Field('items', _$items);

  @override
  final Map<Symbol, Field<_InventoryOk, dynamic>> fields = const {
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      WarehouseInventoryResultMapper.ensureInitialized();

  static _InventoryOk _instantiate(DecodingData data) {
    return _InventoryOk(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryOk fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryOk>(map));
  }

  static _InventoryOk fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryOk>(json));
  }
}

extension _InventoryOkMapperExtension on _InventoryOk {
  String toJson() {
    return _InventoryOkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryOkMapper._guard((c) => c.toMap(this));
  }
}

class _InventoryErrMapper extends SubClassMapperBase<_InventoryErr> {
  _InventoryErrMapper._();
  static _InventoryErrMapper? _instance;
  static _InventoryErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryErrMapper._());
      WarehouseInventoryResultMapper.ensureInitialized()
          .addSubMapper(_instance!);
      DataErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InventoryErr';

  static DataError _$err(_InventoryErr v) => v.err;
  static const Field<_InventoryErr, DataError> _f$err = Field('err', _$err);

  @override
  final Map<Symbol, Field<_InventoryErr, dynamic>> fields = const {
    #err: _f$err,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      WarehouseInventoryResultMapper.ensureInitialized();

  static _InventoryErr _instantiate(DecodingData data) {
    return _InventoryErr(data.dec(_f$err));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryErr fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryErr>(map));
  }

  static _InventoryErr fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryErr>(json));
  }
}

extension _InventoryErrMapperExtension on _InventoryErr {
  String toJson() {
    return _InventoryErrMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryErrMapper._guard((c) => c.toMap(this));
  }
}
