// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'signin.dart';

class SigninFailureMapper extends ClassMapperBase<SigninFailure> {
  SigninFailureMapper._();
  static SigninFailureMapper? _instance;
  static SigninFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SigninFailureMapper._());
      _DecodeErrorMapper.ensureInitialized();
      _SigninFailureMapper.ensureInitialized();
      _DatabaseErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SigninFailure';

  @override
  final Map<Symbol, Field<SigninFailure, dynamic>> fields = const {};

  static SigninFailure _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SigninFailure', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SigninFailure fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SigninFailure>(map));
  }

  static SigninFailure fromJson(String json) {
    return _guard((c) => c.fromJson<SigninFailure>(json));
  }
}

extension SigninFailureMapperExtension on SigninFailure {
  String toJson() {
    return SigninFailureMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SigninFailureMapper._guard((c) => c.toMap(this));
  }
}

typedef SigninFailureCopyWithBound = SigninFailure;

abstract class SigninFailureCopyWith<$R, $In extends SigninFailure,
    $Out extends SigninFailure> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SigninFailureCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends SigninFailure>(
          Then<SigninFailure, $Out2> t, Then<$Out2, $R2> t2);
}

class _DecodeErrorMapper extends SubClassMapperBase<_DecodeError> {
  _DecodeErrorMapper._();
  static _DecodeErrorMapper? _instance;
  static _DecodeErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _DecodeErrorMapper._());
      SigninFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_DecodeError';

  @override
  final Map<Symbol, Field<_DecodeError, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'DecodeError';
  @override
  late final ClassMapperBase superMapper =
      SigninFailureMapper.ensureInitialized();

  static _DecodeError _instantiate(DecodingData data) {
    return _DecodeError();
  }

  @override
  final Function instantiate = _instantiate;

  static _DecodeError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_DecodeError>(map));
  }

  static _DecodeError fromJson(String json) {
    return _guard((c) => c.fromJson<_DecodeError>(json));
  }
}

extension _DecodeErrorMapperExtension on _DecodeError {
  String toJson() {
    return _DecodeErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _DecodeErrorMapper._guard((c) => c.toMap(this));
  }
}

class _SigninFailureMapper extends SubClassMapperBase<_SigninFailure> {
  _SigninFailureMapper._();
  static _SigninFailureMapper? _instance;
  static _SigninFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _SigninFailureMapper._());
      SigninFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_SigninFailure';

  @override
  final Map<Symbol, Field<_SigninFailure, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'SigninFailure';
  @override
  late final ClassMapperBase superMapper =
      SigninFailureMapper.ensureInitialized();

  static _SigninFailure _instantiate(DecodingData data) {
    return _SigninFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static _SigninFailure fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_SigninFailure>(map));
  }

  static _SigninFailure fromJson(String json) {
    return _guard((c) => c.fromJson<_SigninFailure>(json));
  }
}

extension _SigninFailureMapperExtension on _SigninFailure {
  String toJson() {
    return _SigninFailureMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _SigninFailureMapper._guard((c) => c.toMap(this));
  }
}

class _DatabaseErrorMapper extends SubClassMapperBase<_DatabaseError> {
  _DatabaseErrorMapper._();
  static _DatabaseErrorMapper? _instance;
  static _DatabaseErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _DatabaseErrorMapper._());
      SigninFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_DatabaseError';

  @override
  final Map<Symbol, Field<_DatabaseError, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'DatabaseError';
  @override
  late final ClassMapperBase superMapper =
      SigninFailureMapper.ensureInitialized();

  static _DatabaseError _instantiate(DecodingData data) {
    return _DatabaseError();
  }

  @override
  final Function instantiate = _instantiate;

  static _DatabaseError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_DatabaseError>(map));
  }

  static _DatabaseError fromJson(String json) {
    return _guard((c) => c.fromJson<_DatabaseError>(json));
  }
}

extension _DatabaseErrorMapperExtension on _DatabaseError {
  String toJson() {
    return _DatabaseErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _DatabaseErrorMapper._guard((c) => c.toMap(this));
  }
}

class SigninResultMapper extends ClassMapperBase<SigninResult> {
  SigninResultMapper._();
  static SigninResultMapper? _instance;
  static SigninResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SigninResultMapper._());
      SigninResult_OkMapper.ensureInitialized();
      _ErrMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SigninResult';

  @override
  final Map<Symbol, Field<SigninResult, dynamic>> fields = const {};

  static SigninResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SigninResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SigninResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SigninResult>(map));
  }

  static SigninResult fromJson(String json) {
    return _guard((c) => c.fromJson<SigninResult>(json));
  }
}

extension SigninResultMapperExtension on SigninResult {
  String toJson() {
    return SigninResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SigninResultMapper._guard((c) => c.toMap(this));
  }
}

typedef SigninResultCopyWithBound = SigninResult;

abstract class SigninResultCopyWith<$R, $In extends SigninResult,
    $Out extends SigninResult> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SigninResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends SigninResult>(
      Then<SigninResult, $Out2> t, Then<$Out2, $R2> t2);
}

class SigninResult_OkMapper extends SubClassMapperBase<SigninResult_Ok> {
  SigninResult_OkMapper._();
  static SigninResult_OkMapper? _instance;
  static SigninResult_OkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SigninResult_OkMapper._());
      SigninResultMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SigninResult_Ok';

  static String _$nextPath(SigninResult_Ok v) => v.nextPath;

  @override
  final Map<Symbol, Field<SigninResult_Ok, dynamic>> fields = const {
    #nextPath: Field<SigninResult_Ok, String>('nextPath', _$nextPath),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      SigninResultMapper.ensureInitialized();

  static SigninResult_Ok _instantiate(DecodingData data) {
    return SigninResult_Ok(data.get(#nextPath));
  }

  @override
  final Function instantiate = _instantiate;

  static SigninResult_Ok fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SigninResult_Ok>(map));
  }

  static SigninResult_Ok fromJson(String json) {
    return _guard((c) => c.fromJson<SigninResult_Ok>(json));
  }
}

extension SigninResult_OkMapperExtension on SigninResult_Ok {
  String toJson() {
    return SigninResult_OkMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SigninResult_OkMapper._guard((c) => c.toMap(this));
  }
}

class _ErrMapper extends SubClassMapperBase<_Err> {
  _ErrMapper._();
  static _ErrMapper? _instance;
  static _ErrMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _ErrMapper._());
      SigninResultMapper.ensureInitialized().addSubMapper(_instance!);
      SigninFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Err';

  static SigninFailure _$signinFailure(_Err v) => v.signinFailure;

  @override
  final Map<Symbol, Field<_Err, dynamic>> fields = const {
    #signinFailure:
        Field<_Err, SigninFailure>('signinFailure', _$signinFailure),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      SigninResultMapper.ensureInitialized();

  static _Err _instantiate(DecodingData data) {
    return _Err(data.get(#signinFailure));
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

class SigninRequestMapper extends ClassMapperBase<SigninRequest> {
  SigninRequestMapper._();
  static SigninRequestMapper? _instance;
  static SigninRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SigninRequestMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SigninRequest';

  static String _$email(SigninRequest v) => v.email;
  static String _$encodedPassword(SigninRequest v) => v.encodedPassword;
  static bool _$rememberLogin(SigninRequest v) => v.rememberLogin;

  @override
  final Map<Symbol, Field<SigninRequest, dynamic>> fields = const {
    #email: Field<SigninRequest, String>('email', _$email),
    #encodedPassword:
        Field<SigninRequest, String>('encodedPassword', _$encodedPassword),
    #rememberLogin:
        Field<SigninRequest, bool>('rememberLogin', _$rememberLogin),
  };

  static SigninRequest _instantiate(DecodingData data) {
    return SigninRequest(
        data.get(#email), data.get(#encodedPassword), data.get(#rememberLogin));
  }

  @override
  final Function instantiate = _instantiate;

  static SigninRequest fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SigninRequest>(map));
  }

  static SigninRequest fromJson(String json) {
    return _guard((c) => c.fromJson<SigninRequest>(json));
  }
}

mixin SigninRequestMappable {
  String toJson() {
    return SigninRequestMapper._guard((c) => c.toJson(this as SigninRequest));
  }

  Map<String, dynamic> toMap() {
    return SigninRequestMapper._guard((c) => c.toMap(this as SigninRequest));
  }

  SigninRequestCopyWith<SigninRequest, SigninRequest, SigninRequest>
      get copyWith => _SigninRequestCopyWithImpl(
          this as SigninRequest, $identity, $identity);
  @override
  String toString() {
    return SigninRequestMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SigninRequestMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SigninRequestMapper._guard((c) => c.hash(this));
  }
}

extension SigninRequestValueCopy<$R, $Out extends SigninRequest>
    on ObjectCopyWith<$R, SigninRequest, $Out> {
  SigninRequestCopyWith<$R, SigninRequest, $Out> get $asSigninRequest =>
      $base.as((v, t, t2) => _SigninRequestCopyWithImpl(v, t, t2));
}

typedef SigninRequestCopyWithBound = SigninRequest;

abstract class SigninRequestCopyWith<$R, $In extends SigninRequest,
    $Out extends SigninRequest> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email, String? encodedPassword, bool? rememberLogin});
  SigninRequestCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends SigninRequest>(
          Then<SigninRequest, $Out2> t, Then<$Out2, $R2> t2);
}

class _SigninRequestCopyWithImpl<$R, $Out extends SigninRequest>
    extends ClassCopyWithBase<$R, SigninRequest, $Out>
    implements SigninRequestCopyWith<$R, SigninRequest, $Out> {
  _SigninRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SigninRequest> $mapper =
      SigninRequestMapper.ensureInitialized();
  @override
  $R call({String? email, String? encodedPassword, bool? rememberLogin}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (encodedPassword != null) #encodedPassword: encodedPassword,
        if (rememberLogin != null) #rememberLogin: rememberLogin
      }));
  @override
  SigninRequest $make(CopyWithData data) => SigninRequest(
      data.get(#email, or: $value.email),
      data.get(#encodedPassword, or: $value.encodedPassword),
      data.get(#rememberLogin, or: $value.rememberLogin));

  @override
  SigninRequestCopyWith<$R2, SigninRequest, $Out2>
      $chain<$R2, $Out2 extends SigninRequest>(
              Then<SigninRequest, $Out2> t, Then<$Out2, $R2> t2) =>
          _SigninRequestCopyWithImpl($value, t, t2);
}
