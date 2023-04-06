// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WarehouseInventoryResult {
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
    required TResult Function(_InventoryOk value) ok,
    required TResult Function(_InventoryErr value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryOk value)? ok,
    TResult? Function(_InventoryErr value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryOk value)? ok,
    TResult Function(_InventoryErr value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseInventoryResultCopyWith<$Res> {
  factory $WarehouseInventoryResultCopyWith(WarehouseInventoryResult value,
          $Res Function(WarehouseInventoryResult) then) =
      _$WarehouseInventoryResultCopyWithImpl<$Res, WarehouseInventoryResult>;
}

/// @nodoc
class _$WarehouseInventoryResultCopyWithImpl<$Res,
        $Val extends WarehouseInventoryResult>
    implements $WarehouseInventoryResultCopyWith<$Res> {
  _$WarehouseInventoryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InventoryOkCopyWith<$Res> {
  factory _$$_InventoryOkCopyWith(
          _$_InventoryOk value, $Res Function(_$_InventoryOk) then) =
      __$$_InventoryOkCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WarehouseInventoryItem> items});
}

/// @nodoc
class __$$_InventoryOkCopyWithImpl<$Res>
    extends _$WarehouseInventoryResultCopyWithImpl<$Res, _$_InventoryOk>
    implements _$$_InventoryOkCopyWith<$Res> {
  __$$_InventoryOkCopyWithImpl(
      _$_InventoryOk _value, $Res Function(_$_InventoryOk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_InventoryOk(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WarehouseInventoryItem>,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_InventoryOk implements _InventoryOk {
  const _$_InventoryOk(final List<WarehouseInventoryItem> items)
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
    return 'WarehouseInventoryResult.ok(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryOk &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryOkCopyWith<_$_InventoryOk> get copyWith =>
      __$$_InventoryOkCopyWithImpl<_$_InventoryOk>(this, _$identity);

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
    required TResult Function(_InventoryOk value) ok,
    required TResult Function(_InventoryErr value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryOk value)? ok,
    TResult? Function(_InventoryErr value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryOk value)? ok,
    TResult Function(_InventoryErr value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _InventoryOk implements WarehouseInventoryResult {
  const factory _InventoryOk(final List<WarehouseInventoryItem> items) =
      _$_InventoryOk;

  List<WarehouseInventoryItem> get items;
  @JsonKey(ignore: true)
  _$$_InventoryOkCopyWith<_$_InventoryOk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InventoryErrCopyWith<$Res> {
  factory _$$_InventoryErrCopyWith(
          _$_InventoryErr value, $Res Function(_$_InventoryErr) then) =
      __$$_InventoryErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError err});

  $DataErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_InventoryErrCopyWithImpl<$Res>
    extends _$WarehouseInventoryResultCopyWithImpl<$Res, _$_InventoryErr>
    implements _$$_InventoryErrCopyWith<$Res> {
  __$$_InventoryErrCopyWithImpl(
      _$_InventoryErr _value, $Res Function(_$_InventoryErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_InventoryErr(
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
class _$_InventoryErr implements _InventoryErr {
  const _$_InventoryErr(this.err);

  @override
  final DataError err;

  @override
  String toString() {
    return 'WarehouseInventoryResult.err(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryErrCopyWith<_$_InventoryErr> get copyWith =>
      __$$_InventoryErrCopyWithImpl<_$_InventoryErr>(this, _$identity);

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
    required TResult Function(_InventoryOk value) ok,
    required TResult Function(_InventoryErr value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryOk value)? ok,
    TResult? Function(_InventoryErr value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryOk value)? ok,
    TResult Function(_InventoryErr value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _InventoryErr implements WarehouseInventoryResult {
  const factory _InventoryErr(final DataError err) = _$_InventoryErr;

  DataError get err;
  @JsonKey(ignore: true)
  _$$_InventoryErrCopyWith<_$_InventoryErr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryItemResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryItem> items)? ok,
    TResult Function(DataError err)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InventoryItemOk value) ok,
    required TResult Function(_InventoryItemErr value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryItemOk value)? ok,
    TResult? Function(_InventoryItemErr value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryItemOk value)? ok,
    TResult Function(_InventoryItemErr value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemResultCopyWith<$Res> {
  factory $InventoryItemResultCopyWith(
          InventoryItemResult value, $Res Function(InventoryItemResult) then) =
      _$InventoryItemResultCopyWithImpl<$Res, InventoryItemResult>;
}

/// @nodoc
class _$InventoryItemResultCopyWithImpl<$Res, $Val extends InventoryItemResult>
    implements $InventoryItemResultCopyWith<$Res> {
  _$InventoryItemResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InventoryItemOkCopyWith<$Res> {
  factory _$$_InventoryItemOkCopyWith(
          _$_InventoryItemOk value, $Res Function(_$_InventoryItemOk) then) =
      __$$_InventoryItemOkCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InventoryItem> items});
}

/// @nodoc
class __$$_InventoryItemOkCopyWithImpl<$Res>
    extends _$InventoryItemResultCopyWithImpl<$Res, _$_InventoryItemOk>
    implements _$$_InventoryItemOkCopyWith<$Res> {
  __$$_InventoryItemOkCopyWithImpl(
      _$_InventoryItemOk _value, $Res Function(_$_InventoryItemOk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_InventoryItemOk(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_InventoryItemOk implements _InventoryItemOk {
  const _$_InventoryItemOk(final List<InventoryItem> items) : _items = items;

  final List<InventoryItem> _items;
  @override
  List<InventoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InventoryItemResult.ok(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryItemOk &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryItemOkCopyWith<_$_InventoryItemOk> get copyWith =>
      __$$_InventoryItemOkCopyWithImpl<_$_InventoryItemOk>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) {
    return ok(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return ok?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryItem> items)? ok,
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
    required TResult Function(_InventoryItemOk value) ok,
    required TResult Function(_InventoryItemErr value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryItemOk value)? ok,
    TResult? Function(_InventoryItemErr value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryItemOk value)? ok,
    TResult Function(_InventoryItemErr value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _InventoryItemOk implements InventoryItemResult {
  const factory _InventoryItemOk(final List<InventoryItem> items) =
      _$_InventoryItemOk;

  List<InventoryItem> get items;
  @JsonKey(ignore: true)
  _$$_InventoryItemOkCopyWith<_$_InventoryItemOk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InventoryItemErrCopyWith<$Res> {
  factory _$$_InventoryItemErrCopyWith(
          _$_InventoryItemErr value, $Res Function(_$_InventoryItemErr) then) =
      __$$_InventoryItemErrCopyWithImpl<$Res>;
  @useResult
  $Res call({DataError err});

  $DataErrorCopyWith<$Res> get err;
}

/// @nodoc
class __$$_InventoryItemErrCopyWithImpl<$Res>
    extends _$InventoryItemResultCopyWithImpl<$Res, _$_InventoryItemErr>
    implements _$$_InventoryItemErrCopyWith<$Res> {
  __$$_InventoryItemErrCopyWithImpl(
      _$_InventoryItemErr _value, $Res Function(_$_InventoryItemErr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_InventoryItemErr(
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
class _$_InventoryItemErr implements _InventoryItemErr {
  const _$_InventoryItemErr(this.err);

  @override
  final DataError err;

  @override
  String toString() {
    return 'InventoryItemResult.err(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryItemErr &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryItemErrCopyWith<_$_InventoryItemErr> get copyWith =>
      __$$_InventoryItemErrCopyWithImpl<_$_InventoryItemErr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryItem> items) ok,
    required TResult Function(DataError err) err,
  }) {
    return err(this.err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryItem> items)? ok,
    TResult? Function(DataError err)? err,
  }) {
    return err?.call(this.err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryItem> items)? ok,
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
    required TResult Function(_InventoryItemOk value) ok,
    required TResult Function(_InventoryItemErr value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InventoryItemOk value)? ok,
    TResult? Function(_InventoryItemErr value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InventoryItemOk value)? ok,
    TResult Function(_InventoryItemErr value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class _InventoryItemErr implements InventoryItemResult {
  const factory _InventoryItemErr(final DataError err) = _$_InventoryItemErr;

  DataError get err;
  @JsonKey(ignore: true)
  _$$_InventoryItemErrCopyWith<_$_InventoryItemErr> get copyWith =>
      throw _privateConstructorUsedError;
}

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
