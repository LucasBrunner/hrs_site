import 'dart:html';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../html_utility.dart';

part 'signin.freezed.dart';
part 'signin.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'Type')
class SigninFailure with _$SigninFailure {
  @MappableClass(discriminatorValue: 'DecodeError')
  const factory SigninFailure.decodeError() = _DecodeError;
  @MappableClass(discriminatorValue: 'SigninFailure')
  const factory SigninFailure.general() = _General;
  @MappableClass(discriminatorValue: 'DatabaseError')
  const factory SigninFailure.databaseError() = _DatabaseError;
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class SigninResult with _$SigninResult {
  @MappableClass(discriminatorValue: 'Ok')
  const factory SigninResult.ok(@MappableField(key: 'nextPath') String nextPath) = SigninResult_Ok;
  @MappableClass(discriminatorValue: 'Err')
  const factory SigninResult.err(@MappableField(key: 'signinFailure') SigninFailure signinFailure) = _Err;
}

@MappableClass()
class SigninRequest with SigninRequestMappable {
  String email;
  String encodedPassword;
  bool rememberLogin;

  SigninRequest(
    this.email,
    this.encodedPassword,
    this.rememberLogin,
  );
}

void submit() async {
  final email = querySelector('#email-input')?.toElement<InputElement>()?.value;
  final password = querySelector('#password-input')?.toElement<InputElement>()?.value;
  if (email == null || email.isEmpty || password == null || password.isEmpty) {
    print('null values');
    return;
  }

  final signinRequest = SigninRequest(email, Uri.encodeComponent(password), false);
  print(signinRequest.toJson());

  final response = await http.post(
    Uri.http(window.location.host, '/signin'),
    body: signinRequest.toJson(),
    headers: {
      'Content-type': 'application/json',
    },
  );

  print(response.body);
  final signinResult = SigninResultMapper.fromJson(response.body);

  signinResult.when(
    ok: (nextPath) => window.location.pathname = nextPath,
    err: (failureType) => {},
  );
}

void setup() {
  querySelector('#submit-login')?.toElement<ButtonElement>()?.onClick.listen((event) => submit());
}
