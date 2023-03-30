import 'package:dart_mappable/dart_mappable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.mapper.dart';

@freezed
@MappableClass(discriminatorKey: 'Type')
class SessionError with _$SessionError {
  @MappableClass(discriminatorValue: 'NoCookie')
  const factory SessionError.noCookie() = _NoCookie;
  @MappableClass(discriminatorValue: 'InvalidCookie')
  const factory SessionError.invalidCookie() = _InvalidCookie;
  @MappableClass(discriminatorValue: 'Expired')
  const factory SessionError.expired() = _Expired;
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class DataError with _$DataError {
  @MappableClass(discriminatorValue: 'DatabaseFailure')
  const factory DataError.databaseFailure() = _DatabaseFailure;
  @MappableClass(discriminatorValue: 'SessionError')
  const factory DataError.sessionError(SessionError sessionError) = _SessionError;
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class StringOptionInternallyTagged with _$StringOptionInternallyTagged {
  @MappableClass(discriminatorValue: 'None')
  const factory StringOptionInternallyTagged.none() = _None;
  @MappableClass(discriminatorValue: 'Some')
  const factory StringOptionInternallyTagged.some(String data) = _Some;
}
