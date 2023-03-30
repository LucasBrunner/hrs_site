// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFailureCopyWith<$Res> {
  factory $SignupFailureCopyWith(
          SignupFailure value, $Res Function(SignupFailure) then) =
      _$SignupFailureCopyWithImpl<$Res, SignupFailure>;
}

/// @nodoc
class _$SignupFailureCopyWithImpl<$Res, $Val extends SignupFailure>
    implements $SignupFailureCopyWith<$Res> {
  _$SignupFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InvalidPasswordCopyWith<$Res> {
  factory _$$_InvalidPasswordCopyWith(
          _$_InvalidPassword value, $Res Function(_$_InvalidPassword) then) =
      __$$_InvalidPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({PasswordInvalidationDescription passwordInvalidationDescription});

  $PasswordInvalidationDescriptionCopyWith<$Res>
      get passwordInvalidationDescription;
}

/// @nodoc
class __$$_InvalidPasswordCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_InvalidPassword>
    implements _$$_InvalidPasswordCopyWith<$Res> {
  __$$_InvalidPasswordCopyWithImpl(
      _$_InvalidPassword _value, $Res Function(_$_InvalidPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordInvalidationDescription = null,
  }) {
    return _then(_$_InvalidPassword(
      null == passwordInvalidationDescription
          ? _value.passwordInvalidationDescription
          : passwordInvalidationDescription // ignore: cast_nullable_to_non_nullable
              as PasswordInvalidationDescription,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PasswordInvalidationDescriptionCopyWith<$Res>
      get passwordInvalidationDescription {
    return $PasswordInvalidationDescriptionCopyWith<$Res>(
        _value.passwordInvalidationDescription, (value) {
      return _then(_value.copyWith(passwordInvalidationDescription: value));
    });
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'InvalidPassword')
class _$_InvalidPassword implements _InvalidPassword {
  const _$_InvalidPassword(this.passwordInvalidationDescription);

  @override
  final PasswordInvalidationDescription passwordInvalidationDescription;

  @override
  String toString() {
    return 'SignupFailure.invalidPassword(passwordInvalidationDescription: $passwordInvalidationDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidPassword &&
            (identical(other.passwordInvalidationDescription,
                    passwordInvalidationDescription) ||
                other.passwordInvalidationDescription ==
                    passwordInvalidationDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordInvalidationDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidPasswordCopyWith<_$_InvalidPassword> get copyWith =>
      __$$_InvalidPasswordCopyWithImpl<_$_InvalidPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return invalidPassword(passwordInvalidationDescription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return invalidPassword?.call(passwordInvalidationDescription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(passwordInvalidationDescription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class _InvalidPassword implements SignupFailure {
  const factory _InvalidPassword(
      final PasswordInvalidationDescription
          passwordInvalidationDescription) = _$_InvalidPassword;

  PasswordInvalidationDescription get passwordInvalidationDescription;
  @JsonKey(ignore: true)
  _$$_InvalidPasswordCopyWith<_$_InvalidPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidUsernameCopyWith<$Res> {
  factory _$$_InvalidUsernameCopyWith(
          _$_InvalidUsername value, $Res Function(_$_InvalidUsername) then) =
      __$$_InvalidUsernameCopyWithImpl<$Res>;
  @useResult
  $Res call({UsernameInvalidationDescription usernameInvalidationDescription});

  $UsernameInvalidationDescriptionCopyWith<$Res>
      get usernameInvalidationDescription;
}

/// @nodoc
class __$$_InvalidUsernameCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_InvalidUsername>
    implements _$$_InvalidUsernameCopyWith<$Res> {
  __$$_InvalidUsernameCopyWithImpl(
      _$_InvalidUsername _value, $Res Function(_$_InvalidUsername) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInvalidationDescription = null,
  }) {
    return _then(_$_InvalidUsername(
      null == usernameInvalidationDescription
          ? _value.usernameInvalidationDescription
          : usernameInvalidationDescription // ignore: cast_nullable_to_non_nullable
              as UsernameInvalidationDescription,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UsernameInvalidationDescriptionCopyWith<$Res>
      get usernameInvalidationDescription {
    return $UsernameInvalidationDescriptionCopyWith<$Res>(
        _value.usernameInvalidationDescription, (value) {
      return _then(_value.copyWith(usernameInvalidationDescription: value));
    });
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'InvalidUsername')
class _$_InvalidUsername implements _InvalidUsername {
  const _$_InvalidUsername(this.usernameInvalidationDescription);

  @override
  final UsernameInvalidationDescription usernameInvalidationDescription;

  @override
  String toString() {
    return 'SignupFailure.invalidUsername(usernameInvalidationDescription: $usernameInvalidationDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidUsername &&
            (identical(other.usernameInvalidationDescription,
                    usernameInvalidationDescription) ||
                other.usernameInvalidationDescription ==
                    usernameInvalidationDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameInvalidationDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidUsernameCopyWith<_$_InvalidUsername> get copyWith =>
      __$$_InvalidUsernameCopyWithImpl<_$_InvalidUsername>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return invalidUsername(usernameInvalidationDescription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return invalidUsername?.call(usernameInvalidationDescription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (invalidUsername != null) {
      return invalidUsername(usernameInvalidationDescription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return invalidUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return invalidUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidUsername != null) {
      return invalidUsername(this);
    }
    return orElse();
  }
}

abstract class _InvalidUsername implements SignupFailure {
  const factory _InvalidUsername(
      final UsernameInvalidationDescription
          usernameInvalidationDescription) = _$_InvalidUsername;

  UsernameInvalidationDescription get usernameInvalidationDescription;
  @JsonKey(ignore: true)
  _$$_InvalidUsernameCopyWith<_$_InvalidUsername> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidEmailCopyWith<$Res> {
  factory _$$_InvalidEmailCopyWith(
          _$_InvalidEmail value, $Res Function(_$_InvalidEmail) then) =
      __$$_InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidEmailCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_InvalidEmail>
    implements _$$_InvalidEmailCopyWith<$Res> {
  __$$_InvalidEmailCopyWithImpl(
      _$_InvalidEmail _value, $Res Function(_$_InvalidEmail) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'InvalidEmail')
class _$_InvalidEmail implements _InvalidEmail {
  const _$_InvalidEmail();

  @override
  String toString() {
    return 'SignupFailure.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail implements SignupFailure {
  const factory _InvalidEmail() = _$_InvalidEmail;
}

/// @nodoc
abstract class _$$_DecodeErrorCopyWith<$Res> {
  factory _$$_DecodeErrorCopyWith(
          _$_DecodeError value, $Res Function(_$_DecodeError) then) =
      __$$_DecodeErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DecodeErrorCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_DecodeError>
    implements _$$_DecodeErrorCopyWith<$Res> {
  __$$_DecodeErrorCopyWithImpl(
      _$_DecodeError _value, $Res Function(_$_DecodeError) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'DecodeError')
class _$_DecodeError implements _DecodeError {
  const _$_DecodeError();

  @override
  String toString() {
    return 'SignupFailure.decodeError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DecodeError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return decodeError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return decodeError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (decodeError != null) {
      return decodeError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return decodeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return decodeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (decodeError != null) {
      return decodeError(this);
    }
    return orElse();
  }
}

abstract class _DecodeError implements SignupFailure {
  const factory _DecodeError() = _$_DecodeError;
}

/// @nodoc
abstract class _$$_EmailAlreadyUsedCopyWith<$Res> {
  factory _$$_EmailAlreadyUsedCopyWith(
          _$_EmailAlreadyUsed value, $Res Function(_$_EmailAlreadyUsed) then) =
      __$$_EmailAlreadyUsedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailAlreadyUsedCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_EmailAlreadyUsed>
    implements _$$_EmailAlreadyUsedCopyWith<$Res> {
  __$$_EmailAlreadyUsedCopyWithImpl(
      _$_EmailAlreadyUsed _value, $Res Function(_$_EmailAlreadyUsed) _then)
      : super(_value, _then);
}

/// @nodoc

@MappableClass(discriminatorValue: 'EmailAlreadyUsed')
class _$_EmailAlreadyUsed implements _EmailAlreadyUsed {
  const _$_EmailAlreadyUsed();

  @override
  String toString() {
    return 'SignupFailure.emailAlreadyUsed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmailAlreadyUsed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return emailAlreadyUsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return emailAlreadyUsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyUsed != null) {
      return emailAlreadyUsed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return emailAlreadyUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return emailAlreadyUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (emailAlreadyUsed != null) {
      return emailAlreadyUsed(this);
    }
    return orElse();
  }
}

abstract class _EmailAlreadyUsed implements SignupFailure {
  const factory _EmailAlreadyUsed() = _$_EmailAlreadyUsed;
}

/// @nodoc
abstract class _$$_UnknownErrorCopyWith<$Res> {
  factory _$$_UnknownErrorCopyWith(
          _$_UnknownError value, $Res Function(_$_UnknownError) then) =
      __$$_UnknownErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnknownErrorCopyWithImpl<$Res>
    extends _$SignupFailureCopyWithImpl<$Res, _$_UnknownError>
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
    return 'SignupFailure.unknownError()';
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
    required TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)
        invalidPassword,
    required TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)
        invalidUsername,
    required TResult Function() invalidEmail,
    required TResult Function() decodeError,
    required TResult Function() emailAlreadyUsed,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult? Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult? Function()? invalidEmail,
    TResult? Function()? decodeError,
    TResult? Function()? emailAlreadyUsed,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PasswordInvalidationDescription passwordInvalidationDescription)?
        invalidPassword,
    TResult Function(
            UsernameInvalidationDescription usernameInvalidationDescription)?
        invalidUsername,
    TResult Function()? invalidEmail,
    TResult Function()? decodeError,
    TResult Function()? emailAlreadyUsed,
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
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_InvalidUsername value) invalidUsername,
    required TResult Function(_InvalidEmail value) invalidEmail,
    required TResult Function(_DecodeError value) decodeError,
    required TResult Function(_EmailAlreadyUsed value) emailAlreadyUsed,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_InvalidUsername value)? invalidUsername,
    TResult? Function(_InvalidEmail value)? invalidEmail,
    TResult? Function(_DecodeError value)? decodeError,
    TResult? Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_InvalidUsername value)? invalidUsername,
    TResult Function(_InvalidEmail value)? invalidEmail,
    TResult Function(_DecodeError value)? decodeError,
    TResult Function(_EmailAlreadyUsed value)? emailAlreadyUsed,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError implements SignupFailure {
  const factory _UnknownError() = _$_UnknownError;
}

/// @nodoc
mixin _$SignupResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'nextPath') String nextPath)
        ok,
    required TResult Function(List<SignupFailure> signupFailure) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult? Function(List<SignupFailure> signupFailure)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult Function(List<SignupFailure> signupFailure)? err,
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
abstract class $SignupResultCopyWith<$Res> {
  factory $SignupResultCopyWith(
          SignupResult value, $Res Function(SignupResult) then) =
      _$SignupResultCopyWithImpl<$Res, SignupResult>;
}

/// @nodoc
class _$SignupResultCopyWithImpl<$Res, $Val extends SignupResult>
    implements $SignupResultCopyWith<$Res> {
  _$SignupResultCopyWithImpl(this._value, this._then);

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
  $Res call({@MappableField(key: 'nextPath') String nextPath});
}

/// @nodoc
class __$$_OkCopyWithImpl<$Res> extends _$SignupResultCopyWithImpl<$Res, _$_Ok>
    implements _$$_OkCopyWith<$Res> {
  __$$_OkCopyWithImpl(_$_Ok _value, $Res Function(_$_Ok) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPath = null,
  }) {
    return _then(_$_Ok(
      null == nextPath
          ? _value.nextPath
          : nextPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Ok')
class _$_Ok implements _Ok {
  const _$_Ok(@MappableField(key: 'nextPath') this.nextPath);

  @override
  @MappableField(key: 'nextPath')
  final String nextPath;

  @override
  String toString() {
    return 'SignupResult.ok(nextPath: $nextPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ok &&
            (identical(other.nextPath, nextPath) ||
                other.nextPath == nextPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nextPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OkCopyWith<_$_Ok> get copyWith =>
      __$$_OkCopyWithImpl<_$_Ok>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'nextPath') String nextPath)
        ok,
    required TResult Function(List<SignupFailure> signupFailure) err,
  }) {
    return ok(nextPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult? Function(List<SignupFailure> signupFailure)? err,
  }) {
    return ok?.call(nextPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult Function(List<SignupFailure> signupFailure)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(nextPath);
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

abstract class _Ok implements SignupResult {
  const factory _Ok(@MappableField(key: 'nextPath') final String nextPath) =
      _$_Ok;

  @MappableField(key: 'nextPath')
  String get nextPath;
  @JsonKey(ignore: true)
  _$$_OkCopyWith<_$_Ok> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrCopyWith<$Res> {
  factory _$$_ErrCopyWith(_$_Err value, $Res Function(_$_Err) then) =
      __$$_ErrCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SignupFailure> signupFailure});
}

/// @nodoc
class __$$_ErrCopyWithImpl<$Res>
    extends _$SignupResultCopyWithImpl<$Res, _$_Err>
    implements _$$_ErrCopyWith<$Res> {
  __$$_ErrCopyWithImpl(_$_Err _value, $Res Function(_$_Err) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupFailure = null,
  }) {
    return _then(_$_Err(
      null == signupFailure
          ? _value._signupFailure
          : signupFailure // ignore: cast_nullable_to_non_nullable
              as List<SignupFailure>,
    ));
  }
}

/// @nodoc

@MappableClass(discriminatorValue: 'Err')
class _$_Err implements _Err {
  const _$_Err(final List<SignupFailure> signupFailure)
      : _signupFailure = signupFailure;

  final List<SignupFailure> _signupFailure;
  @override
  List<SignupFailure> get signupFailure {
    if (_signupFailure is EqualUnmodifiableListView) return _signupFailure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signupFailure);
  }

  @override
  String toString() {
    return 'SignupResult.err(signupFailure: $signupFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Err &&
            const DeepCollectionEquality()
                .equals(other._signupFailure, _signupFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_signupFailure));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrCopyWith<_$_Err> get copyWith =>
      __$$_ErrCopyWithImpl<_$_Err>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@MappableField(key: 'nextPath') String nextPath)
        ok,
    required TResult Function(List<SignupFailure> signupFailure) err,
  }) {
    return err(signupFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult? Function(List<SignupFailure> signupFailure)? err,
  }) {
    return err?.call(signupFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@MappableField(key: 'nextPath') String nextPath)? ok,
    TResult Function(List<SignupFailure> signupFailure)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(signupFailure);
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

abstract class _Err implements SignupResult {
  const factory _Err(final List<SignupFailure> signupFailure) = _$_Err;

  List<SignupFailure> get signupFailure;
  @JsonKey(ignore: true)
  _$$_ErrCopyWith<_$_Err> get copyWith => throw _privateConstructorUsedError;
}
