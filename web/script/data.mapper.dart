// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'data.dart';

class SessionErrorMapper extends ClassMapperBase<SessionError> {
  SessionErrorMapper._();
  static SessionErrorMapper? _instance;
  static SessionErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionErrorMapper._());
      _NoCookieMapper.ensureInitialized();
      _InvalidCookieMapper.ensureInitialized();
      _ExpiredMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SessionError';

  @override
  final Map<Symbol, Field<SessionError, dynamic>> fields = const {};

  static SessionError _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SessionError', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SessionError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SessionError>(map));
  }

  static SessionError fromJson(String json) {
    return _guard((c) => c.fromJson<SessionError>(json));
  }
}

extension SessionErrorMapperExtension on SessionError {
  String toJson() {
    return SessionErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return SessionErrorMapper._guard((c) => c.toMap(this));
  }
}

typedef SessionErrorCopyWithBound = SessionError;

abstract class SessionErrorCopyWith<$R, $In extends SessionError,
    $Out extends SessionError> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SessionErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends SessionError>(
      Then<SessionError, $Out2> t, Then<$Out2, $R2> t2);
}

class _NoCookieMapper extends SubClassMapperBase<_NoCookie> {
  _NoCookieMapper._();
  static _NoCookieMapper? _instance;
  static _NoCookieMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _NoCookieMapper._());
      SessionErrorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_NoCookie';

  @override
  final Map<Symbol, Field<_NoCookie, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'NoCookie';
  @override
  late final ClassMapperBase superMapper =
      SessionErrorMapper.ensureInitialized();

  static _NoCookie _instantiate(DecodingData data) {
    return _NoCookie();
  }

  @override
  final Function instantiate = _instantiate;

  static _NoCookie fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_NoCookie>(map));
  }

  static _NoCookie fromJson(String json) {
    return _guard((c) => c.fromJson<_NoCookie>(json));
  }
}

extension _NoCookieMapperExtension on _NoCookie {
  String toJson() {
    return _NoCookieMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _NoCookieMapper._guard((c) => c.toMap(this));
  }
}

class _InvalidCookieMapper extends SubClassMapperBase<_InvalidCookie> {
  _InvalidCookieMapper._();
  static _InvalidCookieMapper? _instance;
  static _InvalidCookieMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _InvalidCookieMapper._());
      SessionErrorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_InvalidCookie';

  @override
  final Map<Symbol, Field<_InvalidCookie, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'InvalidCookie';
  @override
  late final ClassMapperBase superMapper =
      SessionErrorMapper.ensureInitialized();

  static _InvalidCookie _instantiate(DecodingData data) {
    return _InvalidCookie();
  }

  @override
  final Function instantiate = _instantiate;

  static _InvalidCookie fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_InvalidCookie>(map));
  }

  static _InvalidCookie fromJson(String json) {
    return _guard((c) => c.fromJson<_InvalidCookie>(json));
  }
}

extension _InvalidCookieMapperExtension on _InvalidCookie {
  String toJson() {
    return _InvalidCookieMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _InvalidCookieMapper._guard((c) => c.toMap(this));
  }
}

class _ExpiredMapper extends SubClassMapperBase<_Expired> {
  _ExpiredMapper._();
  static _ExpiredMapper? _instance;
  static _ExpiredMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _ExpiredMapper._());
      SessionErrorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Expired';

  @override
  final Map<Symbol, Field<_Expired, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Expired';
  @override
  late final ClassMapperBase superMapper =
      SessionErrorMapper.ensureInitialized();

  static _Expired _instantiate(DecodingData data) {
    return _Expired();
  }

  @override
  final Function instantiate = _instantiate;

  static _Expired fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_Expired>(map));
  }

  static _Expired fromJson(String json) {
    return _guard((c) => c.fromJson<_Expired>(json));
  }
}

extension _ExpiredMapperExtension on _Expired {
  String toJson() {
    return _ExpiredMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _ExpiredMapper._guard((c) => c.toMap(this));
  }
}

class DataErrorMapper extends ClassMapperBase<DataError> {
  DataErrorMapper._();
  static DataErrorMapper? _instance;
  static DataErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataErrorMapper._());
      _DatabaseFailureMapper.ensureInitialized();
      _SessionErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DataError';

  @override
  final Map<Symbol, Field<DataError, dynamic>> fields = const {};

  static DataError _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'DataError', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static DataError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DataError>(map));
  }

  static DataError fromJson(String json) {
    return _guard((c) => c.fromJson<DataError>(json));
  }
}

extension DataErrorMapperExtension on DataError {
  String toJson() {
    return DataErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return DataErrorMapper._guard((c) => c.toMap(this));
  }
}

typedef DataErrorCopyWithBound = DataError;

abstract class DataErrorCopyWith<$R, $In extends DataError,
    $Out extends DataError> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  DataErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends DataError>(
      Then<DataError, $Out2> t, Then<$Out2, $R2> t2);
}

class _DatabaseFailureMapper extends SubClassMapperBase<_DatabaseFailure> {
  _DatabaseFailureMapper._();
  static _DatabaseFailureMapper? _instance;
  static _DatabaseFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _DatabaseFailureMapper._());
      DataErrorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_DatabaseFailure';

  @override
  final Map<Symbol, Field<_DatabaseFailure, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'DatabaseFailure';
  @override
  late final ClassMapperBase superMapper = DataErrorMapper.ensureInitialized();

  static _DatabaseFailure _instantiate(DecodingData data) {
    return _DatabaseFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static _DatabaseFailure fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_DatabaseFailure>(map));
  }

  static _DatabaseFailure fromJson(String json) {
    return _guard((c) => c.fromJson<_DatabaseFailure>(json));
  }
}

extension _DatabaseFailureMapperExtension on _DatabaseFailure {
  String toJson() {
    return _DatabaseFailureMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _DatabaseFailureMapper._guard((c) => c.toMap(this));
  }
}

class _SessionErrorMapper extends SubClassMapperBase<_SessionError> {
  _SessionErrorMapper._();
  static _SessionErrorMapper? _instance;
  static _SessionErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _SessionErrorMapper._());
      DataErrorMapper.ensureInitialized().addSubMapper(_instance!);
      SessionErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_SessionError';

  static SessionError _$sessionError(_SessionError v) => v.sessionError;

  @override
  final Map<Symbol, Field<_SessionError, dynamic>> fields = const {
    #sessionError:
        Field<_SessionError, SessionError>('sessionError', _$sessionError),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'SessionError';
  @override
  late final ClassMapperBase superMapper = DataErrorMapper.ensureInitialized();

  static _SessionError _instantiate(DecodingData data) {
    return _SessionError(data.get(#sessionError));
  }

  @override
  final Function instantiate = _instantiate;

  static _SessionError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_SessionError>(map));
  }

  static _SessionError fromJson(String json) {
    return _guard((c) => c.fromJson<_SessionError>(json));
  }
}

extension _SessionErrorMapperExtension on _SessionError {
  String toJson() {
    return _SessionErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _SessionErrorMapper._guard((c) => c.toMap(this));
  }
}

class StringOptionInternallyTaggedMapper
    extends ClassMapperBase<StringOptionInternallyTagged> {
  StringOptionInternallyTaggedMapper._();
  static StringOptionInternallyTaggedMapper? _instance;
  static StringOptionInternallyTaggedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StringOptionInternallyTaggedMapper._());
      _NoneMapper.ensureInitialized();
      _SomeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'StringOptionInternallyTagged';

  @override
  final Map<Symbol, Field<StringOptionInternallyTagged, dynamic>> fields =
      const {};

  static StringOptionInternallyTagged _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'StringOptionInternallyTagged', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static StringOptionInternallyTagged fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<StringOptionInternallyTagged>(map));
  }

  static StringOptionInternallyTagged fromJson(String json) {
    return _guard((c) => c.fromJson<StringOptionInternallyTagged>(json));
  }
}

extension StringOptionInternallyTaggedMapperExtension
    on StringOptionInternallyTagged {
  String toJson() {
    return StringOptionInternallyTaggedMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return StringOptionInternallyTaggedMapper._guard((c) => c.toMap(this));
  }
}

typedef StringOptionInternallyTaggedCopyWithBound
    = StringOptionInternallyTagged;

abstract class StringOptionInternallyTaggedCopyWith<
        $R,
        $In extends StringOptionInternallyTagged,
        $Out extends StringOptionInternallyTagged>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  StringOptionInternallyTaggedCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends StringOptionInternallyTagged>(
          Then<StringOptionInternallyTagged, $Out2> t, Then<$Out2, $R2> t2);
}

class _NoneMapper extends SubClassMapperBase<_None> {
  _NoneMapper._();
  static _NoneMapper? _instance;
  static _NoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _NoneMapper._());
      StringOptionInternallyTaggedMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_None';

  @override
  final Map<Symbol, Field<_None, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'None';
  @override
  late final ClassMapperBase superMapper =
      StringOptionInternallyTaggedMapper.ensureInitialized();

  static _None _instantiate(DecodingData data) {
    return _None();
  }

  @override
  final Function instantiate = _instantiate;

  static _None fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_None>(map));
  }

  static _None fromJson(String json) {
    return _guard((c) => c.fromJson<_None>(json));
  }
}

extension _NoneMapperExtension on _None {
  String toJson() {
    return _NoneMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _NoneMapper._guard((c) => c.toMap(this));
  }
}

class _SomeMapper extends SubClassMapperBase<_Some> {
  _SomeMapper._();
  static _SomeMapper? _instance;
  static _SomeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _SomeMapper._());
      StringOptionInternallyTaggedMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_Some';

  static String _$data(_Some v) => v.data;

  @override
  final Map<Symbol, Field<_Some, dynamic>> fields = const {
    #data: Field<_Some, String>('data', _$data),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Some';
  @override
  late final ClassMapperBase superMapper =
      StringOptionInternallyTaggedMapper.ensureInitialized();

  static _Some _instantiate(DecodingData data) {
    return _Some(data.get(#data));
  }

  @override
  final Function instantiate = _instantiate;

  static _Some fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_Some>(map));
  }

  static _Some fromJson(String json) {
    return _guard((c) => c.fromJson<_Some>(json));
  }
}

extension _SomeMapperExtension on _Some {
  String toJson() {
    return _SomeMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _SomeMapper._guard((c) => c.toMap(this));
  }
}
