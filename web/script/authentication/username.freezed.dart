// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsernameInvalidationDescription {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameInvalidationDescriptionCopyWith<$Res> {
  factory $UsernameInvalidationDescriptionCopyWith(
          UsernameInvalidationDescription value,
          $Res Function(UsernameInvalidationDescription) then) =
      _$UsernameInvalidationDescriptionCopyWithImpl<$Res,
          UsernameInvalidationDescription>;
}

/// @nodoc
class _$UsernameInvalidationDescriptionCopyWithImpl<$Res,
        $Val extends UsernameInvalidationDescription>
    implements $UsernameInvalidationDescriptionCopyWith<$Res> {
  _$UsernameInvalidationDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FilteredCharactersCopyWith<$Res> {
  factory _$$_FilteredCharactersCopyWith(_$_FilteredCharacters value,
          $Res Function(_$_FilteredCharacters) then) =
      __$$_FilteredCharactersCopyWithImpl<$Res>;
  @useResult
  $Res call({String characters});
}

/// @nodoc
class __$$_FilteredCharactersCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res,
        _$_FilteredCharacters> implements _$$_FilteredCharactersCopyWith<$Res> {
  __$$_FilteredCharactersCopyWithImpl(
      _$_FilteredCharacters _value, $Res Function(_$_FilteredCharacters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characters = null,
  }) {
    return _then(_$_FilteredCharacters(
      null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'FilteredCharacters')
class _$_FilteredCharacters implements _FilteredCharacters {
  const _$_FilteredCharacters(this.characters);

  @override
  final String characters;

  @override
  String toString() {
    return 'UsernameInvalidationDescription.filteredCharacters(characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilteredCharacters &&
            (identical(other.characters, characters) ||
                other.characters == characters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilteredCharactersCopyWith<_$_FilteredCharacters> get copyWith =>
      __$$_FilteredCharactersCopyWithImpl<_$_FilteredCharacters>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return filteredCharacters(characters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return filteredCharacters?.call(characters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (filteredCharacters != null) {
      return filteredCharacters(characters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return filteredCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return filteredCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (filteredCharacters != null) {
      return filteredCharacters(this);
    }
    return orElse();
  }
}

abstract class _FilteredCharacters implements UsernameInvalidationDescription {
  const factory _FilteredCharacters(final String characters) =
      _$_FilteredCharacters;

  String get characters;
  @JsonKey(ignore: true)
  _$$_FilteredCharactersCopyWith<_$_FilteredCharacters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FirstCharacterCopyWith<$Res> {
  factory _$$_FirstCharacterCopyWith(
          _$_FirstCharacter value, $Res Function(_$_FirstCharacter) then) =
      __$$_FirstCharacterCopyWithImpl<$Res>;
  @useResult
  $Res call({String character});
}

/// @nodoc
class __$$_FirstCharacterCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res,
        _$_FirstCharacter> implements _$$_FirstCharacterCopyWith<$Res> {
  __$$_FirstCharacterCopyWithImpl(
      _$_FirstCharacter _value, $Res Function(_$_FirstCharacter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
  }) {
    return _then(_$_FirstCharacter(
      null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'FirstCharacter')
class _$_FirstCharacter implements _FirstCharacter {
  const _$_FirstCharacter(this.character);

  @override
  final String character;

  @override
  String toString() {
    return 'UsernameInvalidationDescription.firstCharacter(character: $character)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirstCharacter &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirstCharacterCopyWith<_$_FirstCharacter> get copyWith =>
      __$$_FirstCharacterCopyWithImpl<_$_FirstCharacter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return firstCharacter(character);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return firstCharacter?.call(character);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (firstCharacter != null) {
      return firstCharacter(character);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return firstCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return firstCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (firstCharacter != null) {
      return firstCharacter(this);
    }
    return orElse();
  }
}

abstract class _FirstCharacter implements UsernameInvalidationDescription {
  const factory _FirstCharacter(final String character) = _$_FirstCharacter;

  String get character;
  @JsonKey(ignore: true)
  _$$_FirstCharacterCopyWith<_$_FirstCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LastCharacterCopyWith<$Res> {
  factory _$$_LastCharacterCopyWith(
          _$_LastCharacter value, $Res Function(_$_LastCharacter) then) =
      __$$_LastCharacterCopyWithImpl<$Res>;
  @useResult
  $Res call({String character});
}

/// @nodoc
class __$$_LastCharacterCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res,
        _$_LastCharacter> implements _$$_LastCharacterCopyWith<$Res> {
  __$$_LastCharacterCopyWithImpl(
      _$_LastCharacter _value, $Res Function(_$_LastCharacter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
  }) {
    return _then(_$_LastCharacter(
      null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'LastCharacter')
class _$_LastCharacter implements _LastCharacter {
  const _$_LastCharacter(this.character);

  @override
  final String character;

  @override
  String toString() {
    return 'UsernameInvalidationDescription.lastCharacter(character: $character)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastCharacter &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastCharacterCopyWith<_$_LastCharacter> get copyWith =>
      __$$_LastCharacterCopyWithImpl<_$_LastCharacter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return lastCharacter(character);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return lastCharacter?.call(character);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (lastCharacter != null) {
      return lastCharacter(character);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return lastCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return lastCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (lastCharacter != null) {
      return lastCharacter(this);
    }
    return orElse();
  }
}

abstract class _LastCharacter implements UsernameInvalidationDescription {
  const factory _LastCharacter(final String character) = _$_LastCharacter;

  String get character;
  @JsonKey(ignore: true)
  _$$_LastCharacterCopyWith<_$_LastCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MinLengthCopyWith<$Res> {
  factory _$$_MinLengthCopyWith(
          _$_MinLength value, $Res Function(_$_MinLength) then) =
      __$$_MinLengthCopyWithImpl<$Res>;
  @useResult
  $Res call({int usernameLength, int limit});
}

/// @nodoc
class __$$_MinLengthCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res, _$_MinLength>
    implements _$$_MinLengthCopyWith<$Res> {
  __$$_MinLengthCopyWithImpl(
      _$_MinLength _value, $Res Function(_$_MinLength) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameLength = null,
    Object? limit = null,
  }) {
    return _then(_$_MinLength(
      null == usernameLength
          ? _value.usernameLength
          : usernameLength // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'MinLength')
class _$_MinLength implements _MinLength {
  const _$_MinLength(this.usernameLength, this.limit);

  @override
  final int usernameLength;
  @override
  final int limit;

  @override
  String toString() {
    return 'UsernameInvalidationDescription.minLength(usernameLength: $usernameLength, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MinLength &&
            (identical(other.usernameLength, usernameLength) ||
                other.usernameLength == usernameLength) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameLength, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MinLengthCopyWith<_$_MinLength> get copyWith =>
      __$$_MinLengthCopyWithImpl<_$_MinLength>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return minLength(usernameLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return minLength?.call(usernameLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (minLength != null) {
      return minLength(usernameLength, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return minLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return minLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (minLength != null) {
      return minLength(this);
    }
    return orElse();
  }
}

abstract class _MinLength implements UsernameInvalidationDescription {
  const factory _MinLength(final int usernameLength, final int limit) =
      _$_MinLength;

  int get usernameLength;
  int get limit;
  @JsonKey(ignore: true)
  _$$_MinLengthCopyWith<_$_MinLength> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MaxLengthCopyWith<$Res> {
  factory _$$_MaxLengthCopyWith(
          _$_MaxLength value, $Res Function(_$_MaxLength) then) =
      __$$_MaxLengthCopyWithImpl<$Res>;
  @useResult
  $Res call({int usernameLength, int limit});
}

/// @nodoc
class __$$_MaxLengthCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res, _$_MaxLength>
    implements _$$_MaxLengthCopyWith<$Res> {
  __$$_MaxLengthCopyWithImpl(
      _$_MaxLength _value, $Res Function(_$_MaxLength) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameLength = null,
    Object? limit = null,
  }) {
    return _then(_$_MaxLength(
      null == usernameLength
          ? _value.usernameLength
          : usernameLength // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'MaxLength')
class _$_MaxLength implements _MaxLength {
  const _$_MaxLength(this.usernameLength, this.limit);

  @override
  final int usernameLength;
  @override
  final int limit;

  @override
  String toString() {
    return 'UsernameInvalidationDescription.maxLength(usernameLength: $usernameLength, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaxLength &&
            (identical(other.usernameLength, usernameLength) ||
                other.usernameLength == usernameLength) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameLength, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaxLengthCopyWith<_$_MaxLength> get copyWith =>
      __$$_MaxLengthCopyWithImpl<_$_MaxLength>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return maxLength(usernameLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return maxLength?.call(usernameLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (maxLength != null) {
      return maxLength(usernameLength, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return maxLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return maxLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (maxLength != null) {
      return maxLength(this);
    }
    return orElse();
  }
}

abstract class _MaxLength implements UsernameInvalidationDescription {
  const factory _MaxLength(final int usernameLength, final int limit) =
      _$_MaxLength;

  int get usernameLength;
  int get limit;
  @JsonKey(ignore: true)
  _$$_MaxLengthCopyWith<_$_MaxLength> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnknownErrorCopyWith<$Res> {
  factory _$$_UnknownErrorCopyWith(
          _$_UnknownError value, $Res Function(_$_UnknownError) then) =
      __$$_UnknownErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnknownErrorCopyWithImpl<$Res>
    extends _$UsernameInvalidationDescriptionCopyWithImpl<$Res, _$_UnknownError>
    implements _$$_UnknownErrorCopyWith<$Res> {
  __$$_UnknownErrorCopyWithImpl(
      _$_UnknownError _value, $Res Function(_$_UnknownError) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'UnknownError')
class _$_UnknownError implements _UnknownError {
  const _$_UnknownError();

  @override
  String toString() {
    return 'UsernameInvalidationDescription.unknownError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnknownError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int usernameLength, int limit) minLength,
    required TResult Function(int usernameLength, int limit) maxLength,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int usernameLength, int limit)? minLength,
    TResult? Function(int usernameLength, int limit)? maxLength,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int usernameLength, int limit)? minLength,
    TResult Function(int usernameLength, int limit)? maxLength,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilteredCharacters value) filteredCharacters,
    required TResult Function(_FirstCharacter value) firstCharacter,
    required TResult Function(_LastCharacter value) lastCharacter,
    required TResult Function(_MinLength value) minLength,
    required TResult Function(_MaxLength value) maxLength,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilteredCharacters value)? filteredCharacters,
    TResult? Function(_FirstCharacter value)? firstCharacter,
    TResult? Function(_LastCharacter value)? lastCharacter,
    TResult? Function(_MinLength value)? minLength,
    TResult? Function(_MaxLength value)? maxLength,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilteredCharacters value)? filteredCharacters,
    TResult Function(_FirstCharacter value)? firstCharacter,
    TResult Function(_LastCharacter value)? lastCharacter,
    TResult Function(_MinLength value)? minLength,
    TResult Function(_MaxLength value)? maxLength,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError implements UsernameInvalidationDescription {
  const factory _UnknownError() = _$_UnknownError;
}
