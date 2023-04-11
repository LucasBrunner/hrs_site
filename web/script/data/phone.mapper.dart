// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'phone.dart';

class PhoneTypeMapper extends ClassMapperBase<PhoneType> {
  PhoneTypeMapper._();
  static PhoneTypeMapper? _instance;
  static PhoneTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhoneTypeMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PhoneType';

  static int _$id(PhoneType v) => v.id;
  static String _$name(PhoneType v) => v.name;

  @override
  final Map<Symbol, Field<PhoneType, dynamic>> fields = const {
    #id: Field<PhoneType, int>('id', _$id),
    #name: Field<PhoneType, String>('name', _$name),
  };

  static PhoneType _instantiate(DecodingData data) {
    return PhoneType(data.get(#id), data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static PhoneType fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PhoneType>(map));
  }

  static PhoneType fromJson(String json) {
    return _guard((c) => c.fromJson<PhoneType>(json));
  }
}

mixin PhoneTypeMappable {
  String toJson() {
    return PhoneTypeMapper._guard((c) => c.toJson(this as PhoneType));
  }

  Map<String, dynamic> toMap() {
    return PhoneTypeMapper._guard((c) => c.toMap(this as PhoneType));
  }

  PhoneTypeCopyWith<PhoneType, PhoneType, PhoneType> get copyWith =>
      _PhoneTypeCopyWithImpl(this as PhoneType, $identity, $identity);
  @override
  String toString() {
    return PhoneTypeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PhoneTypeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PhoneTypeMapper._guard((c) => c.hash(this));
  }
}

extension PhoneTypeValueCopy<$R, $Out extends PhoneType>
    on ObjectCopyWith<$R, PhoneType, $Out> {
  PhoneTypeCopyWith<$R, PhoneType, $Out> get $asPhoneType =>
      $base.as((v, t, t2) => _PhoneTypeCopyWithImpl(v, t, t2));
}

typedef PhoneTypeCopyWithBound = PhoneType;

abstract class PhoneTypeCopyWith<$R, $In extends PhoneType,
    $Out extends PhoneType> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  PhoneTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends PhoneType>(
      Then<PhoneType, $Out2> t, Then<$Out2, $R2> t2);
}

class _PhoneTypeCopyWithImpl<$R, $Out extends PhoneType>
    extends ClassCopyWithBase<$R, PhoneType, $Out>
    implements PhoneTypeCopyWith<$R, PhoneType, $Out> {
  _PhoneTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhoneType> $mapper =
      PhoneTypeMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  PhoneType $make(CopyWithData data) =>
      PhoneType(data.get(#id, or: $value.id), data.get(#name, or: $value.name));

  @override
  PhoneTypeCopyWith<$R2, PhoneType, $Out2> $chain<$R2, $Out2 extends PhoneType>(
          Then<PhoneType, $Out2> t, Then<$Out2, $R2> t2) =>
      _PhoneTypeCopyWithImpl($value, t, t2);
}

class PhoneMapper extends ClassMapperBase<Phone> {
  PhoneMapper._();
  static PhoneMapper? _instance;
  static PhoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhoneMapper._());
      PhoneTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Phone';

  static int _$phoneId(Phone v) => v.phoneId;
  static String _$number(Phone v) => v.number;
  static PhoneType _$phoneType(Phone v) => v.phoneType;

  @override
  final Map<Symbol, Field<Phone, dynamic>> fields = const {
    #phoneId: Field<Phone, int>('phoneId', _$phoneId),
    #number: Field<Phone, String>('number', _$number),
    #phoneType: Field<Phone, PhoneType>('phoneType', _$phoneType),
  };

  static Phone _instantiate(DecodingData data) {
    return Phone(data.get(#phoneId), data.get(#number), data.get(#phoneType));
  }

  @override
  final Function instantiate = _instantiate;

  static Phone fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Phone>(map));
  }

  static Phone fromJson(String json) {
    return _guard((c) => c.fromJson<Phone>(json));
  }
}

mixin PhoneMappable {
  String toJson() {
    return PhoneMapper._guard((c) => c.toJson(this as Phone));
  }

  Map<String, dynamic> toMap() {
    return PhoneMapper._guard((c) => c.toMap(this as Phone));
  }

  PhoneCopyWith<Phone, Phone, Phone> get copyWith =>
      _PhoneCopyWithImpl(this as Phone, $identity, $identity);
  @override
  String toString() {
    return PhoneMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PhoneMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PhoneMapper._guard((c) => c.hash(this));
  }
}

extension PhoneValueCopy<$R, $Out extends Phone>
    on ObjectCopyWith<$R, Phone, $Out> {
  PhoneCopyWith<$R, Phone, $Out> get $asPhone =>
      $base.as((v, t, t2) => _PhoneCopyWithImpl(v, t, t2));
}

typedef PhoneCopyWithBound = Phone;

abstract class PhoneCopyWith<$R, $In extends Phone, $Out extends Phone>
    implements ClassCopyWith<$R, $In, $Out> {
  PhoneTypeCopyWith<$R, PhoneType, PhoneType> get phoneType;
  $R call({int? phoneId, String? number, PhoneType? phoneType});
  PhoneCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Phone>(
      Then<Phone, $Out2> t, Then<$Out2, $R2> t2);
}

class _PhoneCopyWithImpl<$R, $Out extends Phone>
    extends ClassCopyWithBase<$R, Phone, $Out>
    implements PhoneCopyWith<$R, Phone, $Out> {
  _PhoneCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Phone> $mapper = PhoneMapper.ensureInitialized();
  @override
  PhoneTypeCopyWith<$R, PhoneType, PhoneType> get phoneType =>
      $value.phoneType.copyWith.$chain($identity, (v) => call(phoneType: v));
  @override
  $R call({int? phoneId, String? number, PhoneType? phoneType}) =>
      $apply(FieldCopyWithData({
        if (phoneId != null) #phoneId: phoneId,
        if (number != null) #number: number,
        if (phoneType != null) #phoneType: phoneType
      }));
  @override
  Phone $make(CopyWithData data) => Phone(
      data.get(#phoneId, or: $value.phoneId),
      data.get(#number, or: $value.number),
      data.get(#phoneType, or: $value.phoneType));

  @override
  PhoneCopyWith<$R2, Phone, $Out2> $chain<$R2, $Out2 extends Phone>(
          Then<Phone, $Out2> t, Then<$Out2, $R2> t2) =>
      _PhoneCopyWithImpl($value, t, t2);
}
