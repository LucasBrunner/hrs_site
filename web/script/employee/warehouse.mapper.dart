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
