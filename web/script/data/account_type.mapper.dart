// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'account_type.dart';

class AccountTypeMapper extends ClassMapperBase<AccountType> {
  AccountTypeMapper._();
  static AccountTypeMapper? _instance;
  static AccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountTypeMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AccountType';

  static int _$accountTypeId(AccountType v) => v.accountTypeId;
  static const Field<AccountType, int> _f$accountTypeId =
      Field('accountTypeId', _$accountTypeId);
  static String _$name(AccountType v) => v.name;
  static const Field<AccountType, String> _f$name = Field('name', _$name);

  @override
  final Map<Symbol, Field<AccountType, dynamic>> fields = const {
    #accountTypeId: _f$accountTypeId,
    #name: _f$name,
  };

  static AccountType _instantiate(DecodingData data) {
    return AccountType(data.dec(_f$accountTypeId), data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountType fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AccountType>(map));
  }

  static AccountType fromJson(String json) {
    return _guard((c) => c.fromJson<AccountType>(json));
  }
}

mixin AccountTypeMappable {
  String toJson() {
    return AccountTypeMapper._guard((c) => c.toJson(this as AccountType));
  }

  Map<String, dynamic> toMap() {
    return AccountTypeMapper._guard((c) => c.toMap(this as AccountType));
  }

  AccountTypeCopyWith<AccountType, AccountType, AccountType> get copyWith =>
      _AccountTypeCopyWithImpl(this as AccountType, $identity, $identity);
  @override
  String toString() {
    return AccountTypeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AccountTypeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AccountTypeMapper._guard((c) => c.hash(this));
  }
}

extension AccountTypeValueCopy<$R, $Out extends AccountType>
    on ObjectCopyWith<$R, AccountType, $Out> {
  AccountTypeCopyWith<$R, AccountType, $Out> get $asAccountType =>
      $base.as((v, t, t2) => _AccountTypeCopyWithImpl(v, t, t2));
}

typedef AccountTypeCopyWithBound = AccountType;

abstract class AccountTypeCopyWith<$R, $In extends AccountType,
    $Out extends AccountType> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? accountTypeId, String? name});
  AccountTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends AccountType>(
      Then<AccountType, $Out2> t, Then<$Out2, $R2> t2);
}

class _AccountTypeCopyWithImpl<$R, $Out extends AccountType>
    extends ClassCopyWithBase<$R, AccountType, $Out>
    implements AccountTypeCopyWith<$R, AccountType, $Out> {
  _AccountTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountType> $mapper =
      AccountTypeMapper.ensureInitialized();
  @override
  $R call({int? accountTypeId, String? name}) => $apply(FieldCopyWithData({
        if (accountTypeId != null) #accountTypeId: accountTypeId,
        if (name != null) #name: name
      }));
  @override
  AccountType $make(CopyWithData data) => AccountType(
      data.get(#accountTypeId, or: $value.accountTypeId),
      data.get(#name, or: $value.name));

  @override
  AccountTypeCopyWith<$R2, AccountType, $Out2>
      $chain<$R2, $Out2 extends AccountType>(
              Then<AccountType, $Out2> t, Then<$Out2, $R2> t2) =>
          _AccountTypeCopyWithImpl($value, t, t2);
}
