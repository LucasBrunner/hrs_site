// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WarehouseResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouses) ok,
    required TResult Function(DataError err) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouses)? ok,
    TResult? Function(DataError err)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouses)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WarehouseOk value) ok,
    required TResult Function(_WarehouseErr value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WarehouseOk value)? ok,
    TResult? Function(_WarehouseErr value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WarehouseOk value)? ok,
    TResult Function(_WarehouseErr value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseResultCopyWith<$Res> {
  factory $WarehouseResultCopyWith(
          WarehouseResult value, $Res Function(WarehouseResult) then) =
      _$WarehouseResultCopyWithImpl<$Res, WarehouseResult>;
}

/// @nodoc
class _$WarehouseResultCopyWithImpl<$Res, $Val extends WarehouseResult>
    implements $WarehouseResultCopyWith<$Res> {
  _$WarehouseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WarehouseOkCopyWith<$Res> {
  factory _$$_WarehouseOkCopyWith(
          _$_WarehouseOk value, $Res Function(_$_WarehouseOk) then) =
      __$$_WarehouseOkCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Warehouse> warehouses});
}

/// @nodoc
class __$$_WarehouseOkCopyWithImpl<$Res>
    extends _$WarehouseResultCopyWithImpl<$Res, _$_WarehouseOk>
    implements _$$_WarehouseOkCopyWith<$Res> {
  __$$_WarehouseOkCopyWithImpl(
      _$_WarehouseOk _value, $Res Function(_$_WarehouseOk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouses = null,
  }) {
    return _then(_$_WarehouseOk(
      null == warehouses
          ? _value._warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as List<Warehouse>,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_WarehouseOk implements _WarehouseOk {
  const _$_WarehouseOk(final List<Warehouse> warehouses)
      : _warehouses = warehouses;

  final List<Warehouse> _warehouses;
  @override
  List<Warehouse> get warehouses {
    if (_warehouses is EqualUnmodifiableListView) return _warehouses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warehouses);
  }

  @override
  String toString() {
    return 'WarehouseResult.ok(warehouses: $warehouses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WarehouseOk &&
            const DeepCollectionEquality()
                .equals(other._warehouses, _warehouses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_warehouses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WarehouseOkCopyWith<_$_WarehouseOk> get copyWith =>
      __$$_WarehouseOkCopyWithImpl<_$_WarehouseOk>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouses) ok,
    required TResult Function(DataError err) err,
  }) {
    return ok(warehouses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouses)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return ok?.call(warehouses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouses)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(warehouses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WarehouseOk value) ok,
    required TResult Function(_WarehouseErr value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WarehouseOk value)? ok,
    TResult? Function(_WarehouseErr value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WarehouseOk value)? ok,
    TResult Function(_WarehouseErr value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _WarehouseOk implements WarehouseResult {
  const factory _WarehouseOk(final List<Warehouse> warehouses) = _$_WarehouseOk;

  List<Warehouse> get warehouses;
  @JsonKey(ignore: true)
  _$$_WarehouseOkCopyWith<_$_WarehouseOk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WarehouseErrCopyWith<$Res> {
  factory _$$_WarehouseErrCopyWith(
          _$_WarehouseErr value, $Res Function(_$_WarehouseErr) then) =
      __$$_WarehouseErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError err});

  $DataErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_WarehouseErrCopyWithImpl<$Res>
    extends _$WarehouseResultCopyWithImpl<$Res, _$_WarehouseErr>
    implements _$$_WarehouseErrCopyWith<$Res> {
  __$$_WarehouseErrCopyWithImpl(
      _$_WarehouseErr _value, $Res Function(_$_WarehouseErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_WarehouseErr(
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
class _$_WarehouseErr implements _WarehouseErr {
  const _$_WarehouseErr(this.err);

  @override
  final DataError err;

  @override
  String toString() {
    return 'WarehouseResult.err(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WarehouseErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WarehouseErrCopyWith<_$_WarehouseErr> get copyWith =>
      __$$_WarehouseErrCopyWithImpl<_$_WarehouseErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouses) ok,
    required TResult Function(DataError err) err,
  }) {
    return err(this.err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouses)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return err?.call(this.err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouses)? ok,
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
    required TResult Function(_WarehouseOk value) ok,
    required TResult Function(_WarehouseErr value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WarehouseOk value)? ok,
    TResult? Function(_WarehouseErr value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WarehouseOk value)? ok,
    TResult Function(_WarehouseErr value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _WarehouseErr implements WarehouseResult {
  const factory _WarehouseErr(final DataError err) = _$_WarehouseErr;

  DataError get err;
  @JsonKey(ignore: true)
  _$$_WarehouseErrCopyWith<_$_WarehouseErr> get copyWith =>
      throw _privateConstructorUsedError;
}
