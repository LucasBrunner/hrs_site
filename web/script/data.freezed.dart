// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCookie,
    required TResult Function() invalidCookie,
    required TResult Function() expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noCookie,
    TResult? Function()? invalidCookie,
    TResult? Function()? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCookie,
    TResult Function()? invalidCookie,
    TResult Function()? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCookie value) noCookie,
    required TResult Function(_InvalidCookie value) invalidCookie,
    required TResult Function(_Expired value) expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoCookie value)? noCookie,
    TResult? Function(_InvalidCookie value)? invalidCookie,
    TResult? Function(_Expired value)? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCookie value)? noCookie,
    TResult Function(_InvalidCookie value)? invalidCookie,
    TResult Function(_Expired value)? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionErrorCopyWith<$Res> {
  factory $SessionErrorCopyWith(
          SessionError value, $Res Function(SessionError) then) =
      _$SessionErrorCopyWithImpl<$Res, SessionError>;
}

/// @nodoc
class _$SessionErrorCopyWithImpl<$Res, $Val extends SessionError>
    implements $SessionErrorCopyWith<$Res> {
  _$SessionErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NoCookieCopyWith<$Res> {
  factory _$$_NoCookieCopyWith(
          _$_NoCookie value, $Res Function(_$_NoCookie) then) =
      __$$_NoCookieCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoCookieCopyWithImpl<$Res>
    extends _$SessionErrorCopyWithImpl<$Res, _$_NoCookie>
    implements _$$_NoCookieCopyWith<$Res> {
  __$$_NoCookieCopyWithImpl(
      _$_NoCookie _value, $Res Function(_$_NoCookie) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'NoCookie')
class _$_NoCookie implements _NoCookie {
  const _$_NoCookie();

  @override
  String toString() {
    return 'SessionError.noCookie()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoCookie);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCookie,
    required TResult Function() invalidCookie,
    required TResult Function() expired,
  }) {
    return noCookie();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noCookie,
    TResult? Function()? invalidCookie,
    TResult? Function()? expired,
  }) {
    return noCookie?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCookie,
    TResult Function()? invalidCookie,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (noCookie != null) {
      return noCookie();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCookie value) noCookie,
    required TResult Function(_InvalidCookie value) invalidCookie,
    required TResult Function(_Expired value) expired,
  }) {
    return noCookie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoCookie value)? noCookie,
    TResult? Function(_InvalidCookie value)? invalidCookie,
    TResult? Function(_Expired value)? expired,
  }) {
    return noCookie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCookie value)? noCookie,
    TResult Function(_InvalidCookie value)? invalidCookie,
    TResult Function(_Expired value)? expired,
    required TResult orElse(),
  }) {
    if (noCookie != null) {
      return noCookie(this);
    }
    return orElse();
  }
}

abstract class _NoCookie implements SessionError {
  const factory _NoCookie() = _$_NoCookie;
}

/// @nodoc
abstract class _$$_InvalidCookieCopyWith<$Res> {
  factory _$$_InvalidCookieCopyWith(
          _$_InvalidCookie value, $Res Function(_$_InvalidCookie) then) =
      __$$_InvalidCookieCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidCookieCopyWithImpl<$Res>
    extends _$SessionErrorCopyWithImpl<$Res, _$_InvalidCookie>
    implements _$$_InvalidCookieCopyWith<$Res> {
  __$$_InvalidCookieCopyWithImpl(
      _$_InvalidCookie _value, $Res Function(_$_InvalidCookie) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'InvalidCookie')
class _$_InvalidCookie implements _InvalidCookie {
  const _$_InvalidCookie();

  @override
  String toString() {
    return 'SessionError.invalidCookie()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InvalidCookie);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCookie,
    required TResult Function() invalidCookie,
    required TResult Function() expired,
  }) {
    return invalidCookie();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noCookie,
    TResult? Function()? invalidCookie,
    TResult? Function()? expired,
  }) {
    return invalidCookie?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCookie,
    TResult Function()? invalidCookie,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (invalidCookie != null) {
      return invalidCookie();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCookie value) noCookie,
    required TResult Function(_InvalidCookie value) invalidCookie,
    required TResult Function(_Expired value) expired,
  }) {
    return invalidCookie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoCookie value)? noCookie,
    TResult? Function(_InvalidCookie value)? invalidCookie,
    TResult? Function(_Expired value)? expired,
  }) {
    return invalidCookie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCookie value)? noCookie,
    TResult Function(_InvalidCookie value)? invalidCookie,
    TResult Function(_Expired value)? expired,
    required TResult orElse(),
  }) {
    if (invalidCookie != null) {
      return invalidCookie(this);
    }
    return orElse();
  }
}

abstract class _InvalidCookie implements SessionError {
  const factory _InvalidCookie() = _$_InvalidCookie;
}

/// @nodoc
abstract class _$$_ExpiredCopyWith<$Res> {
  factory _$$_ExpiredCopyWith(
          _$_Expired value, $Res Function(_$_Expired) then) =
      __$$_ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExpiredCopyWithImpl<$Res>
    extends _$SessionErrorCopyWithImpl<$Res, _$_Expired>
    implements _$$_ExpiredCopyWith<$Res> {
  __$$_ExpiredCopyWithImpl(_$_Expired _value, $Res Function(_$_Expired) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'Expired')
class _$_Expired implements _Expired {
  const _$_Expired();

  @override
  String toString() {
    return 'SessionError.expired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Expired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCookie,
    required TResult Function() invalidCookie,
    required TResult Function() expired,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noCookie,
    TResult? Function()? invalidCookie,
    TResult? Function()? expired,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCookie,
    TResult Function()? invalidCookie,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCookie value) noCookie,
    required TResult Function(_InvalidCookie value) invalidCookie,
    required TResult Function(_Expired value) expired,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoCookie value)? noCookie,
    TResult? Function(_InvalidCookie value)? invalidCookie,
    TResult? Function(_Expired value)? expired,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCookie value)? noCookie,
    TResult Function(_InvalidCookie value)? invalidCookie,
    TResult Function(_Expired value)? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class _Expired implements SessionError {
  const factory _Expired() = _$_Expired;
}

/// @nodoc
mixin _$DataError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() databaseFailure,
    required TResult Function(SessionError sessionError) sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? databaseFailure,
    TResult? Function(SessionError sessionError)? sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? databaseFailure,
    TResult Function(SessionError sessionError)? sessionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_SessionError value) sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_SessionError value)? sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_SessionError value)? sessionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataErrorCopyWith<$Res> {
  factory $DataErrorCopyWith(DataError value, $Res Function(DataError) then) =
      _$DataErrorCopyWithImpl<$Res, DataError>;
}

/// @nodoc
class _$DataErrorCopyWithImpl<$Res, $Val extends DataError>
    implements $DataErrorCopyWith<$Res> {
  _$DataErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DatabaseFailureCopyWith<$Res> {
  factory _$$_DatabaseFailureCopyWith(
          _$_DatabaseFailure value, $Res Function(_$_DatabaseFailure) then) =
      __$$_DatabaseFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DatabaseFailureCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$_DatabaseFailure>
    implements _$$_DatabaseFailureCopyWith<$Res> {
  __$$_DatabaseFailureCopyWithImpl(
      _$_DatabaseFailure _value, $Res Function(_$_DatabaseFailure) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'DatabaseFailure')
class _$_DatabaseFailure implements _DatabaseFailure {
  const _$_DatabaseFailure();

  @override
  String toString() {
    return 'DataError.databaseFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DatabaseFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() databaseFailure,
    required TResult Function(SessionError sessionError) sessionError,
  }) {
    return databaseFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? databaseFailure,
    TResult? Function(SessionError sessionError)? sessionError,
  }) {
    return databaseFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? databaseFailure,
    TResult Function(SessionError sessionError)? sessionError,
    required TResult orElse(),
  }) {
    if (databaseFailure != null) {
      return databaseFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_SessionError value) sessionError,
  }) {
    return databaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_SessionError value)? sessionError,
  }) {
    return databaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_SessionError value)? sessionError,
    required TResult orElse(),
  }) {
    if (databaseFailure != null) {
      return databaseFailure(this);
    }
    return orElse();
  }
}

abstract class _DatabaseFailure implements DataError {
  const factory _DatabaseFailure() = _$_DatabaseFailure;
}

/// @nodoc
abstract class _$$_SessionErrorCopyWith<$Res> {
  factory _$$_SessionErrorCopyWith(
          _$_SessionError value, $Res Function(_$_SessionError) then) =
      __$$_SessionErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionError sessionError});

  $SessionErrorCopyWith<$Res> get sessionError;
}

/// @nodoc
class __$$_SessionErrorCopyWithImpl<$Res>
    extends _$DataErrorCopyWithImpl<$Res, _$_SessionError>
    implements _$$_SessionErrorCopyWith<$Res> {
  __$$_SessionErrorCopyWithImpl(
      _$_SessionError _value, $Res Function(_$_SessionError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionError = null,
  }) {
    return _then(_$_SessionError(
      null == sessionError
          ? _value.sessionError
          : sessionError // ignore: cast_nullable_to_non_nullable
              as SessionError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionErrorCopyWith<$Res> get sessionError {
    return $SessionErrorCopyWith<$Res>(_value.sessionError, (value) {
      return _then(_value.copyWith(sessionError: value));
    });
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'SessionError')
class _$_SessionError implements _SessionError {
  const _$_SessionError(this.sessionError);

  @override
  final SessionError sessionError;

  @override
  String toString() {
    return 'DataError.sessionError(sessionError: $sessionError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionError &&
            (identical(other.sessionError, sessionError) ||
                other.sessionError == sessionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionErrorCopyWith<_$_SessionError> get copyWith =>
      __$$_SessionErrorCopyWithImpl<_$_SessionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() databaseFailure,
    required TResult Function(SessionError sessionError) sessionError,
  }) {
    return sessionError(this.sessionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? databaseFailure,
    TResult? Function(SessionError sessionError)? sessionError,
  }) {
    return sessionError?.call(this.sessionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? databaseFailure,
    TResult Function(SessionError sessionError)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionError != null) {
      return sessionError(this.sessionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_SessionError value) sessionError,
  }) {
    return sessionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_SessionError value)? sessionError,
  }) {
    return sessionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_SessionError value)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionError != null) {
      return sessionError(this);
    }
    return orElse();
  }
}

abstract class _SessionError implements DataError {
  const factory _SessionError(final SessionError sessionError) =
      _$_SessionError;

  SessionError get sessionError;
  @JsonKey(ignore: true)
  _$$_SessionErrorCopyWith<_$_SessionError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StringOptionInternallyTagged {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String data) some,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String data)? some,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String data)? some,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Some value) some,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_Some value)? some,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Some value)? some,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringOptionInternallyTaggedCopyWith<$Res> {
  factory $StringOptionInternallyTaggedCopyWith(
          StringOptionInternallyTagged value,
          $Res Function(StringOptionInternallyTagged) then) =
      _$StringOptionInternallyTaggedCopyWithImpl<$Res,
          StringOptionInternallyTagged>;
}

/// @nodoc
class _$StringOptionInternallyTaggedCopyWithImpl<$Res,
        $Val extends StringOptionInternallyTagged>
    implements $StringOptionInternallyTaggedCopyWith<$Res> {
  _$StringOptionInternallyTaggedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NoneCopyWith<$Res> {
  factory _$$_NoneCopyWith(_$_None value, $Res Function(_$_None) then) =
      __$$_NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoneCopyWithImpl<$Res>
    extends _$StringOptionInternallyTaggedCopyWithImpl<$Res, _$_None>
    implements _$$_NoneCopyWith<$Res> {
  __$$_NoneCopyWithImpl(_$_None _value, $Res Function(_$_None) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'None')
class _$_None implements _None {
  const _$_None();

  @override
  String toString() {
    return 'StringOptionInternallyTagged.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String data) some,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String data)? some,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String data)? some,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Some value) some,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_Some value)? some,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Some value)? some,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None implements StringOptionInternallyTagged {
  const factory _None() = _$_None;
}

/// @nodoc
abstract class _$$_SomeCopyWith<$Res> {
  factory _$$_SomeCopyWith(_$_Some value, $Res Function(_$_Some) then) =
      __$$_SomeCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$_SomeCopyWithImpl<$Res>
    extends _$StringOptionInternallyTaggedCopyWithImpl<$Res, _$_Some>
    implements _$$_SomeCopyWith<$Res> {
  __$$_SomeCopyWithImpl(_$_Some _value, $Res Function(_$_Some) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_Some(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Some')
class _$_Some implements _Some {
  const _$_Some(this.data);

  @override
  final String data;

  @override
  String toString() {
    return 'StringOptionInternallyTagged.some(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Some &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SomeCopyWith<_$_Some> get copyWith =>
      __$$_SomeCopyWithImpl<_$_Some>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(String data) some,
  }) {
    return some(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(String data)? some,
  }) {
    return some?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(String data)? some,
    required TResult orElse(),
  }) {
    if (some != null) {
      return some(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Some value) some,
  }) {
    return some(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_None value)? none,
    TResult? Function(_Some value)? some,
  }) {
    return some?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Some value)? some,
    required TResult orElse(),
  }) {
    if (some != null) {
      return some(this);
    }
    return orElse();
  }
}

abstract class _Some implements StringOptionInternallyTagged {
  const factory _Some(final String data) = _$_Some;

  String get data;
  @JsonKey(ignore: true)
  _$$_SomeCopyWith<_$_Some> get copyWith => throw _privateConstructorUsedError;
}
