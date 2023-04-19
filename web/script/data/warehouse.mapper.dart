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

  static String _$name(Warehouse v) => v.name;
  static const Field<Warehouse, String> _f$name = Field('name', _$name);
  static String _$phoneType(Warehouse v) => v.phoneType;
  static const Field<Warehouse, String> _f$phoneType =
      Field('phoneType', _$phoneType);
  static String _$phoneNumber(Warehouse v) => v.phoneNumber;
  static const Field<Warehouse, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);
  static String _$addressStreet(Warehouse v) => v.addressStreet;
  static const Field<Warehouse, String> _f$addressStreet =
      Field('addressStreet', _$addressStreet);
  static String _$addressCity(Warehouse v) => v.addressCity;
  static const Field<Warehouse, String> _f$addressCity =
      Field('addressCity', _$addressCity);
  static String _$addressState(Warehouse v) => v.addressState;
  static const Field<Warehouse, String> _f$addressState =
      Field('addressState', _$addressState);
  static String _$addressZip(Warehouse v) => v.addressZip;
  static const Field<Warehouse, String> _f$addressZip =
      Field('addressZip', _$addressZip);

  @override
  final Map<Symbol, Field<Warehouse, dynamic>> fields = const {
    #name: _f$name,
    #phoneType: _f$phoneType,
    #phoneNumber: _f$phoneNumber,
    #addressStreet: _f$addressStreet,
    #addressCity: _f$addressCity,
    #addressState: _f$addressState,
    #addressZip: _f$addressZip,
  };

  static Warehouse _instantiate(DecodingData data) {
    return Warehouse(
        data.dec(_f$name),
        data.dec(_f$phoneType),
        data.dec(_f$phoneNumber),
        data.dec(_f$addressStreet),
        data.dec(_f$addressCity),
        data.dec(_f$addressState),
        data.dec(_f$addressZip));
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
      {String? name,
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
          {String? name,
          String? phoneType,
          String? phoneNumber,
          String? addressStreet,
          String? addressCity,
          String? addressState,
          String? addressZip}) =>
      $apply(FieldCopyWithData({
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
