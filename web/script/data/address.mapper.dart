// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'address.dart';

class AddressMapper extends ClassMapperBase<Address> {
  AddressMapper._();
  static AddressMapper? _instance;
  static AddressMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Address';

  static String _$street(Address v) => v.street;
  static const Field<Address, String> _f$street = Field('street', _$street);
  static String _$city(Address v) => v.city;
  static const Field<Address, String> _f$city = Field('city', _$city);
  static String _$state(Address v) => v.state;
  static const Field<Address, String> _f$state = Field('state', _$state);
  static String _$zip(Address v) => v.zip;
  static const Field<Address, String> _f$zip = Field('zip', _$zip);

  @override
  final Map<Symbol, Field<Address, dynamic>> fields = const {
    #street: _f$street,
    #city: _f$city,
    #state: _f$state,
    #zip: _f$zip,
  };

  static Address _instantiate(DecodingData data) {
    return Address(data.dec(_f$street), data.dec(_f$city), data.dec(_f$state),
        data.dec(_f$zip));
  }

  @override
  final Function instantiate = _instantiate;

  static Address fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Address>(map));
  }

  static Address fromJson(String json) {
    return _guard((c) => c.fromJson<Address>(json));
  }
}

mixin AddressMappable {
  String toJson() {
    return AddressMapper._guard((c) => c.toJson(this as Address));
  }

  Map<String, dynamic> toMap() {
    return AddressMapper._guard((c) => c.toMap(this as Address));
  }

  AddressCopyWith<Address, Address, Address> get copyWith =>
      _AddressCopyWithImpl(this as Address, $identity, $identity);
  @override
  String toString() {
    return AddressMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AddressMapper._guard((c) => c.hash(this));
  }
}

extension AddressValueCopy<$R, $Out extends Address>
    on ObjectCopyWith<$R, Address, $Out> {
  AddressCopyWith<$R, Address, $Out> get $asAddress =>
      $base.as((v, t, t2) => _AddressCopyWithImpl(v, t, t2));
}

typedef AddressCopyWithBound = Address;

abstract class AddressCopyWith<$R, $In extends Address, $Out extends Address>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? street, String? city, String? state, String? zip});
  AddressCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Address>(
      Then<Address, $Out2> t, Then<$Out2, $R2> t2);
}

class _AddressCopyWithImpl<$R, $Out extends Address>
    extends ClassCopyWithBase<$R, Address, $Out>
    implements AddressCopyWith<$R, Address, $Out> {
  _AddressCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Address> $mapper =
      AddressMapper.ensureInitialized();
  @override
  $R call({String? street, String? city, String? state, String? zip}) =>
      $apply(FieldCopyWithData({
        if (street != null) #street: street,
        if (city != null) #city: city,
        if (state != null) #state: state,
        if (zip != null) #zip: zip
      }));
  @override
  Address $make(CopyWithData data) => Address(
      data.get(#street, or: $value.street),
      data.get(#city, or: $value.city),
      data.get(#state, or: $value.state),
      data.get(#zip, or: $value.zip));

  @override
  AddressCopyWith<$R2, Address, $Out2> $chain<$R2, $Out2 extends Address>(
          Then<Address, $Out2> t, Then<$Out2, $R2> t2) =>
      _AddressCopyWithImpl($value, t, t2);
}
