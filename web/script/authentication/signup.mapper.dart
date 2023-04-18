// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'signup.dart';

class SignupFailureMapper extends ClassMapperBase<SignupFailure> {
  SignupFailureMapper._();
  static SignupFailureMapper? _instance;
  static SignupFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignupFailureMapper._());
      _InvalidPasswordMapper.ensureInitialized();
      _InvalidUsernameMapper.ensureInitialized();
      _InvalidEmailMapper.ensureInitialized();
      _DecodeErrorMapper.ensureInitialized();
      _EmailAlreadyUsedMapper.ensureInitialized();
      _UnknownErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SignupFailure';

  @override
  final Map<Symbol, Field<SignupFailure, dynamic>> fields = const {};

  static SignupFailure _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SignupFailure', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SignupFailure fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SignupFailure>(map));
  }

  static SignupFailure fromJson(String json) {
    return _guard((c) => c.fromJson<SignupFailure>(json));
  }
}

extension SignupFailureMapperExtension on SignupFailure {
  String toJson() {
    return SignupFailureMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SignupFailureMapper._guard((c) => c.toMap(this));
  }
}

typedef SignupFailureCopyWithBound = SignupFailure;

abstract class SignupFailureCopyWith<$R, $In extends SignupFailure,
    $Out extends SignupFailure> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SignupFailureCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends SignupFailure>(
          Then<SignupFailure, $Out2> t, Then<$Out2, $R2> t2);
}

class _InvalidPasswordMapper extends SubClassMapperBase<_InvalidPassword> {
  _InvalidPasswordMapper._();
  static _InvalidPasswordMapper? _instance;
  static _InvalidPasswordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InvalidPasswordMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
      PasswordInvalidationDescriptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InvalidPassword';

  static PasswordInvalidationDescription _$passwordInvalidationDescription(
          _InvalidPassword v) =>
      v.passwordInvalidationDescription;
  static const Field<_InvalidPassword, PasswordInvalidationDescription>
      _f$passwordInvalidationDescription = Field(
          'passwordInvalidationDescription', _$passwordInvalidationDescription);

  @override
  final Map<Symbol, Field<_InvalidPassword, dynamic>> fields = const {
    #passwordInvalidationDescription: _f$passwordInvalidationDescription,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'InvalidPassword';
  @override
  late final ClassMapperBase superMapper =
      SignupFailureMapper.ensureInitialized();

  static _InvalidPassword _instantiate(DecodingData data) {
    return _InvalidPassword(data.dec(_f$passwordInvalidationDescription));
  }

  @override
  final Function instantiate = _instantiate;

  static _InvalidPassword fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InvalidPassword>(map));
  }

  static _InvalidPassword fromJson(String json) {
    return _guard((c) => c.fromJson<_InvalidPassword>(json));
  }
}

extension _InvalidPasswordMapperExtension on _InvalidPassword {
  String toJson() {
    return _InvalidPasswordMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InvalidPasswordMapper._guard((c) => c.toMap(this));
  }
}

class _InvalidUsernameMapper extends SubClassMapperBase<_InvalidUsername> {
  _InvalidUsernameMapper._();
  static _InvalidUsernameMapper? _instance;
  static _InvalidUsernameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InvalidUsernameMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
      UsernameInvalidationDescriptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InvalidUsername';

  static UsernameInvalidationDescription _$usernameInvalidationDescription(
          _InvalidUsername v) =>
      v.usernameInvalidationDescription;
  static const Field<_InvalidUsername, UsernameInvalidationDescription>
      _f$usernameInvalidationDescription = Field(
          'usernameInvalidationDescription', _$usernameInvalidationDescription);

  @override
  final Map<Symbol, Field<_InvalidUsername, dynamic>> fields = const {
    #usernameInvalidationDescription: _f$usernameInvalidationDescription,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'InvalidUsername';
  @override
  late final ClassMapperBase superMapper =
      SignupFailureMapper.ensureInitialized();

  static _InvalidUsername _instantiate(DecodingData data) {
    return _InvalidUsername(data.dec(_f$usernameInvalidationDescription));
  }

  @override
  final Function instantiate = _instantiate;

  static _InvalidUsername fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InvalidUsername>(map));
  }

  static _InvalidUsername fromJson(String json) {
    return _guard((c) => c.fromJson<_InvalidUsername>(json));
  }
}

extension _InvalidUsernameMapperExtension on _InvalidUsername {
  String toJson() {
    return _InvalidUsernameMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InvalidUsernameMapper._guard((c) => c.toMap(this));
  }
}

class _InvalidEmailMapper extends SubClassMapperBase<_InvalidEmail> {
  _InvalidEmailMapper._();
  static _InvalidEmailMapper? _instance;
  static _InvalidEmailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InvalidEmailMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InvalidEmail';

  @override
  final Map<Symbol, Field<_InvalidEmail, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'InvalidEmail';
  @override
  late final ClassMapperBase superMapper =
      SignupFailureMapper.ensureInitialized();

  static _InvalidEmail _instantiate(DecodingData data) {
    return _InvalidEmail();
  }

  @override
  final Function instantiate = _instantiate;

  static _InvalidEmail fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InvalidEmail>(map));
  }

  static _InvalidEmail fromJson(String json) {
    return _guard((c) => c.fromJson<_InvalidEmail>(json));
  }
}

extension _InvalidEmailMapperExtension on _InvalidEmail {
  String toJson() {
    return _InvalidEmailMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InvalidEmailMapper._guard((c) => c.toMap(this));
  }
}

class _DecodeErrorMapper extends SubClassMapperBase<_DecodeError> {
  _DecodeErrorMapper._();
  static _DecodeErrorMapper? _instance;
  static _DecodeErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _DecodeErrorMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
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
      SignupFailureMapper.ensureInitialized();

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

class _EmailAlreadyUsedMapper extends SubClassMapperBase<_EmailAlreadyUsed> {
  _EmailAlreadyUsedMapper._();
  static _EmailAlreadyUsedMapper? _instance;
  static _EmailAlreadyUsedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _EmailAlreadyUsedMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_EmailAlreadyUsed';

  @override
  final Map<Symbol, Field<_EmailAlreadyUsed, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'EmailAlreadyUsed';
  @override
  late final ClassMapperBase superMapper =
      SignupFailureMapper.ensureInitialized();

  static _EmailAlreadyUsed _instantiate(DecodingData data) {
    return _EmailAlreadyUsed();
  }

  @override
  final Function instantiate = _instantiate;

  static _EmailAlreadyUsed fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_EmailAlreadyUsed>(map));
  }

  static _EmailAlreadyUsed fromJson(String json) {
    return _guard((c) => c.fromJson<_EmailAlreadyUsed>(json));
  }
}

extension _EmailAlreadyUsedMapperExtension on _EmailAlreadyUsed {
  String toJson() {
    return _EmailAlreadyUsedMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _EmailAlreadyUsedMapper._guard((c) => c.toMap(this));
  }
}

class _UnknownErrorMapper extends SubClassMapperBase<_UnknownError> {
  _UnknownErrorMapper._();
  static _UnknownErrorMapper? _instance;
  static _UnknownErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _UnknownErrorMapper._());
      SignupFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_UnknownError';

  @override
  final Map<Symbol, Field<_UnknownError, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'UnknownError';
  @override
  late final ClassMapperBase superMapper =
      SignupFailureMapper.ensureInitialized();

  static _UnknownError _instantiate(DecodingData data) {
    return _UnknownError();
  }

  @override
  final Function instantiate = _instantiate;

  static _UnknownError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_UnknownError>(map));
  }

  static _UnknownError fromJson(String json) {
    return _guard((c) => c.fromJson<_UnknownError>(json));
  }
}

extension _UnknownErrorMapperExtension on _UnknownError {
  String toJson() {
    return _UnknownErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _UnknownErrorMapper._guard((c) => c.toMap(this));
  }
}

class SignupResultMapper extends ClassMapperBase<SignupResult> {
  SignupResultMapper._();
  static SignupResultMapper? _instance;
  static SignupResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignupResultMapper._());
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
  final String id = 'SignupResult';

  @override
  final Map<Symbol, Field<SignupResult, dynamic>> fields = const {};

  static SignupResult _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SignupResult', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SignupResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SignupResult>(map));
  }

  static SignupResult fromJson(String json) {
    return _guard((c) => c.fromJson<SignupResult>(json));
  }
}

extension SignupResultMapperExtension on SignupResult {
  String toJson() {
    return SignupResultMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SignupResultMapper._guard((c) => c.toMap(this));
  }
}

typedef SignupResultCopyWithBound = SignupResult;

abstract class SignupResultCopyWith<$R, $In extends SignupResult,
    $Out extends SignupResult> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SignupResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends SignupResult>(
      Then<SignupResult, $Out2> t, Then<$Out2, $R2> t2);
}

class _OkMapper extends SubClassMapperBase<_Ok> {
  _OkMapper._();
  static _OkMapper? _instance;
  static _OkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _OkMapper._());
      SignupResultMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Ok';

  static String _$nextPath(_Ok v) => v.nextPath;
  static const Field<_Ok, String> _f$nextPath = Field('nextPath', _$nextPath);

  @override
  final Map<Symbol, Field<_Ok, dynamic>> fields = const {
    #nextPath: _f$nextPath,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Ok';
  @override
  late final ClassMapperBase superMapper =
      SignupResultMapper.ensureInitialized();

  static _Ok _instantiate(DecodingData data) {
    return _Ok(data.dec(_f$nextPath));
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
      SignupResultMapper.ensureInitialized().addSubMapper(_instance!);
      SignupFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Err';

  static List<SignupFailure> _$signupFailure(_Err v) => v.signupFailure;
  static const Field<_Err, List<SignupFailure>> _f$signupFailure =
      Field('signupFailure', _$signupFailure);

  @override
  final Map<Symbol, Field<_Err, dynamic>> fields = const {
    #signupFailure: _f$signupFailure,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Err';
  @override
  late final ClassMapperBase superMapper =
      SignupResultMapper.ensureInitialized();

  static _Err _instantiate(DecodingData data) {
    return _Err(data.dec(_f$signupFailure));
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

class SignupRequestMapper extends ClassMapperBase<SignupRequest> {
  SignupRequestMapper._();
  static SignupRequestMapper? _instance;
  static SignupRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignupRequestMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SignupRequest';

  static String _$email(SignupRequest v) => v.email;
  static const Field<SignupRequest, String> _f$email = Field('email', _$email);
  static String _$preferredName(SignupRequest v) => v.preferredName;
  static const Field<SignupRequest, String> _f$preferredName =
      Field('preferredName', _$preferredName);
  static String _$legalName(SignupRequest v) => v.legalName;
  static const Field<SignupRequest, String> _f$legalName =
      Field('legalName', _$legalName);
  static String _$encodedPassword(SignupRequest v) => v.encodedPassword;
  static const Field<SignupRequest, String> _f$encodedPassword =
      Field('encodedPassword', _$encodedPassword);
  static bool _$rememberLogin(SignupRequest v) => v.rememberLogin;
  static const Field<SignupRequest, bool> _f$rememberLogin =
      Field('rememberLogin', _$rememberLogin);

  @override
  final Map<Symbol, Field<SignupRequest, dynamic>> fields = const {
    #email: _f$email,
    #preferredName: _f$preferredName,
    #legalName: _f$legalName,
    #encodedPassword: _f$encodedPassword,
    #rememberLogin: _f$rememberLogin,
  };

  static SignupRequest _instantiate(DecodingData data) {
    return SignupRequest(
        data.dec(_f$email),
        data.dec(_f$preferredName),
        data.dec(_f$legalName),
        data.dec(_f$encodedPassword),
        data.dec(_f$rememberLogin));
  }

  @override
  final Function instantiate = _instantiate;

  static SignupRequest fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SignupRequest>(map));
  }

  static SignupRequest fromJson(String json) {
    return _guard((c) => c.fromJson<SignupRequest>(json));
  }
}

mixin SignupRequestMappable {
  String toJson() {
    return SignupRequestMapper._guard((c) => c.toJson(this as SignupRequest));
  }

  Map<String, dynamic> toMap() {
    return SignupRequestMapper._guard((c) => c.toMap(this as SignupRequest));
  }

  SignupRequestCopyWith<SignupRequest, SignupRequest, SignupRequest>
      get copyWith => _SignupRequestCopyWithImpl(
          this as SignupRequest, $identity, $identity);
  @override
  String toString() {
    return SignupRequestMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SignupRequestMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SignupRequestMapper._guard((c) => c.hash(this));
  }
}

extension SignupRequestValueCopy<$R, $Out extends SignupRequest>
    on ObjectCopyWith<$R, SignupRequest, $Out> {
  SignupRequestCopyWith<$R, SignupRequest, $Out> get $asSignupRequest =>
      $base.as((v, t, t2) => _SignupRequestCopyWithImpl(v, t, t2));
}

typedef SignupRequestCopyWithBound = SignupRequest;

abstract class SignupRequestCopyWith<$R, $In extends SignupRequest,
    $Out extends SignupRequest> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? email,
      String? preferredName,
      String? legalName,
      String? encodedPassword,
      bool? rememberLogin});
  SignupRequestCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends SignupRequest>(
          Then<SignupRequest, $Out2> t, Then<$Out2, $R2> t2);
}

class _SignupRequestCopyWithImpl<$R, $Out extends SignupRequest>
    extends ClassCopyWithBase<$R, SignupRequest, $Out>
    implements SignupRequestCopyWith<$R, SignupRequest, $Out> {
  _SignupRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignupRequest> $mapper =
      SignupRequestMapper.ensureInitialized();
  @override
  $R call(
          {String? email,
          String? preferredName,
          String? legalName,
          String? encodedPassword,
          bool? rememberLogin}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (preferredName != null) #preferredName: preferredName,
        if (legalName != null) #legalName: legalName,
        if (encodedPassword != null) #encodedPassword: encodedPassword,
        if (rememberLogin != null) #rememberLogin: rememberLogin
      }));
  @override
  SignupRequest $make(CopyWithData data) => SignupRequest(
      data.get(#email, or: $value.email),
      data.get(#preferredName, or: $value.preferredName),
      data.get(#legalName, or: $value.legalName),
      data.get(#encodedPassword, or: $value.encodedPassword),
      data.get(#rememberLogin, or: $value.rememberLogin));

  @override
  SignupRequestCopyWith<$R2, SignupRequest, $Out2>
      $chain<$R2, $Out2 extends SignupRequest>(
              Then<SignupRequest, $Out2> t, Then<$Out2, $R2> t2) =>
          _SignupRequestCopyWithImpl($value, t, t2);
}
