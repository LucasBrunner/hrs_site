// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'phone.dart';

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

  static String _$number(Phone v) => v.number;
  static const Field<Phone, String> _f$number = Field('number', _$number);
  static PhoneType _$phoneType(Phone v) => v.phoneType;
  static const Field<Phone, PhoneType> _f$phoneType =
      Field('phoneType', _$phoneType);

  @override
  final Map<Symbol, Field<Phone, dynamic>> fields = const {
    #number: _f$number,
    #phoneType: _f$phoneType,
  };

  static Phone _instantiate(DecodingData data) {
    return Phone(data.dec(_f$number), data.dec(_f$phoneType));
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
  $R call({String? number, PhoneType? phoneType});
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
  $R call({String? number, PhoneType? phoneType}) => $apply(FieldCopyWithData({
        if (number != null) #number: number,
        if (phoneType != null) #phoneType: phoneType
      }));
  @override
  Phone $make(CopyWithData data) => Phone(data.get(#number, or: $value.number),
      data.get(#phoneType, or: $value.phoneType));

  @override
  PhoneCopyWith<$R2, Phone, $Out2> $chain<$R2, $Out2 extends Phone>(
          Then<Phone, $Out2> t, Then<$Out2, $R2> t2) =>
      _PhoneCopyWithImpl($value, t, t2);
}

class PhoneTypeMapper extends EnumMapper<PhoneType> {
  PhoneTypeMapper._();
  static PhoneTypeMapper? _instance;
  static PhoneTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhoneTypeMapper._());
    }
    return _instance!;
  }

  static PhoneType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PhoneType decode(dynamic value) {
    switch (value) {
      case 'landline':
        return PhoneType.landline;
      case 'mobile':
        return PhoneType.mobile;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PhoneType self) {
    switch (self) {
      case PhoneType.landline:
        return 'landline';
      case PhoneType.mobile:
        return 'mobile';
    }
  }
}

extension PhoneTypeMapperExtension on PhoneType {
  String toValue() {
    PhoneTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
