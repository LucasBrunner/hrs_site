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
mixin _$WarehouseInventoryManualUpdateResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WarehouseInventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<WarehouseInventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WarehouseInventoryItem> items)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InventoryUpdateOk value) ok,
    required TResult Function(_InventoryUpdateErr value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryUpdateOk value)? ok,
    TResult? Function(_InventoryUpdateErr value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryUpdateOk value)? ok,
    TResult Function(_InventoryUpdateErr value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseInventoryManualUpdateResultCopyWith<$Res> {
  factory $WarehouseInventoryManualUpdateResultCopyWith(
          WarehouseInventoryManualUpdateResult value,
          $Res Function(WarehouseInventoryManualUpdateResult) then) =
      _$WarehouseInventoryManualUpdateResultCopyWithImpl<$Res,
          WarehouseInventoryManualUpdateResult>;
}

/// @nodoc
class _$WarehouseInventoryManualUpdateResultCopyWithImpl<$Res,
        $Val extends WarehouseInventoryManualUpdateResult>
    implements $WarehouseInventoryManualUpdateResultCopyWith<$Res> {
  _$WarehouseInventoryManualUpdateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InventoryUpdateOkCopyWith<$Res> {
  factory _$$_InventoryUpdateOkCopyWith(_$_InventoryUpdateOk value,
          $Res Function(_$_InventoryUpdateOk) then) =
      __$$_InventoryUpdateOkCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WarehouseInventoryItem> items});
}

/// @nodoc
class __$$_InventoryUpdateOkCopyWithImpl<$Res>
    extends _$WarehouseInventoryManualUpdateResultCopyWithImpl<$Res,
        _$_InventoryUpdateOk> implements _$$_InventoryUpdateOkCopyWith<$Res> {
  __$$_InventoryUpdateOkCopyWithImpl(
      _$_InventoryUpdateOk _value, $Res Function(_$_InventoryUpdateOk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_InventoryUpdateOk(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WarehouseInventoryItem>,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_InventoryUpdateOk implements _InventoryUpdateOk {
  const _$_InventoryUpdateOk(final List<WarehouseInventoryItem> items)
      : _items = items;

  final List<WarehouseInventoryItem> _items;
  @override
  List<WarehouseInventoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'WarehouseInventoryManualUpdateResult.ok(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryUpdateOk &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryUpdateOkCopyWith<_$_InventoryUpdateOk> get copyWith =>
      __$$_InventoryUpdateOkCopyWithImpl<_$_InventoryUpdateOk>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WarehouseInventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) {
    return ok(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<WarehouseInventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return ok?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WarehouseInventoryItem> items)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InventoryUpdateOk value) ok,
    required TResult Function(_InventoryUpdateErr value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryUpdateOk value)? ok,
    TResult? Function(_InventoryUpdateErr value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryUpdateOk value)? ok,
    TResult Function(_InventoryUpdateErr value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _InventoryUpdateOk
    implements WarehouseInventoryManualUpdateResult {
  const factory _InventoryUpdateOk(final List<WarehouseInventoryItem> items) =
      _$_InventoryUpdateOk;

  List<WarehouseInventoryItem> get items;
  @JsonKey(ignore: true)
  _$$_InventoryUpdateOkCopyWith<_$_InventoryUpdateOk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InventoryUpdateErrCopyWith<$Res> {
  factory _$$_InventoryUpdateErrCopyWith(_$_InventoryUpdateErr value,
          $Res Function(_$_InventoryUpdateErr) then) =
      __$$_InventoryUpdateErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError err});

  $DataErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_InventoryUpdateErrCopyWithImpl<$Res>
    extends _$WarehouseInventoryManualUpdateResultCopyWithImpl<$Res,
        _$_InventoryUpdateErr> implements _$$_InventoryUpdateErrCopyWith<$Res> {
  __$$_InventoryUpdateErrCopyWithImpl(
      _$_InventoryUpdateErr _value, $Res Function(_$_InventoryUpdateErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_InventoryUpdateErr(
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
class _$_InventoryUpdateErr implements _InventoryUpdateErr {
  const _$_InventoryUpdateErr(this.err);

  @override
  final DataError err;

  @override
  String toString() {
    return 'WarehouseInventoryManualUpdateResult.err(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryUpdateErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryUpdateErrCopyWith<_$_InventoryUpdateErr> get copyWith =>
      __$$_InventoryUpdateErrCopyWithImpl<_$_InventoryUpdateErr>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WarehouseInventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) {
    return err(this.err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<WarehouseInventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return err?.call(this.err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WarehouseInventoryItem> items)? ok,
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
    required TResult Function(_InventoryUpdateOk value) ok,
    required TResult Function(_InventoryUpdateErr value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryUpdateOk value)? ok,
    TResult? Function(_InventoryUpdateErr value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryUpdateOk value)? ok,
    TResult Function(_InventoryUpdateErr value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _InventoryUpdateErr
    implements WarehouseInventoryManualUpdateResult {
  const factory _InventoryUpdateErr(final DataError err) =
      _$_InventoryUpdateErr;

  DataError get err;
  @JsonKey(ignore: true)
  _$$_InventoryUpdateErrCopyWith<_$_InventoryUpdateErr> get copyWith =>
      throw _privateConstructorUsedError;
}
