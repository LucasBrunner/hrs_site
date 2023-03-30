import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'username.freezed.dart';
part 'username.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'Type')
class UsernameInvalidationDescription with _$UsernameInvalidationDescription {
  @MappableClass(discriminatorValue: 'FilteredCharacters')
  const factory UsernameInvalidationDescription.filteredCharacters(String characters) = _FilteredCharacters;
  @MappableClass(discriminatorValue: 'FirstCharacter')
  const factory UsernameInvalidationDescription.firstCharacter(String character) = _FirstCharacter;
  @MappableClass(discriminatorValue: 'LastCharacter')
  const factory UsernameInvalidationDescription.lastCharacter(String character) = _LastCharacter;
  @MappableClass(discriminatorValue: 'MinLength')
  const factory UsernameInvalidationDescription.minLength(int usernameLength, int limit) = _MinLength;
  @MappableClass(discriminatorValue: 'MaxLength')
  const factory UsernameInvalidationDescription.maxLength(int usernameLength, int limit) = _MaxLength;
  @MappableClass(discriminatorValue: 'UnknownError')
  const factory UsernameInvalidationDescription.unknownError() = _UnknownError;
}
