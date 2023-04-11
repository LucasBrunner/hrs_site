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

  static int _$accountId(AccountPublicData v) => v.accountId;
  static String _$email(AccountPublicData v) => v.email;
  static String _$preferredName(AccountPublicData v) => v.preferredName;
  static String _$legalName(AccountPublicData v) => v.legalName;

  @override
  final Map<Symbol, Field<AccountPublicData, dynamic>> fields = const {
    #accountId: Field<AccountPublicData, int>('accountId', _$accountId),
    #email: Field<AccountPublicData, String>('email', _$email),
    #preferredName:
        Field<AccountPublicData, String>('preferredName', _$preferredName),
    #legalName: Field<AccountPublicData, String>('legalName', _$legalName),
  };

  static AccountPublicData _instantiate(DecodingData data) {
    return AccountPublicData(data.get(#accountId), data.get(#email),
        data.get(#preferredName), data.get(#legalName));
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
  $R call(
      {int? accountId,
      String? email,
      String? preferredName,
      String? legalName});
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
  $R call(
          {int? accountId,
          String? email,
          String? preferredName,
          String? legalName}) =>
      $apply(FieldCopyWithData({
        if (accountId != null) #accountId: accountId,
        if (email != null) #email: email,
        if (preferredName != null) #preferredName: preferredName,
        if (legalName != null) #legalName: legalName
      }));
  @override
  AccountPublicData $make(CopyWithData data) => AccountPublicData(
      data.get(#accountId, or: $value.accountId),
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
  static List<Phone> _$phones(Account v) => v.phones;
  static List<Address> _$addresses(Account v) => v.addresses;

  @override
  final Map<Symbol, Field<Account, dynamic>> fields = const {
    #data: Field<Account, AccountPublicData>('data', _$data),
    #phones: Field<Account, List<Phone>>('phones', _$phones),
    #addresses: Field<Account, List<Address>>('addresses', _$addresses),
  };

  static Account _instantiate(DecodingData data) {
    return Account(data.get(#data), data.get(#phones), data.get(#addresses));
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

  AccountCopyWith<Account, Account, Account> get copyWith =>
      _AccountCopyWithImpl(this as Account, $identity, $identity);
  @override
  String toString() {
    return AccountMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AccountMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AccountMapper._guard((c) => c.hash(this));
  }
}

extension AccountValueCopy<$R, $Out extends Account>
    on ObjectCopyWith<$R, Account, $Out> {
  AccountCopyWith<$R, Account, $Out> get $asAccount =>
      $base.as((v, t, t2) => _AccountCopyWithImpl(v, t, t2));
}

typedef AccountCopyWithBound = Account;

abstract class AccountCopyWith<$R, $In extends Account, $Out extends Account>
    implements ClassCopyWith<$R, $In, $Out> {
  AccountPublicDataCopyWith<$R, AccountPublicData, AccountPublicData> get data;
  ListCopyWith<$R, Phone, PhoneCopyWith<$R, Phone, Phone>> get phones;
  ListCopyWith<$R, Address, AddressCopyWith<$R, Address, Address>>
      get addresses;
  $R call(
      {AccountPublicData? data, List<Phone>? phones, List<Address>? addresses});
  AccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Account>(
      Then<Account, $Out2> t, Then<$Out2, $R2> t2);
}

class _AccountCopyWithImpl<$R, $Out extends Account>
    extends ClassCopyWithBase<$R, Account, $Out>
    implements AccountCopyWith<$R, Account, $Out> {
  _AccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Account> $mapper =
      AccountMapper.ensureInitialized();
  @override
  AccountPublicDataCopyWith<$R, AccountPublicData, AccountPublicData>
      get data => $value.data.copyWith.$chain($identity, (v) => call(data: v));
  @override
  ListCopyWith<$R, Phone, PhoneCopyWith<$R, Phone, Phone>> get phones =>
      ListCopyWith(
          $value.phones,
          (v, t) => v.copyWith.$chain<$R, Phone>($identity, t),
          (v) => call(phones: v));
  @override
  ListCopyWith<$R, Address, AddressCopyWith<$R, Address, Address>>
      get addresses => ListCopyWith(
          $value.addresses,
          (v, t) => v.copyWith.$chain<$R, Address>($identity, t),
          (v) => call(addresses: v));
  @override
  $R call(
          {AccountPublicData? data,
          List<Phone>? phones,
          List<Address>? addresses}) =>
      $apply(FieldCopyWithData({
        if (data != null) #data: data,
        if (phones != null) #phones: phones,
        if (addresses != null) #addresses: addresses
      }));
  @override
  Account $make(CopyWithData data) => Account(
      data.get(#data, or: $value.data),
      data.get(#phones, or: $value.phones),
      data.get(#addresses, or: $value.addresses));

  @override
  AccountCopyWith<$R2, Account, $Out2> $chain<$R2, $Out2 extends Account>(
          Then<Account, $Out2> t, Then<$Out2, $R2> t2) =>
      _AccountCopyWithImpl($value, t, t2);
}

class AccountResultMapper extends ClassMapperBase<AccountResult> {
  AccountResultMapper._();
  static AccountResultMapper? _instance;
  static AccountResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountResultMapper._());
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
  final String id = 'AccountResult';

  @override
  final Map<Symbol, Field<AccountResult, dynamic>> fields = const {};

  static AccountResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'AccountResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static AccountResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AccountResult>(map));
  }

  static AccountResult fromJson(String json) {
    return _guard((c) => c.fromJson<AccountResult>(json));
  }
}

extension AccountResultMapperExtension on AccountResult {
  String toJson() {
    return AccountResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return AccountResultMapper._guard((c) => c.toMap(this));
  }
}

typedef AccountResultCopyWithBound = AccountResult;

abstract class AccountResultCopyWith<$R, $In extends AccountResult,
    $Out extends AccountResult> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AccountResultCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends AccountResult>(
          Then<AccountResult, $Out2> t, Then<$Out2, $R2> t2);
}

class _OkMapper extends SubClassMapperBase<_Ok> {
  _OkMapper._();
  static _OkMapper? _instance;
  static _OkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _OkMapper._());
      AccountResultMapper.ensureInitialized().addSubMapper(_instance!);
      AccountMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Ok';

  static Account _$account(_Ok v) => v.account;

  @override
  final Map<Symbol, Field<_Ok, dynamic>> fields = const {
    #account: Field<_Ok, Account>('account', _$account),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      AccountResultMapper.ensureInitialized();

  static _Ok _instantiate(DecodingData data) {
    return _Ok(data.get(#account));
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
      AccountResultMapper.ensureInitialized().addSubMapper(_instance!);
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
      AccountResultMapper.ensureInitialized();

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
