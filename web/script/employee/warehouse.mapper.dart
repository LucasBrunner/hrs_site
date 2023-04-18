// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'warehouse.dart';

class WarehouseInventoryManualUpdateMapper
    extends ClassMapperBase<WarehouseInventoryManualUpdate> {
  WarehouseInventoryManualUpdateMapper._();
  static WarehouseInventoryManualUpdateMapper? _instance;
  static WarehouseInventoryManualUpdateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WarehouseInventoryManualUpdateMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WarehouseInventoryManualUpdate';

  static int _$inventoryItemId(WarehouseInventoryManualUpdate v) =>
      v.inventoryItemId;
  static const Field<WarehouseInventoryManualUpdate, int> _f$inventoryItemId =
      Field('inventoryItemId', _$inventoryItemId);
  static int _$amount(WarehouseInventoryManualUpdate v) => v.amount;
  static const Field<WarehouseInventoryManualUpdate, int> _f$amount =
      Field('amount', _$amount);

  @override
  final Map<Symbol, Field<WarehouseInventoryManualUpdate, dynamic>> fields =
      const {
    #inventoryItemId: _f$inventoryItemId,
    #amount: _f$amount,
  };

  static WarehouseInventoryManualUpdate _instantiate(DecodingData data) {
    return WarehouseInventoryManualUpdate(
        data.dec(_f$inventoryItemId), data.dec(_f$amount));
  }

  @override
  final Function instantiate = _instantiate;

  static WarehouseInventoryManualUpdate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WarehouseInventoryManualUpdate>(map));
  }

  static WarehouseInventoryManualUpdate fromJson(String json) {
    return _guard((c) => c.fromJson<WarehouseInventoryManualUpdate>(json));
  }
}

mixin WarehouseInventoryManualUpdateMappable {
  String toJson() {
    return WarehouseInventoryManualUpdateMapper._guard(
        (c) => c.toJson(this as WarehouseInventoryManualUpdate));
  }

  Map<String, dynamic> toMap() {
    return WarehouseInventoryManualUpdateMapper._guard(
        (c) => c.toMap(this as WarehouseInventoryManualUpdate));
  }

  WarehouseInventoryManualUpdateCopyWith<WarehouseInventoryManualUpdate,
          WarehouseInventoryManualUpdate, WarehouseInventoryManualUpdate>
      get copyWith => _WarehouseInventoryManualUpdateCopyWithImpl(
          this as WarehouseInventoryManualUpdate, $identity, $identity);
  @override
  String toString() {
    return WarehouseInventoryManualUpdateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WarehouseInventoryManualUpdateMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WarehouseInventoryManualUpdateMapper._guard((c) => c.hash(this));
  }
}

extension WarehouseInventoryManualUpdateValueCopy<$R,
        $Out extends WarehouseInventoryManualUpdate>
    on ObjectCopyWith<$R, WarehouseInventoryManualUpdate, $Out> {
  WarehouseInventoryManualUpdateCopyWith<$R, WarehouseInventoryManualUpdate,
          $Out>
      get $asWarehouseInventoryManualUpdate => $base.as(
          (v, t, t2) => _WarehouseInventoryManualUpdateCopyWithImpl(v, t, t2));
}

typedef WarehouseInventoryManualUpdateCopyWithBound
    = WarehouseInventoryManualUpdate;

abstract class WarehouseInventoryManualUpdateCopyWith<
        $R,
        $In extends WarehouseInventoryManualUpdate,
        $Out extends WarehouseInventoryManualUpdate>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? inventoryItemId, int? amount});
  WarehouseInventoryManualUpdateCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends WarehouseInventoryManualUpdate>(
          Then<WarehouseInventoryManualUpdate, $Out2> t, Then<$Out2, $R2> t2);
}

class _WarehouseInventoryManualUpdateCopyWithImpl<$R,
        $Out extends WarehouseInventoryManualUpdate>
    extends ClassCopyWithBase<$R, WarehouseInventoryManualUpdate, $Out>
    implements
        WarehouseInventoryManualUpdateCopyWith<$R,
            WarehouseInventoryManualUpdate, $Out> {
  _WarehouseInventoryManualUpdateCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WarehouseInventoryManualUpdate> $mapper =
      WarehouseInventoryManualUpdateMapper.ensureInitialized();
  @override
  $R call({int? inventoryItemId, int? amount}) => $apply(FieldCopyWithData({
        if (inventoryItemId != null) #inventoryItemId: inventoryItemId,
        if (amount != null) #amount: amount
      }));
  @override
  WarehouseInventoryManualUpdate $make(CopyWithData data) =>
      WarehouseInventoryManualUpdate(
          data.get(#inventoryItemId, or: $value.inventoryItemId),
          data.get(#amount, or: $value.amount));

  @override
  WarehouseInventoryManualUpdateCopyWith<$R2, WarehouseInventoryManualUpdate,
      $Out2> $chain<$R2, $Out2 extends WarehouseInventoryManualUpdate>(
          Then<WarehouseInventoryManualUpdate, $Out2> t, Then<$Out2, $R2> t2) =>
      _WarehouseInventoryManualUpdateCopyWithImpl($value, t, t2);
}

class WarehouseInventoryManualUpdateResultMapper
    extends ClassMapperBase<WarehouseInventoryManualUpdateResult> {
  WarehouseInventoryManualUpdateResultMapper._();
  static WarehouseInventoryManualUpdateResultMapper? _instance;
  static WarehouseInventoryManualUpdateResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WarehouseInventoryManualUpdateResultMapper._());
      _InventoryUpdateOkMapper.ensureInitialized();
      _InventoryUpdateErrMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'WarehouseInventoryManualUpdateResult';

  @override
  final Map<Symbol, Field<WarehouseInventoryManualUpdateResult, dynamic>>
      fields = const {};

  static WarehouseInventoryManualUpdateResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'WarehouseInventoryManualUpdateResult',
        'Type',
        '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static WarehouseInventoryManualUpdateResult fromMap(
      Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<WarehouseInventoryManualUpdateResult>(map));
  }

  static WarehouseInventoryManualUpdateResult fromJson(String json) {
    return _guard(
        (c) => c.fromJson<WarehouseInventoryManualUpdateResult>(json));
  }
}

extension WarehouseInventoryManualUpdateResultMapperExtension
    on WarehouseInventoryManualUpdateResult {
  String toJson() {
    return WarehouseInventoryManualUpdateResultMapper._guard(
        (c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return WarehouseInventoryManualUpdateResultMapper._guard(
        (c) => c.toMap(this));
  }
}

typedef WarehouseInventoryManualUpdateResultCopyWithBound
    = WarehouseInventoryManualUpdateResult;

abstract class WarehouseInventoryManualUpdateResultCopyWith<
        $R,
        $In extends WarehouseInventoryManualUpdateResult,
        $Out extends WarehouseInventoryManualUpdateResult>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  WarehouseInventoryManualUpdateResultCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends WarehouseInventoryManualUpdateResult>(
          Then<WarehouseInventoryManualUpdateResult, $Out2> t,
          Then<$Out2, $R2> t2);
}

class _InventoryUpdateOkMapper extends SubClassMapperBase<_InventoryUpdateOk> {
  _InventoryUpdateOkMapper._();
  static _InventoryUpdateOkMapper? _instance;
  static _InventoryUpdateOkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryUpdateOkMapper._());
      WarehouseInventoryManualUpdateResultMapper.ensureInitialized()
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
  final String id = '_InventoryUpdateOk';

  static List<WarehouseInventoryItem> _$items(_InventoryUpdateOk v) => v.items;
  static const Field<_InventoryUpdateOk, List<WarehouseInventoryItem>>
      _f$items = Field('items', _$items);

  @override
  final Map<Symbol, Field<_InventoryUpdateOk, dynamic>> fields = const {
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      WarehouseInventoryManualUpdateResultMapper.ensureInitialized();

  static _InventoryUpdateOk _instantiate(DecodingData data) {
    return _InventoryUpdateOk(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryUpdateOk fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryUpdateOk>(map));
  }

  static _InventoryUpdateOk fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryUpdateOk>(json));
  }
}

extension _InventoryUpdateOkMapperExtension on _InventoryUpdateOk {
  String toJson() {
    return _InventoryUpdateOkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryUpdateOkMapper._guard((c) => c.toMap(this));
  }
}

class _InventoryUpdateErrMapper
    extends SubClassMapperBase<_InventoryUpdateErr> {
  _InventoryUpdateErrMapper._();
  static _InventoryUpdateErrMapper? _instance;
  static _InventoryUpdateErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InventoryUpdateErrMapper._());
      WarehouseInventoryManualUpdateResultMapper.ensureInitialized()
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
  final String id = '_InventoryUpdateErr';

  static DataError _$err(_InventoryUpdateErr v) => v.err;
  static const Field<_InventoryUpdateErr, DataError> _f$err =
      Field('err', _$err);

  @override
  final Map<Symbol, Field<_InventoryUpdateErr, dynamic>> fields = const {
    #err: _f$err,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      WarehouseInventoryManualUpdateResultMapper.ensureInitialized();

  static _InventoryUpdateErr _instantiate(DecodingData data) {
    return _InventoryUpdateErr(data.dec(_f$err));
  }

  @override
  final Function instantiate = _instantiate;

  static _InventoryUpdateErr fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InventoryUpdateErr>(map));
  }

  static _InventoryUpdateErr fromJson(String json) {
    return _guard((c) => c.fromJson<_InventoryUpdateErr>(json));
  }
}

extension _InventoryUpdateErrMapperExtension on _InventoryUpdateErr {
  String toJson() {
    return _InventoryUpdateErrMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InventoryUpdateErrMapper._guard((c) => c.toMap(this));
  }
}
