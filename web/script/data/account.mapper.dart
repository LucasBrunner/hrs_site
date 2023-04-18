// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'account.dart';

class AccountPublicDataMapper extends ClassMapperBase<AccountPublicData> {
  AccountPublicDataMapper._();
  static AccountPublicDataMapper? _instance;
  static AccountPublicDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountPublicDataMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AccountPublicData';

  static String _$email(AccountPublicData v) => v.email;
  static const Field<AccountPublicData, String> _f$email =
      Field('email', _$email);
  static String _$preferredName(AccountPublicData v) => v.preferredName;
  static const Field<AccountPublicData, String> _f$preferredName =
      Field('preferredName', _$preferredName);
  static String _$legalName(AccountPublicData v) => v.legalName;
  static const Field<AccountPublicData, String> _f$legalName =
      Field('legalName', _$legalName);

  @override
  final Map<Symbol, Field<AccountPublicData, dynamic>> fields = const {
    #email: _f$email,
    #preferredName: _f$preferredName,
    #legalName: _f$legalName,
  };

  static AccountPublicData _instantiate(DecodingData data) {
    return AccountPublicData(
        data.dec(_f$email), data.dec(_f$preferredName), data.dec(_f$legalName));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountPublicData fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AccountPublicData>(map));
  }

  static AccountPublicData fromJson(String json) {
    return _guard((c) => c.fromJson<AccountPublicData>(json));
  }
}

mixin AccountPublicDataMappable {
  String toJson() {
    return AccountPublicDataMapper._guard(
        (c) => c.toJson(this as AccountPublicData));
  }

  Map<String, dynamic> toMap() {
    return AccountPublicDataMapper._guard(
        (c) => c.toMap(this as AccountPublicData));
  }

  AccountPublicDataCopyWith<AccountPublicData, AccountPublicData,
          AccountPublicData>
      get copyWith => _AccountPublicDataCopyWithImpl(
          this as AccountPublicData, $identity, $identity);
  @override
  String toString() {
    return AccountPublicDataMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AccountPublicDataMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AccountPublicDataMapper._guard((c) => c.hash(this));
  }
}

extension AccountPublicDataValueCopy<$R, $Out extends AccountPublicData>
    on ObjectCopyWith<$R, AccountPublicData, $Out> {
  AccountPublicDataCopyWith<$R, AccountPublicData, $Out>
      get $asAccountPublicData =>
          $base.as((v, t, t2) => _AccountPublicDataCopyWithImpl(v, t, t2));
}

typedef AccountPublicDataCopyWithBound = AccountPublicData;

abstract class AccountPublicDataCopyWith<$R, $In extends AccountPublicData,
    $Out extends AccountPublicData> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email, String? preferredName, String? legalName});
  AccountPublicDataCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends AccountPublicData>(
          Then<AccountPublicData, $Out2> t, Then<$Out2, $R2> t2);
}

class _AccountPublicDataCopyWithImpl<$R, $Out extends AccountPublicData>
    extends ClassCopyWithBase<$R, AccountPublicData, $Out>
    implements AccountPublicDataCopyWith<$R, AccountPublicData, $Out> {
  _AccountPublicDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountPublicData> $mapper =
      AccountPublicDataMapper.ensureInitialized();
  @override
  $R call({String? email, String? preferredName, String? legalName}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (preferredName != null) #preferredName: preferredName,
        if (legalName != null) #legalName: legalName
      }));
  @override
  AccountPublicData $make(CopyWithData data) => AccountPublicData(
      data.get(#email, or: $value.email),
      data.get(#preferredName, or: $value.preferredName),
      data.get(#legalName, or: $value.legalName));

  @override
  AccountPublicDataCopyWith<$R2, AccountPublicData, $Out2>
      $chain<$R2, $Out2 extends AccountPublicData>(
              Then<AccountPublicData, $Out2> t, Then<$Out2, $R2> t2) =>
          _AccountPublicDataCopyWithImpl($value, t, t2);
}

class AccountMapper extends ClassMapperBase<Account> {
  AccountMapper._();
  static AccountMapper? _instance;
  static AccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountMapper._());
      AccountPublicDataMapper.ensureInitialized();
      DataWithIdMapper.ensureInitialized();
      PhoneMapper.ensureInitialized();
      AddressMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Account';

  static AccountPublicData _$data(Account v) => v.data;
  static const Field<Account, AccountPublicData> _f$data =
      Field('data', _$data);
  static List<DataWithId<Phone>> _$phones(Account v) => v.phones;
  static const Field<Account, List<DataWithId<Phone>>> _f$phones =
      Field('phones', _$phones);
  static List<DataWithId<Address>> _$addresses(Account v) => v.addresses;
  static const Field<Account, List<DataWithId<Address>>> _f$addresses =
      Field('addresses', _$addresses);

  @override
  final Map<Symbol, Field<Account, dynamic>> fields = const {
    #data: _f$data,
    #phones: _f$phones,
    #addresses: _f$addresses,
  };

  static Account _instantiate(DecodingData data) {
    return Account(
        data.dec(_f$data), data.dec(_f$phones), data.dec(_f$addresses));
  }

  @override
  final Function instantiate = _instantiate;

  static Account fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Account>(map));
  }

  static Account fromJson(String json) {
    return _guard((c) => c.fromJson<Account>(json));
  }
}

mixin AccountMappable {
  String toJson() {
    return AccountMapper._guard((c) => c.toJson(this as Account));
  }

  Map<String, dynamic> toMap() {
    return AccountMapper._guard((c) => c.toMap(this as Account));
  }
}

class AccountUpdateMapper extends ClassMapperBase<AccountUpdate> {
  AccountUpdateMapper._();
  static AccountUpdateMapper? _instance;
  static AccountUpdateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountUpdateMapper._());
      UpdateTypeMapper.ensureInitialized();
      DataMaybeIdMapper.ensureInitialized();
      PhoneMapper.ensureInitialized();
      AddressMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AccountUpdate';

  static UpdateType<String> _$email(AccountUpdate v) => v.email;
  static const Field<AccountUpdate, UpdateType<String>> _f$email =
      Field('email', _$email);
  static UpdateType<String> _$legalName(AccountUpdate v) => v.legalName;
  static const Field<AccountUpdate, UpdateType<String>> _f$legalName =
      Field('legalName', _$legalName);
  static UpdateType<String> _$preferredName(AccountUpdate v) => v.preferredName;
  static const Field<AccountUpdate, UpdateType<String>> _f$preferredName =
      Field('preferredName', _$preferredName);
  static List<UpdateType<DataMaybeId<Phone>>> _$phones(AccountUpdate v) =>
      v.phones;
  static const Field<AccountUpdate, List<UpdateType<DataMaybeId<Phone>>>>
      _f$phones = Field('phones', _$phones);
  static List<UpdateType<DataMaybeId<Address>>> _$addresses(AccountUpdate v) =>
      v.addresses;
  static const Field<AccountUpdate, List<UpdateType<DataMaybeId<Address>>>>
      _f$addresses = Field('addresses', _$addresses);

  @override
  final Map<Symbol, Field<AccountUpdate, dynamic>> fields = const {
    #email: _f$email,
    #legalName: _f$legalName,
    #preferredName: _f$preferredName,
    #phones: _f$phones,
    #addresses: _f$addresses,
  };

  static AccountUpdate _instantiate(DecodingData data) {
    return AccountUpdate(
        data.dec(_f$email),
        data.dec(_f$legalName),
        data.dec(_f$preferredName),
        data.dec(_f$phones),
        data.dec(_f$addresses));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountUpdate fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AccountUpdate>(map));
  }

  static AccountUpdate fromJson(String json) {
    return _guard((c) => c.fromJson<AccountUpdate>(json));
  }
}

mixin AccountUpdateMappable {
  String toJson() {
    return AccountUpdateMapper._guard((c) => c.toJson(this as AccountUpdate));
  }

  Map<String, dynamic> toMap() {
    return AccountUpdateMapper._guard((c) => c.toMap(this as AccountUpdate));
  }

  AccountUpdateCopyWith<AccountUpdate, AccountUpdate, AccountUpdate>
      get copyWith => _AccountUpdateCopyWithImpl(
          this as AccountUpdate, $identity, $identity);
  @override
  String toString() {
    return AccountUpdateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AccountUpdateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AccountUpdateMapper._guard((c) => c.hash(this));
  }
}

extension AccountUpdateValueCopy<$R, $Out extends AccountUpdate>
    on ObjectCopyWith<$R, AccountUpdate, $Out> {
  AccountUpdateCopyWith<$R, AccountUpdate, $Out> get $asAccountUpdate =>
      $base.as((v, t, t2) => _AccountUpdateCopyWithImpl(v, t, t2));
}

typedef AccountUpdateCopyWithBound = AccountUpdate;

abstract class AccountUpdateCopyWith<$R, $In extends AccountUpdate,
    $Out extends AccountUpdate> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      UpdateType<DataMaybeId<Phone>>,
      ObjectCopyWith<$R, UpdateType<DataMaybeId<Phone>>,
          UpdateType<DataMaybeId<Phone>>>> get phones;
  ListCopyWith<
      $R,
      UpdateType<DataMaybeId<Address>>,
      ObjectCopyWith<$R, UpdateType<DataMaybeId<Address>>,
          UpdateType<DataMaybeId<Address>>>> get addresses;
  $R call(
      {UpdateType<String>? email,
      UpdateType<String>? legalName,
      UpdateType<String>? preferredName,
      List<UpdateType<DataMaybeId<Phone>>>? phones,
      List<UpdateType<DataMaybeId<Address>>>? addresses});
  AccountUpdateCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends AccountUpdate>(
          Then<AccountUpdate, $Out2> t, Then<$Out2, $R2> t2);
}

class _AccountUpdateCopyWithImpl<$R, $Out extends AccountUpdate>
    extends ClassCopyWithBase<$R, AccountUpdate, $Out>
    implements AccountUpdateCopyWith<$R, AccountUpdate, $Out> {
  _AccountUpdateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountUpdate> $mapper =
      AccountUpdateMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      UpdateType<DataMaybeId<Phone>>,
      ObjectCopyWith<$R, UpdateType<DataMaybeId<Phone>>,
          UpdateType<DataMaybeId<Phone>>>> get phones => ListCopyWith(
      $value.phones,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(phones: v));
  @override
  ListCopyWith<
      $R,
      UpdateType<DataMaybeId<Address>>,
      ObjectCopyWith<$R, UpdateType<DataMaybeId<Address>>,
          UpdateType<DataMaybeId<Address>>>> get addresses => ListCopyWith(
      $value.addresses,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(addresses: v));
  @override
  $R call(
          {UpdateType<String>? email,
          UpdateType<String>? legalName,
          UpdateType<String>? preferredName,
          List<UpdateType<DataMaybeId<Phone>>>? phones,
          List<UpdateType<DataMaybeId<Address>>>? addresses}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (legalName != null) #legalName: legalName,
        if (preferredName != null) #preferredName: preferredName,
        if (phones != null) #phones: phones,
        if (addresses != null) #addresses: addresses
      }));
  @override
  AccountUpdate $make(CopyWithData data) => AccountUpdate(
      data.get(#email, or: $value.email),
      data.get(#legalName, or: $value.legalName),
      data.get(#preferredName, or: $value.preferredName),
      data.get(#phones, or: $value.phones),
      data.get(#addresses, or: $value.addresses));

  @override
  AccountUpdateCopyWith<$R2, AccountUpdate, $Out2>
      $chain<$R2, $Out2 extends AccountUpdate>(
              Then<AccountUpdate, $Out2> t, Then<$Out2, $R2> t2) =>
          _AccountUpdateCopyWithImpl($value, t, t2);
}
