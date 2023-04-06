// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'warehouses.dart';

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

class WarehouseResultMapper extends ClassMapperBase<WarehouseResult> {
  WarehouseResultMapper._();
  static WarehouseResultMapper? _instance;
  static WarehouseResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WarehouseResultMapper._());
      _WarehouseOkMapper.ensureInitialized();
      _WarehouseErrMapper.ensureInitialized();
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

class _WarehouseOkMapper extends SubClassMapperBase<_WarehouseOk> {
  _WarehouseOkMapper._();
  static _WarehouseOkMapper? _instance;
  static _WarehouseOkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _WarehouseOkMapper._());
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
  final String id = '_WarehouseOk';

  static List<Warehouse> _$warehouses(_WarehouseOk v) => v.warehouses;

  @override
  final Map<Symbol, Field<_WarehouseOk, dynamic>> fields = const {
    #warehouses:
        Field<_WarehouseOk, List<Warehouse>>('warehouses', _$warehouses),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      WarehouseResultMapper.ensureInitialized();

  static _WarehouseOk _instantiate(DecodingData data) {
    return _WarehouseOk(data.get(#warehouses));
  }

  @override
  final Function instantiate = _instantiate;

  static _WarehouseOk fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_WarehouseOk>(map));
  }

  static _WarehouseOk fromJson(String json) {
    return _guard((c) => c.fromJson<_WarehouseOk>(json));
  }
}

extension _WarehouseOkMapperExtension on _WarehouseOk {
  String toJson() {
    return _WarehouseOkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _WarehouseOkMapper._guard((c) => c.toMap(this));
  }
}

class _WarehouseErrMapper extends SubClassMapperBase<_WarehouseErr> {
  _WarehouseErrMapper._();
  static _WarehouseErrMapper? _instance;
  static _WarehouseErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _WarehouseErrMapper._());
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
  final String id = '_WarehouseErr';

  static DataError _$err(_WarehouseErr v) => v.err;

  @override
  final Map<Symbol, Field<_WarehouseErr, dynamic>> fields = const {
    #err: Field<_WarehouseErr, DataError>('err', _$err),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      WarehouseResultMapper.ensureInitialized();

  static _WarehouseErr _instantiate(DecodingData data) {
    return _WarehouseErr(data.get(#err));
  }

  @override
  final Function instantiate = _instantiate;

  static _WarehouseErr fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_WarehouseErr>(map));
  }

  static _WarehouseErr fromJson(String json) {
    return _guard((c) => c.fromJson<_WarehouseErr>(json));
  }
}

extension _WarehouseErrMapperExtension on _WarehouseErr {
  String toJson() {
    return _WarehouseErrMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _WarehouseErrMapper._guard((c) => c.toMap(this));
  }
}
