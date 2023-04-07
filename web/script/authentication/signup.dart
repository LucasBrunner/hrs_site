import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:http/http.dart' as http;
import '../html_utility.dart';
import 'password.dart';
import 'username.dart';

part 'signup.freezed.dart';
part 'signup.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'Type')
class SignupFailure with _$SignupFailure {
  @MappableClass(discriminatorValue: 'InvalidPassword')
  const factory SignupFailure.invalidPassword(PasswordInvalidationDescription passwordInvalidationDescription) = _InvalidPassword;
  @MappableClass(discriminatorValue: 'InvalidUsername')
  const factory SignupFailure.invalidUsername(UsernameInvalidationDescription usernameInvalidationDescription) = _InvalidUsername;
  @MappableClass(discriminatorValue: 'InvalidEmail')
  const factory SignupFailure.invalidEmail() = _InvalidEmail;
  @MappableClass(discriminatorValue: 'DecodeError')
  const factory SignupFailure.decodeError() = _DecodeError;
  @MappableClass(discriminatorValue: 'EmailAlreadyUsed')
  const factory SignupFailure.emailAlreadyUsed() = _EmailAlreadyUsed;
  @MappableClass(discriminatorValue: 'UnknownError')
  const factory SignupFailure.unknownError() = _UnknownError;
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class SignupResult with _$SignupResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory SignupResult.ok(@MappableField(key: 'nextPath') String nextPath) = _Ok;
  @MappableClass(discriminatorValue: 'Err')
  const factory SignupResult.err(List<SignupFailure> signupFailure) = _Err;
}

@MappableClass()
class SignupRequest with SignupRequestMappable {
  String email;
  String preferredName;
  String legalName;
  String encodedPassword;
  bool rememberLogin;

  SignupRequest(
    this.email,
    this.preferredName,
    this.legalName,
    this.encodedPassword,
    this.rememberLogin,
  );
}

void submit() async {
  final email = querySelector('#email-input')?.toElement<InputElement>()?.value;
  final preferredName = querySelector('#preferred-name-input')?.toElement<InputElement>()?.value;
  final legalName = querySelector('#legal-name-input')?.toElement<InputElement>()?.value;
  final password = querySelector('#password-input')?.toElement<InputElement>()?.value;
  final rememberMe = querySelector('#remember-login-input')?.toElement<InputElement>()?.checked;
  if (email == null || preferredName == null || legalName == null || password == null || rememberMe == null) {
    print('null values');
    return;
  }

  final signinRequest = SignupRequest(
    email,
    preferredName,
    legalName,
    Uri.encodeComponent(password),
    rememberMe,
  );
  print(signinRequest.toJson());

  final response = await http.post(
    Uri.http(window.location.host, '/signup'),
    body: signinRequest.toJson(),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
  );

  print(response.body);
  final signupResult = SignupResultMapper.fromJson(response.body);

  signupResult.when(
    ok: (nextPath) => window.location.pathname = nextPath,
    err: (failureType) => {},
  );
}

void setup() {
  querySelector('#submit-login')?.toElement<ButtonElement>()?.onClick.listen((event) => submit());
}
