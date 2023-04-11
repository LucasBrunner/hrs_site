// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account account) ok,
    required TResult Function(DataError err) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account account)? ok,
    TResult? Function(DataError err)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account account)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ok value) ok,
    required TResult Function(_Err value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ok value)? ok,
    TResult? Function(_Err value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ok value)? ok,
    TResult Function(_Err value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResultCopyWith<$Res> {
  factory $AccountResultCopyWith(
          AccountResult value, $Res Function(AccountResult) then) =
      _$AccountResultCopyWithImpl<$Res, AccountResult>;
}

/// @nodoc
class _$AccountResultCopyWithImpl<$Res, $Val extends AccountResult>
    implements $AccountResultCopyWith<$Res> {
  _$AccountResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_OkCopyWith<$Res> {
  factory _$$_OkCopyWith(_$_Ok value, $Res Function(_$_Ok) then) =
      __$$_OkCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});
}

/// @nodoc
class __$$_OkCopyWithImpl<$Res> extends _$AccountResultCopyWithImpl<$Res, _$_Ok>
    implements _$$_OkCopyWith<$Res> {
  __$$_OkCopyWithImpl(_$_Ok _value, $Res Function(_$_Ok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_Ok(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_Ok implements _Ok {
  const _$_Ok(this.account);

  @override
  final Account account;

  @override
  String toString() {
    return 'AccountResult.ok(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ok &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OkCopyWith<_$_Ok> get copyWith =>
      __$$_OkCopyWithImpl<_$_Ok>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account account) ok,
    required TResult Function(DataError err) err,
  }) {
    return ok(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account account)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return ok?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account account)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ok value) ok,
    required TResult Function(_Err value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ok value)? ok,
    TResult? Function(_Err value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ok value)? ok,
    TResult Function(_Err value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _Ok implements AccountResult {
  const factory _Ok(final Account account) = _$_Ok;

  Account get account;
  @JsonKey(ignore: true)
  _$$_OkCopyWith<_$_Ok> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrCopyWith<$Res> {
  factory _$$_ErrCopyWith(_$_Err value, $Res Function(_$_Err) then) =
      __$$_ErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError err});

  $DataErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_ErrCopyWithImpl<$Res>
    extends _$AccountResultCopyWithImpl<$Res, _$_Err>
    implements _$$_ErrCopyWith<$Res> {
  __$$_ErrCopyWithImpl(_$_Err _value, $Res Function(_$_Err) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_Err(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as DataError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DataErrorCopyWith<$Res> get err {
    return $DataErrorCopyWith<$Res>(_value.err, (value) {
      return _then(_value.copyWith(err: value));
    });
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Err')
class _$_Err implements _Err {
  const _$_Err(this.err);

  @override
  final DataError err;

  @override
  String toString() {
    return 'AccountResult.err(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Err &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrCopyWith<_$_Err> get copyWith =>
      __$$_ErrCopyWithImpl<_$_Err>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account account) ok,
    required TResult Function(DataError err) err,
  }) {
    return err(this.err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Account account)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return err?.call(this.err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account account)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this.err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Ok value) ok,
    required TResult Function(_Err value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Ok value)? ok,
    TResult? Function(_Err value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Ok value)? ok,
    TResult Function(_Err value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _Err implements AccountResult {
  const factory _Err(final DataError err) = _$_Err;

  DataError get err;
  @JsonKey(ignore: true)
  _$$_ErrCopyWith<_$_Err> get copyWith => throw _privateConstructorUsedError;
}
