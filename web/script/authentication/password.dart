import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';
part 'password.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'Type')
class PasswordInvalidationDescription with _$PasswordInvalidationDescription {
  @MappableClass(discriminatorValue: 'FilteredCharacters')
  const factory PasswordInvalidationDescription.filteredCharacters(String characters) = FilteredCharactersP;
  @MappableClass(discriminatorValue: 'FirstCharacter')
  const factory PasswordInvalidationDescription.firstCharacter(String character) = FirstCharacterP;
  @MappableClass(discriminatorValue: 'LastCharacter')
  const factory PasswordInvalidationDescription.lastCharacter(String character) = LastCharacterP;
  @MappableClass(discriminatorValue: 'MinLength')
  const factory PasswordInvalidationDescription.minLength(int passwordLength, int limit) = MinLengthP;
  @MappableClass(discriminatorValue: 'MaxLength')
  const factory PasswordInvalidationDescription.maxLength(int passwordLength, int limit) = MaxLengthP;
  @MappableClass(discriminatorValue: 'DecodeError')
  const factory PasswordInvalidationDescription.decodeErrorP() = DecodeErrorP;
  @MappableClass(discriminatorValue: 'UnknownError')
  const factory PasswordInvalidationDescription.unknownErrorP() = UnknownErrorP;
  const factory PasswordInvalidationDescription.insecure() = Insecure;
  const factory PasswordInvalidationDescription.noConfirmation() = NoConfirmation;
  const factory PasswordInvalidationDescription.unconfirmed() = Unconfirmed;
}
