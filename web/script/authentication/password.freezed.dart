// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordInvalidationDescription {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordInvalidationDescriptionCopyWith<$Res> {
  factory $PasswordInvalidationDescriptionCopyWith(
          PasswordInvalidationDescription value,
          $Res Function(PasswordInvalidationDescription) then) =
      _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
          PasswordInvalidationDescription>;
}

/// @nodoc
class _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
        $Val extends PasswordInvalidationDescription>
    implements $PasswordInvalidationDescriptionCopyWith<$Res> {
  _$PasswordInvalidationDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FilteredCharactersPCopyWith<$Res> {
  factory _$$FilteredCharactersPCopyWith(_$FilteredCharactersP value,
          $Res Function(_$FilteredCharactersP) then) =
      __$$FilteredCharactersPCopyWithImpl<$Res>;
  @useResult
  $Res call({String characters});
}

/// @nodoc
class __$$FilteredCharactersPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
        _$FilteredCharactersP> implements _$$FilteredCharactersPCopyWith<$Res> {
  __$$FilteredCharactersPCopyWithImpl(
      _$FilteredCharactersP _value, $Res Function(_$FilteredCharactersP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characters = null,
  }) {
    return _then(_$FilteredCharactersP(
      null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'FilteredCharacters')
class _$FilteredCharactersP implements FilteredCharactersP {
  const _$FilteredCharactersP(this.characters);

  @override
  final String characters;

  @override
  String toString() {
    return 'PasswordInvalidationDescription.filteredCharacters(characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredCharactersP &&
            (identical(other.characters, characters) ||
                other.characters == characters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredCharactersPCopyWith<_$FilteredCharactersP> get copyWith =>
      __$$FilteredCharactersPCopyWithImpl<_$FilteredCharactersP>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return filteredCharacters(characters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return filteredCharacters?.call(characters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
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
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return filteredCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return filteredCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (filteredCharacters != null) {
      return filteredCharacters(this);
    }
    return orElse();
  }
}

abstract class FilteredCharactersP implements PasswordInvalidationDescription {
  const factory FilteredCharactersP(final String characters) =
      _$FilteredCharactersP;

  String get characters;
  @JsonKey(ignore: true)
  _$$FilteredCharactersPCopyWith<_$FilteredCharactersP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstCharacterPCopyWith<$Res> {
  factory _$$FirstCharacterPCopyWith(
          _$FirstCharacterP value, $Res Function(_$FirstCharacterP) then) =
      __$$FirstCharacterPCopyWithImpl<$Res>;
  @useResult
  $Res call({String character});
}

/// @nodoc
class __$$FirstCharacterPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
        _$FirstCharacterP> implements _$$FirstCharacterPCopyWith<$Res> {
  __$$FirstCharacterPCopyWithImpl(
      _$FirstCharacterP _value, $Res Function(_$FirstCharacterP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
  }) {
    return _then(_$FirstCharacterP(
      null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'FirstCharacter')
class _$FirstCharacterP implements FirstCharacterP {
  const _$FirstCharacterP(this.character);

  @override
  final String character;

  @override
  String toString() {
    return 'PasswordInvalidationDescription.firstCharacter(character: $character)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstCharacterP &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstCharacterPCopyWith<_$FirstCharacterP> get copyWith =>
      __$$FirstCharacterPCopyWithImpl<_$FirstCharacterP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return firstCharacter(character);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return firstCharacter?.call(character);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
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
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return firstCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return firstCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (firstCharacter != null) {
      return firstCharacter(this);
    }
    return orElse();
  }
}

abstract class FirstCharacterP implements PasswordInvalidationDescription {
  const factory FirstCharacterP(final String character) = _$FirstCharacterP;

  String get character;
  @JsonKey(ignore: true)
  _$$FirstCharacterPCopyWith<_$FirstCharacterP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LastCharacterPCopyWith<$Res> {
  factory _$$LastCharacterPCopyWith(
          _$LastCharacterP value, $Res Function(_$LastCharacterP) then) =
      __$$LastCharacterPCopyWithImpl<$Res>;
  @useResult
  $Res call({String character});
}

/// @nodoc
class __$$LastCharacterPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
        _$LastCharacterP> implements _$$LastCharacterPCopyWith<$Res> {
  __$$LastCharacterPCopyWithImpl(
      _$LastCharacterP _value, $Res Function(_$LastCharacterP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
  }) {
    return _then(_$LastCharacterP(
      null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'LastCharacter')
class _$LastCharacterP implements LastCharacterP {
  const _$LastCharacterP(this.character);

  @override
  final String character;

  @override
  String toString() {
    return 'PasswordInvalidationDescription.lastCharacter(character: $character)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastCharacterP &&
            (identical(other.character, character) ||
                other.character == character));
  }

  @override
  int get hashCode => Object.hash(runtimeType, character);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastCharacterPCopyWith<_$LastCharacterP> get copyWith =>
      __$$LastCharacterPCopyWithImpl<_$LastCharacterP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return lastCharacter(character);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return lastCharacter?.call(character);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
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
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return lastCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return lastCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (lastCharacter != null) {
      return lastCharacter(this);
    }
    return orElse();
  }
}

abstract class LastCharacterP implements PasswordInvalidationDescription {
  const factory LastCharacterP(final String character) = _$LastCharacterP;

  String get character;
  @JsonKey(ignore: true)
  _$$LastCharacterPCopyWith<_$LastCharacterP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MinLengthPCopyWith<$Res> {
  factory _$$MinLengthPCopyWith(
          _$MinLengthP value, $Res Function(_$MinLengthP) then) =
      __$$MinLengthPCopyWithImpl<$Res>;
  @useResult
  $Res call({int passwordLength, int limit});
}

/// @nodoc
class __$$MinLengthPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$MinLengthP>
    implements _$$MinLengthPCopyWith<$Res> {
  __$$MinLengthPCopyWithImpl(
      _$MinLengthP _value, $Res Function(_$MinLengthP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordLength = null,
    Object? limit = null,
  }) {
    return _then(_$MinLengthP(
      null == passwordLength
          ? _value.passwordLength
          : passwordLength // ignore: cast_nullable_to_non_nullable
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
class _$MinLengthP implements MinLengthP {
  const _$MinLengthP(this.passwordLength, this.limit);

  @override
  final int passwordLength;
  @override
  final int limit;

  @override
  String toString() {
    return 'PasswordInvalidationDescription.minLength(passwordLength: $passwordLength, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinLengthP &&
            (identical(other.passwordLength, passwordLength) ||
                other.passwordLength == passwordLength) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordLength, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinLengthPCopyWith<_$MinLengthP> get copyWith =>
      __$$MinLengthPCopyWithImpl<_$MinLengthP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return minLength(passwordLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return minLength?.call(passwordLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (minLength != null) {
      return minLength(passwordLength, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return minLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return minLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (minLength != null) {
      return minLength(this);
    }
    return orElse();
  }
}

abstract class MinLengthP implements PasswordInvalidationDescription {
  const factory MinLengthP(final int passwordLength, final int limit) =
      _$MinLengthP;

  int get passwordLength;
  int get limit;
  @JsonKey(ignore: true)
  _$$MinLengthPCopyWith<_$MinLengthP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaxLengthPCopyWith<$Res> {
  factory _$$MaxLengthPCopyWith(
          _$MaxLengthP value, $Res Function(_$MaxLengthP) then) =
      __$$MaxLengthPCopyWithImpl<$Res>;
  @useResult
  $Res call({int passwordLength, int limit});
}

/// @nodoc
class __$$MaxLengthPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$MaxLengthP>
    implements _$$MaxLengthPCopyWith<$Res> {
  __$$MaxLengthPCopyWithImpl(
      _$MaxLengthP _value, $Res Function(_$MaxLengthP) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordLength = null,
    Object? limit = null,
  }) {
    return _then(_$MaxLengthP(
      null == passwordLength
          ? _value.passwordLength
          : passwordLength // ignore: cast_nullable_to_non_nullable
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
class _$MaxLengthP implements MaxLengthP {
  const _$MaxLengthP(this.passwordLength, this.limit);

  @override
  final int passwordLength;
  @override
  final int limit;

  @override
  String toString() {
    return 'PasswordInvalidationDescription.maxLength(passwordLength: $passwordLength, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaxLengthP &&
            (identical(other.passwordLength, passwordLength) ||
                other.passwordLength == passwordLength) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordLength, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaxLengthPCopyWith<_$MaxLengthP> get copyWith =>
      __$$MaxLengthPCopyWithImpl<_$MaxLengthP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return maxLength(passwordLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return maxLength?.call(passwordLength, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (maxLength != null) {
      return maxLength(passwordLength, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return maxLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return maxLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (maxLength != null) {
      return maxLength(this);
    }
    return orElse();
  }
}

abstract class MaxLengthP implements PasswordInvalidationDescription {
  const factory MaxLengthP(final int passwordLength, final int limit) =
      _$MaxLengthP;

  int get passwordLength;
  int get limit;
  @JsonKey(ignore: true)
  _$$MaxLengthPCopyWith<_$MaxLengthP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecodeErrorPCopyWith<$Res> {
  factory _$$DecodeErrorPCopyWith(
          _$DecodeErrorP value, $Res Function(_$DecodeErrorP) then) =
      __$$DecodeErrorPCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DecodeErrorPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$DecodeErrorP>
    implements _$$DecodeErrorPCopyWith<$Res> {
  __$$DecodeErrorPCopyWithImpl(
      _$DecodeErrorP _value, $Res Function(_$DecodeErrorP) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'DecodeError')
class _$DecodeErrorP implements DecodeErrorP {
  const _$DecodeErrorP();

  @override
  String toString() {
    return 'PasswordInvalidationDescription.decodeErrorP()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DecodeErrorP);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return decodeErrorP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return decodeErrorP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (decodeErrorP != null) {
      return decodeErrorP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return decodeErrorP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return decodeErrorP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (decodeErrorP != null) {
      return decodeErrorP(this);
    }
    return orElse();
  }
}

abstract class DecodeErrorP implements PasswordInvalidationDescription {
  const factory DecodeErrorP() = _$DecodeErrorP;
}

/// @nodoc
abstract class _$$UnknownErrorPCopyWith<$Res> {
  factory _$$UnknownErrorPCopyWith(
          _$UnknownErrorP value, $Res Function(_$UnknownErrorP) then) =
      __$$UnknownErrorPCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownErrorPCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$UnknownErrorP>
    implements _$$UnknownErrorPCopyWith<$Res> {
  __$$UnknownErrorPCopyWithImpl(
      _$UnknownErrorP _value, $Res Function(_$UnknownErrorP) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'UnknownError')
class _$UnknownErrorP implements UnknownErrorP {
  const _$UnknownErrorP();

  @override
  String toString() {
    return 'PasswordInvalidationDescription.unknownErrorP()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownErrorP);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return unknownErrorP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return unknownErrorP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (unknownErrorP != null) {
      return unknownErrorP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return unknownErrorP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return unknownErrorP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (unknownErrorP != null) {
      return unknownErrorP(this);
    }
    return orElse();
  }
}

abstract class UnknownErrorP implements PasswordInvalidationDescription {
  const factory UnknownErrorP() = _$UnknownErrorP;
}

/// @nodoc
abstract class _$$InsecureCopyWith<$Res> {
  factory _$$InsecureCopyWith(
          _$Insecure value, $Res Function(_$Insecure) then) =
      __$$InsecureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InsecureCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$Insecure>
    implements _$$InsecureCopyWith<$Res> {
  __$$InsecureCopyWithImpl(_$Insecure _value, $Res Function(_$Insecure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Insecure implements Insecure {
  const _$Insecure();

  @override
  String toString() {
    return 'PasswordInvalidationDescription.insecure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Insecure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return insecure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return insecure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (insecure != null) {
      return insecure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return insecure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return insecure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (insecure != null) {
      return insecure(this);
    }
    return orElse();
  }
}

abstract class Insecure implements PasswordInvalidationDescription {
  const factory Insecure() = _$Insecure;
}

/// @nodoc
abstract class _$$NoConfirmationCopyWith<$Res> {
  factory _$$NoConfirmationCopyWith(
          _$NoConfirmation value, $Res Function(_$NoConfirmation) then) =
      __$$NoConfirmationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConfirmationCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res,
        _$NoConfirmation> implements _$$NoConfirmationCopyWith<$Res> {
  __$$NoConfirmationCopyWithImpl(
      _$NoConfirmation _value, $Res Function(_$NoConfirmation) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConfirmation implements NoConfirmation {
  const _$NoConfirmation();

  @override
  String toString() {
    return 'PasswordInvalidationDescription.noConfirmation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConfirmation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return noConfirmation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return noConfirmation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (noConfirmation != null) {
      return noConfirmation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return noConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return noConfirmation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (noConfirmation != null) {
      return noConfirmation(this);
    }
    return orElse();
  }
}

abstract class NoConfirmation implements PasswordInvalidationDescription {
  const factory NoConfirmation() = _$NoConfirmation;
}

/// @nodoc
abstract class _$$UnconfirmedCopyWith<$Res> {
  factory _$$UnconfirmedCopyWith(
          _$Unconfirmed value, $Res Function(_$Unconfirmed) then) =
      __$$UnconfirmedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnconfirmedCopyWithImpl<$Res>
    extends _$PasswordInvalidationDescriptionCopyWithImpl<$Res, _$Unconfirmed>
    implements _$$UnconfirmedCopyWith<$Res> {
  __$$UnconfirmedCopyWithImpl(
      _$Unconfirmed _value, $Res Function(_$Unconfirmed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unconfirmed implements Unconfirmed {
  const _$Unconfirmed();

  @override
  String toString() {
    return 'PasswordInvalidationDescription.unconfirmed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unconfirmed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String characters) filteredCharacters,
    required TResult Function(String character) firstCharacter,
    required TResult Function(String character) lastCharacter,
    required TResult Function(int passwordLength, int limit) minLength,
    required TResult Function(int passwordLength, int limit) maxLength,
    required TResult Function() decodeErrorP,
    required TResult Function() unknownErrorP,
    required TResult Function() insecure,
    required TResult Function() noConfirmation,
    required TResult Function() unconfirmed,
  }) {
    return unconfirmed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String characters)? filteredCharacters,
    TResult? Function(String character)? firstCharacter,
    TResult? Function(String character)? lastCharacter,
    TResult? Function(int passwordLength, int limit)? minLength,
    TResult? Function(int passwordLength, int limit)? maxLength,
    TResult? Function()? decodeErrorP,
    TResult? Function()? unknownErrorP,
    TResult? Function()? insecure,
    TResult? Function()? noConfirmation,
    TResult? Function()? unconfirmed,
  }) {
    return unconfirmed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String characters)? filteredCharacters,
    TResult Function(String character)? firstCharacter,
    TResult Function(String character)? lastCharacter,
    TResult Function(int passwordLength, int limit)? minLength,
    TResult Function(int passwordLength, int limit)? maxLength,
    TResult Function()? decodeErrorP,
    TResult Function()? unknownErrorP,
    TResult Function()? insecure,
    TResult Function()? noConfirmation,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    if (unconfirmed != null) {
      return unconfirmed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilteredCharactersP value) filteredCharacters,
    required TResult Function(FirstCharacterP value) firstCharacter,
    required TResult Function(LastCharacterP value) lastCharacter,
    required TResult Function(MinLengthP value) minLength,
    required TResult Function(MaxLengthP value) maxLength,
    required TResult Function(DecodeErrorP value) decodeErrorP,
    required TResult Function(UnknownErrorP value) unknownErrorP,
    required TResult Function(Insecure value) insecure,
    required TResult Function(NoConfirmation value) noConfirmation,
    required TResult Function(Unconfirmed value) unconfirmed,
  }) {
    return unconfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilteredCharactersP value)? filteredCharacters,
    TResult? Function(FirstCharacterP value)? firstCharacter,
    TResult? Function(LastCharacterP value)? lastCharacter,
    TResult? Function(MinLengthP value)? minLength,
    TResult? Function(MaxLengthP value)? maxLength,
    TResult? Function(DecodeErrorP value)? decodeErrorP,
    TResult? Function(UnknownErrorP value)? unknownErrorP,
    TResult? Function(Insecure value)? insecure,
    TResult? Function(NoConfirmation value)? noConfirmation,
    TResult? Function(Unconfirmed value)? unconfirmed,
  }) {
    return unconfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilteredCharactersP value)? filteredCharacters,
    TResult Function(FirstCharacterP value)? firstCharacter,
    TResult Function(LastCharacterP value)? lastCharacter,
    TResult Function(MinLengthP value)? minLength,
    TResult Function(MaxLengthP value)? maxLength,
    TResult Function(DecodeErrorP value)? decodeErrorP,
    TResult Function(UnknownErrorP value)? unknownErrorP,
    TResult Function(Insecure value)? insecure,
    TResult Function(NoConfirmation value)? noConfirmation,
    TResult Function(Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    if (unconfirmed != null) {
      return unconfirmed(this);
    }
    return orElse();
  }
}

abstract class Unconfirmed implements PasswordInvalidationDescription {
  const factory Unconfirmed() = _$Unconfirmed;
}
