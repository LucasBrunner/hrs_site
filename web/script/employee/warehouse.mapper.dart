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
      AddressMapper.ensureInitialized();
      PhoneMapper.ensureInitialized();
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
  static Address _$address(Warehouse v) => v.address;
  static Phone _$phone(Warehouse v) => v.phone;

  @override
  final Map<Symbol, Field<Warehouse, dynamic>> fields = const {
    #id: Field<Warehouse, int>('id', _$id),
    #name: Field<Warehouse, String>('name', _$name),
    #address: Field<Warehouse, Address>('address', _$address),
    #phone: Field<Warehouse, Phone>('phone', _$phone),
  };

  static Warehouse _instantiate(DecodingData data) {
    return Warehouse(
        data.get(#id), data.get(#name), data.get(#address), data.get(#phone));
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
  AddressCopyWith<$R, Address, Address> get address;
  PhoneCopyWith<$R, Phone, Phone> get phone;
  $R call({int? id, String? name, Address? address, Phone? phone});
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
  AddressCopyWith<$R, Address, Address> get address =>
      $value.address.copyWith.$chain($identity, (v) => call(address: v));
  @override
  PhoneCopyWith<$R, Phone, Phone> get phone =>
      $value.phone.copyWith.$chain($identity, (v) => call(phone: v));
  @override
  $R call({int? id, String? name, Address? address, Phone? phone}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (address != null) #address: address,
        if (phone != null) #phone: phone
      }));
  @override
  Warehouse $make(CopyWithData data) => Warehouse(
      data.get(#id, or: $value.id),
      data.get(#name, or: $value.name),
      data.get(#address, or: $value.address),
      data.get(#phone, or: $value.phone));

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
