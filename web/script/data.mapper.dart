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
  static const Field<_SessionError, SessionError> _f$sessionError =
      Field('sessionError', _$sessionError);

  @override
  final Map<Symbol, Field<_SessionError, dynamic>> fields = const {
    #sessionError: _f$sessionError,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'SessionError';
  @override
  late final ClassMapperBase superMapper = DataErrorMapper.ensureInitialized();

  static _SessionError _instantiate(DecodingData data) {
    return _SessionError(data.dec(_f$sessionError));
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
    return StringOptionInternallyTagged.none();
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

mixin StringOptionInternallyTaggedMappable {
  String toJson() {
    return StringOptionInternallyTaggedMapper._guard(
        (c) => c.toJson(this as StringOptionInternallyTagged));
  }

  Map<String, dynamic> toMap() {
    return StringOptionInternallyTaggedMapper._guard(
        (c) => c.toMap(this as StringOptionInternallyTagged));
  }

  StringOptionInternallyTaggedCopyWith<StringOptionInternallyTagged,
          StringOptionInternallyTagged, StringOptionInternallyTagged>
      get copyWith => _StringOptionInternallyTaggedCopyWithImpl(
          this as StringOptionInternallyTagged, $identity, $identity);
  @override
  String toString() {
    return StringOptionInternallyTaggedMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StringOptionInternallyTaggedMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return StringOptionInternallyTaggedMapper._guard((c) => c.hash(this));
  }
}

extension StringOptionInternallyTaggedValueCopy<$R,
        $Out extends StringOptionInternallyTagged>
    on ObjectCopyWith<$R, StringOptionInternallyTagged, $Out> {
  StringOptionInternallyTaggedCopyWith<$R, StringOptionInternallyTagged, $Out>
      get $asStringOptionInternallyTagged => $base.as(
          (v, t, t2) => _StringOptionInternallyTaggedCopyWithImpl(v, t, t2));
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

class _StringOptionInternallyTaggedCopyWithImpl<$R,
        $Out extends StringOptionInternallyTagged>
    extends ClassCopyWithBase<$R, StringOptionInternallyTagged, $Out>
    implements
        StringOptionInternallyTaggedCopyWith<$R, StringOptionInternallyTagged,
            $Out> {
  _StringOptionInternallyTaggedCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StringOptionInternallyTagged> $mapper =
      StringOptionInternallyTaggedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  StringOptionInternallyTagged $make(CopyWithData data) =>
      StringOptionInternallyTagged.none();

  @override
  StringOptionInternallyTaggedCopyWith<$R2, StringOptionInternallyTagged, $Out2>
      $chain<$R2, $Out2 extends StringOptionInternallyTagged>(
              Then<StringOptionInternallyTagged, $Out2> t,
              Then<$Out2, $R2> t2) =>
          _StringOptionInternallyTaggedCopyWithImpl($value, t, t2);
}

class OptionInternallyTaggedMapper
    extends ClassMapperBase<OptionInternallyTagged> {
  OptionInternallyTaggedMapper._();
  static OptionInternallyTaggedMapper? _instance;
  static OptionInternallyTaggedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OptionInternallyTaggedMapper._());
      OptionInternallyTaggedTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'OptionInternallyTagged';
  @override
  Function get typeFactory => <T>(f) => f<OptionInternallyTagged<T>>();

  static dynamic _$_data(OptionInternallyTagged v) => v._data;
  static dynamic _arg$_data<T>(f) => f<T?>();
  static const Field<OptionInternallyTagged, dynamic> _f$_data =
      Field('_data', _$_data, key: 'data', arg: _arg$_data);
  static OptionInternallyTaggedType _$_updateType(OptionInternallyTagged v) =>
      v._updateType;
  static const Field<OptionInternallyTagged, OptionInternallyTaggedType>
      _f$_updateType = Field('_updateType', _$_updateType, key: 'type');

  @override
  final Map<Symbol, Field<OptionInternallyTagged, dynamic>> fields = const {
    #_data: _f$_data,
    #_updateType: _f$_updateType,
  };

  static OptionInternallyTagged<T> _instantiate<T>(DecodingData data) {
    return OptionInternallyTagged.map(
        data.dec(_f$_data), data.dec(_f$_updateType));
  }

  @override
  final Function instantiate = _instantiate;

  static OptionInternallyTagged<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<OptionInternallyTagged<T>>(map));
  }

  static OptionInternallyTagged<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<OptionInternallyTagged<T>>(json));
  }
}

mixin OptionInternallyTaggedMappable<T> {
  String toJson() {
    return OptionInternallyTaggedMapper._guard(
        (c) => c.toJson(this as OptionInternallyTagged<T>));
  }

  Map<String, dynamic> toMap() {
    return OptionInternallyTaggedMapper._guard(
        (c) => c.toMap(this as OptionInternallyTagged<T>));
  }
}

class UpdateTypeMapper extends ClassMapperBase<UpdateType> {
  UpdateTypeMapper._();
  static UpdateTypeMapper? _instance;
  static UpdateTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateTypeMapper._());
      UpdateTypeTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UpdateType';
  @override
  Function get typeFactory => <T>(f) => f<UpdateType<T>>();

  static UpdateTypeType _$updateType(UpdateType v) => v.updateType;
  static const Field<UpdateType, UpdateTypeType> _f$updateType =
      Field('updateType', _$updateType, key: 'type');
  static int? _$_id(UpdateType v) => v._id;
  static const Field<UpdateType, int?> _f$_id = Field('_id', _$_id, key: 'id');
  static dynamic _$_item(UpdateType v) => v._item;
  static dynamic _arg$_item<T>(f) => f<T?>();
  static const Field<UpdateType, dynamic> _f$_item =
      Field('_item', _$_item, key: 'item', arg: _arg$_item);

  @override
  final Map<Symbol, Field<UpdateType, dynamic>> fields = const {
    #updateType: _f$updateType,
    #_id: _f$_id,
    #_item: _f$_item,
  };
  @override
  final bool ignoreNull = true;

  static UpdateType<T> _instantiate<T>(DecodingData data) {
    return UpdateType.map(
        data.dec(_f$updateType), data.dec(_f$_id), data.dec(_f$_item));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin UpdateTypeMappable<T> {
  String toJson() {
    return UpdateTypeMapper._guard((c) => c.toJson(this as UpdateType<T>));
  }

  Map<String, dynamic> toMap() {
    return UpdateTypeMapper._guard((c) => c.toMap(this as UpdateType<T>));
  }
}

class ItemCountMapper extends ClassMapperBase<ItemCount> {
  ItemCountMapper._();
  static ItemCountMapper? _instance;
  static ItemCountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemCountMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ItemCount';
  @override
  Function get typeFactory => <T>(f) => f<ItemCount<T>>();

  static dynamic _$item(ItemCount v) => v.item;
  static dynamic _arg$item<T>(f) => f<T>();
  static const Field<ItemCount, dynamic> _f$item =
      Field('item', _$item, arg: _arg$item);
  static int _$count(ItemCount v) => v.count;
  static const Field<ItemCount, int> _f$count = Field('count', _$count);

  @override
  final Map<Symbol, Field<ItemCount, dynamic>> fields = const {
    #item: _f$item,
    #count: _f$count,
  };

  static ItemCount<T> _instantiate<T>(DecodingData data) {
    return ItemCount(data.dec(_f$item), data.dec(_f$count));
  }

  @override
  final Function instantiate = _instantiate;

  static ItemCount<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ItemCount<T>>(map));
  }

  static ItemCount<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<ItemCount<T>>(json));
  }
}

mixin ItemCountMappable<T> {
  String toJson() {
    return ItemCountMapper._guard((c) => c.toJson(this as ItemCount<T>));
  }

  Map<String, dynamic> toMap() {
    return ItemCountMapper._guard((c) => c.toMap(this as ItemCount<T>));
  }
}

class UpdateItemCountMapper extends ClassMapperBase<UpdateItemCount> {
  UpdateItemCountMapper._();
  static UpdateItemCountMapper? _instance;
  static UpdateItemCountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateItemCountMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UpdateItemCount';
  @override
  Function get typeFactory => <T>(f) => f<UpdateItemCount<T>>();

  static dynamic _$item(UpdateItemCount v) => v.item;
  static dynamic _arg$item<T>(f) => f<T>();
  static const Field<UpdateItemCount, dynamic> _f$item =
      Field('item', _$item, arg: _arg$item);
  static int _$count(UpdateItemCount v) => v.count;
  static const Field<UpdateItemCount, int> _f$count = Field('count', _$count);

  @override
  final Map<Symbol, Field<UpdateItemCount, dynamic>> fields = const {
    #item: _f$item,
    #count: _f$count,
  };

  static UpdateItemCount<T> _instantiate<T>(DecodingData data) {
    return UpdateItemCount(data.dec(_f$item), data.dec(_f$count));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateItemCount<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UpdateItemCount<T>>(map));
  }

  static UpdateItemCount<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<UpdateItemCount<T>>(json));
  }
}

mixin UpdateItemCountMappable<T> {
  String toJson() {
    return UpdateItemCountMapper._guard(
        (c) => c.toJson(this as UpdateItemCount<T>));
  }

  Map<String, dynamic> toMap() {
    return UpdateItemCountMapper._guard(
        (c) => c.toMap(this as UpdateItemCount<T>));
  }
}

class DataResultMapper extends ClassMapperBase<DataResult> {
  DataResultMapper._();
  static DataResultMapper? _instance;
  static DataResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataResultMapper._());
      DataErrorMapper.ensureInitialized();
      DataResultTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DataResult';
  @override
  Function get typeFactory => <T>(f) => f<DataResult<T>>();

  static DataError? _$err(DataResult v) => v.err;
  static const Field<DataResult, DataError?> _f$err = Field('err', _$err);
  static dynamic _$ok(DataResult v) => v.ok;
  static dynamic _arg$ok<T>(f) => f<T?>();
  static const Field<DataResult, dynamic> _f$ok =
      Field('ok', _$ok, arg: _arg$ok);
  static DataResultType _$_type(DataResult v) => v._type;
  static const Field<DataResult, DataResultType> _f$_type =
      Field('_type', _$_type, key: 'type');

  @override
  final Map<Symbol, Field<DataResult, dynamic>> fields = const {
    #err: _f$err,
    #ok: _f$ok,
    #_type: _f$_type,
  };
  @override
  final bool ignoreNull = true;

  static DataResult<T> _instantiate<T>(DecodingData data) {
    return DataResult.map(
        data.dec(_f$err), data.dec(_f$ok), data.dec(_f$_type));
  }

  @override
  final Function instantiate = _instantiate;

  static DataResult<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DataResult<T>>(map));
  }

  static DataResult<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<DataResult<T>>(json));
  }
}

mixin DataResultMappable<T> {
  String toJson() {
    return DataResultMapper._guard((c) => c.toJson(this as DataResult<T>));
  }

  Map<String, dynamic> toMap() {
    return DataResultMapper._guard((c) => c.toMap(this as DataResult<T>));
  }
}

class DataMaybeIdMapper extends ClassMapperBase<DataMaybeId> {
  DataMaybeIdMapper._();
  static DataMaybeIdMapper? _instance;
  static DataMaybeIdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataMaybeIdMapper._());
      DataMaybeIdTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DataMaybeId';
  @override
  Function get typeFactory => <T>(f) => f<DataMaybeId<T>>();

  static dynamic _$data(DataMaybeId v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<DataMaybeId, dynamic> _f$data =
      Field('data', _$data, arg: _arg$data);
  static int? _$id(DataMaybeId v) => v.id;
  static const Field<DataMaybeId, int?> _f$id = Field('id', _$id);
  static DataMaybeIdType _$_type(DataMaybeId v) => v._type;
  static const Field<DataMaybeId, DataMaybeIdType> _f$_type =
      Field('_type', _$_type, key: 'type');

  @override
  final Map<Symbol, Field<DataMaybeId, dynamic>> fields = const {
    #data: _f$data,
    #id: _f$id,
    #_type: _f$_type,
  };
  @override
  final bool ignoreNull = true;

  static DataMaybeId<T> _instantiate<T>(DecodingData data) {
    return DataMaybeId.map(
        data.dec(_f$data), data.dec(_f$id), data.dec(_f$_type));
  }

  @override
  final Function instantiate = _instantiate;

  static DataMaybeId<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DataMaybeId<T>>(map));
  }

  static DataMaybeId<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<DataMaybeId<T>>(json));
  }
}

mixin DataMaybeIdMappable<T> {
  String toJson() {
    return DataMaybeIdMapper._guard((c) => c.toJson(this as DataMaybeId<T>));
  }

  Map<String, dynamic> toMap() {
    return DataMaybeIdMapper._guard((c) => c.toMap(this as DataMaybeId<T>));
  }
}

class DataWithIdMapper extends ClassMapperBase<DataWithId> {
  DataWithIdMapper._();
  static DataWithIdMapper? _instance;
  static DataWithIdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataWithIdMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DataWithId';
  @override
  Function get typeFactory => <T>(f) => f<DataWithId<T>>();

  static int _$id(DataWithId v) => v.id;
  static const Field<DataWithId, int> _f$id = Field('id', _$id);
  static dynamic _$data(DataWithId v) => v.data;
  static dynamic _arg$data<T>(f) => f<T>();
  static const Field<DataWithId, dynamic> _f$data =
      Field('data', _$data, arg: _arg$data);

  @override
  final Map<Symbol, Field<DataWithId, dynamic>> fields = const {
    #id: _f$id,
    #data: _f$data,
  };

  static DataWithId<T> _instantiate<T>(DecodingData data) {
    return DataWithId(data.dec(_f$id), data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static DataWithId<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DataWithId<T>>(map));
  }

  static DataWithId<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<DataWithId<T>>(json));
  }
}

mixin DataWithIdMappable<T> {
  String toJson() {
    return DataWithIdMapper._guard((c) => c.toJson(this as DataWithId<T>));
  }

  Map<String, dynamic> toMap() {
    return DataWithIdMapper._guard((c) => c.toMap(this as DataWithId<T>));
  }

  DataWithIdCopyWith<DataWithId<T>, DataWithId<T>, DataWithId<T>, T>
      get copyWith =>
          _DataWithIdCopyWithImpl(this as DataWithId<T>, $identity, $identity);
  @override
  String toString() {
    return DataWithIdMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DataWithIdMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DataWithIdMapper._guard((c) => c.hash(this));
  }
}

extension DataWithIdValueCopy<$R, $Out extends DataWithId, T>
    on ObjectCopyWith<$R, DataWithId<T>, $Out> {
  DataWithIdCopyWith<$R, DataWithId<T>, $Out, T> get $asDataWithId =>
      $base.as((v, t, t2) => _DataWithIdCopyWithImpl(v, t, t2));
}

typedef DataWithIdCopyWithBound = DataWithId;

abstract class DataWithIdCopyWith<$R, $In extends DataWithId<T>,
    $Out extends DataWithId, T> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, T? data});
  DataWithIdCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2 extends DataWithId>(
      Then<DataWithId<T>, $Out2> t, Then<$Out2, $R2> t2);
}

class _DataWithIdCopyWithImpl<$R, $Out extends DataWithId, T>
    extends ClassCopyWithBase<$R, DataWithId<T>, $Out>
    implements DataWithIdCopyWith<$R, DataWithId<T>, $Out, T> {
  _DataWithIdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DataWithId> $mapper =
      DataWithIdMapper.ensureInitialized();
  @override
  $R call({int? id, T? data}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (data != null) #data: data}));
  @override
  DataWithId<T> $make(CopyWithData data) => DataWithId(
      data.get(#id, or: $value.id), data.get(#data, or: $value.data));

  @override
  DataWithIdCopyWith<$R2, DataWithId<T>, $Out2, T>
      $chain<$R2, $Out2 extends DataWithId>(
              Then<DataWithId<T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _DataWithIdCopyWithImpl($value, t, t2);
}

class OptionInternallyTaggedTypeMapper
    extends EnumMapper<OptionInternallyTaggedType> {
  OptionInternallyTaggedTypeMapper._();
  static OptionInternallyTaggedTypeMapper? _instance;
  static OptionInternallyTaggedTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OptionInternallyTaggedTypeMapper._());
    }
    return _instance!;
  }

  static OptionInternallyTaggedType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OptionInternallyTaggedType decode(dynamic value) {
    switch (value) {
      case 'some':
        return OptionInternallyTaggedType.some;
      case 'none':
        return OptionInternallyTaggedType.none;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OptionInternallyTaggedType self) {
    switch (self) {
      case OptionInternallyTaggedType.some:
        return 'some';
      case OptionInternallyTaggedType.none:
        return 'none';
    }
  }
}

extension OptionInternallyTaggedTypeMapperExtension
    on OptionInternallyTaggedType {
  String toValue() {
    OptionInternallyTaggedTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class UpdateTypeTypeMapper extends EnumMapper<UpdateTypeType> {
  UpdateTypeTypeMapper._();
  static UpdateTypeTypeMapper? _instance;
  static UpdateTypeTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateTypeTypeMapper._());
    }
    return _instance!;
  }

  static UpdateTypeType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  UpdateTypeType decode(dynamic value) {
    switch (value) {
      case 'put':
        return UpdateTypeType.put;
      case 'delete':
        return UpdateTypeType.delete;
      case 'ignore':
        return UpdateTypeType.ignore;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(UpdateTypeType self) {
    switch (self) {
      case UpdateTypeType.put:
        return 'put';
      case UpdateTypeType.delete:
        return 'delete';
      case UpdateTypeType.ignore:
        return 'ignore';
    }
  }
}

extension UpdateTypeTypeMapperExtension on UpdateTypeType {
  String toValue() {
    UpdateTypeTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class DataResultTypeMapper extends EnumMapper<DataResultType> {
  DataResultTypeMapper._();
  static DataResultTypeMapper? _instance;
  static DataResultTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataResultTypeMapper._());
    }
    return _instance!;
  }

  static DataResultType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DataResultType decode(dynamic value) {
    switch (value) {
      case 'ok':
        return DataResultType.ok;
      case 'err':
        return DataResultType.err;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DataResultType self) {
    switch (self) {
      case DataResultType.ok:
        return 'ok';
      case DataResultType.err:
        return 'err';
    }
  }
}

extension DataResultTypeMapperExtension on DataResultType {
  String toValue() {
    DataResultTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class DataMaybeIdTypeMapper extends EnumMapper<DataMaybeIdType> {
  DataMaybeIdTypeMapper._();
  static DataMaybeIdTypeMapper? _instance;
  static DataMaybeIdTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataMaybeIdTypeMapper._());
    }
    return _instance!;
  }

  static DataMaybeIdType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DataMaybeIdType decode(dynamic value) {
    switch (value) {
      case 'id':
        return DataMaybeIdType.id;
      case 'noId':
        return DataMaybeIdType.noId;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DataMaybeIdType self) {
    switch (self) {
      case DataMaybeIdType.id:
        return 'id';
      case DataMaybeIdType.noId:
        return 'noId';
    }
  }
}

extension DataMaybeIdTypeMapperExtension on DataMaybeIdType {
  String toValue() {
    DataMaybeIdTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
