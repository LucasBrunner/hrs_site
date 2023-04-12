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
      _ConnectionErrorMapper.ensureInitialized();
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

class _ConnectionErrorMapper extends SubClassMapperBase<_ConnectionError> {
  _ConnectionErrorMapper._();
  static _ConnectionErrorMapper? _instance;
  static _ConnectionErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _ConnectionErrorMapper._());
      DataErrorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_ConnectionError';

  @override
  final Map<Symbol, Field<_ConnectionError, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'ConnectionError';
  @override
  late final ClassMapperBase superMapper = DataErrorMapper.ensureInitialized();

  static _ConnectionError _instantiate(DecodingData data) {
    return _ConnectionError();
  }

  @override
  final Function instantiate = _instantiate;

  static _ConnectionError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_ConnectionError>(map));
  }

  static _ConnectionError fromJson(String json) {
    return _guard((c) => c.fromJson<_ConnectionError>(json));
  }
}

extension _ConnectionErrorMapperExtension on _ConnectionError {
  String toJson() {
    return _ConnectionErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _ConnectionErrorMapper._guard((c) => c.toMap(this));
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
      _StringNoneMapper.ensureInitialized();
      _StringSomeMapper.ensureInitialized();
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

class _StringNoneMapper extends SubClassMapperBase<_StringNone> {
  _StringNoneMapper._();
  static _StringNoneMapper? _instance;
  static _StringNoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _StringNoneMapper._());
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
  final String id = '_StringNone';

  @override
  final Map<Symbol, Field<_StringNone, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'None';
  @override
  late final ClassMapperBase superMapper =
      StringOptionInternallyTaggedMapper.ensureInitialized();

  static _StringNone _instantiate(DecodingData data) {
    return _StringNone();
  }

  @override
  final Function instantiate = _instantiate;

  static _StringNone fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_StringNone>(map));
  }

  static _StringNone fromJson(String json) {
    return _guard((c) => c.fromJson<_StringNone>(json));
  }
}

extension _StringNoneMapperExtension on _StringNone {
  String toJson() {
    return _StringNoneMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _StringNoneMapper._guard((c) => c.toMap(this));
  }
}

class _StringSomeMapper extends SubClassMapperBase<_StringSome> {
  _StringSomeMapper._();
  static _StringSomeMapper? _instance;
  static _StringSomeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _StringSomeMapper._());
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
  final String id = '_StringSome';

  static String _$data(_StringSome v) => v.data;

  @override
  final Map<Symbol, Field<_StringSome, dynamic>> fields = const {
    #data: Field<_StringSome, String>('data', _$data),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Some';
  @override
  late final ClassMapperBase superMapper =
      StringOptionInternallyTaggedMapper.ensureInitialized();

  static _StringSome _instantiate(DecodingData data) {
    return _StringSome(data.get(#data));
  }

  @override
  final Function instantiate = _instantiate;

  static _StringSome fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_StringSome>(map));
  }

  static _StringSome fromJson(String json) {
    return _guard((c) => c.fromJson<_StringSome>(json));
  }
}

extension _StringSomeMapperExtension on _StringSome {
  String toJson() {
    return _StringSomeMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _StringSomeMapper._guard((c) => c.toMap(this));
  }
}

class IntOptionInternallyTaggedMapper
    extends ClassMapperBase<IntOptionInternallyTagged> {
  IntOptionInternallyTaggedMapper._();
  static IntOptionInternallyTaggedMapper? _instance;
  static IntOptionInternallyTaggedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = IntOptionInternallyTaggedMapper._());
      _IntNoneMapper.ensureInitialized();
      _IntSomeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'IntOptionInternallyTagged';

  @override
  final Map<Symbol, Field<IntOptionInternallyTagged, dynamic>> fields =
      const {};

  static IntOptionInternallyTagged _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'IntOptionInternallyTagged', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static IntOptionInternallyTagged fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<IntOptionInternallyTagged>(map));
  }

  static IntOptionInternallyTagged fromJson(String json) {
    return _guard((c) => c.fromJson<IntOptionInternallyTagged>(json));
  }
}

extension IntOptionInternallyTaggedMapperExtension
    on IntOptionInternallyTagged {
  String toJson() {
    return IntOptionInternallyTaggedMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return IntOptionInternallyTaggedMapper._guard((c) => c.toMap(this));
  }
}

typedef IntOptionInternallyTaggedCopyWithBound = IntOptionInternallyTagged;

abstract class IntOptionInternallyTaggedCopyWith<
        $R,
        $In extends IntOptionInternallyTagged,
        $Out extends IntOptionInternallyTagged>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  IntOptionInternallyTaggedCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends IntOptionInternallyTagged>(
          Then<IntOptionInternallyTagged, $Out2> t, Then<$Out2, $R2> t2);
}

class _IntNoneMapper extends SubClassMapperBase<_IntNone> {
  _IntNoneMapper._();
  static _IntNoneMapper? _instance;
  static _IntNoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _IntNoneMapper._());
      IntOptionInternallyTaggedMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_IntNone';

  @override
  final Map<Symbol, Field<_IntNone, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'None';
  @override
  late final ClassMapperBase superMapper =
      IntOptionInternallyTaggedMapper.ensureInitialized();

  static _IntNone _instantiate(DecodingData data) {
    return _IntNone();
  }

  @override
  final Function instantiate = _instantiate;

  static _IntNone fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_IntNone>(map));
  }

  static _IntNone fromJson(String json) {
    return _guard((c) => c.fromJson<_IntNone>(json));
  }
}

extension _IntNoneMapperExtension on _IntNone {
  String toJson() {
    return _IntNoneMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _IntNoneMapper._guard((c) => c.toMap(this));
  }
}

class _IntSomeMapper extends SubClassMapperBase<_IntSome> {
  _IntSomeMapper._();
  static _IntSomeMapper? _instance;
  static _IntSomeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _IntSomeMapper._());
      IntOptionInternallyTaggedMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_IntSome';

  static int _$data(_IntSome v) => v.data;

  @override
  final Map<Symbol, Field<_IntSome, dynamic>> fields = const {
    #data: Field<_IntSome, int>('data', _$data),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'Some';
  @override
  late final ClassMapperBase superMapper =
      IntOptionInternallyTaggedMapper.ensureInitialized();

  static _IntSome _instantiate(DecodingData data) {
    return _IntSome(data.get(#data));
  }

  @override
  final Function instantiate = _instantiate;

  static _IntSome fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_IntSome>(map));
  }

  static _IntSome fromJson(String json) {
    return _guard((c) => c.fromJson<_IntSome>(json));
  }
}

extension _IntSomeMapperExtension on _IntSome {
  String toJson() {
    return _IntSomeMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _IntSomeMapper._guard((c) => c.toMap(this));
  }
}
