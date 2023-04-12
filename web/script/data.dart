import 'dart:html';

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
  const DataError._();

  @MappableClass(discriminatorValue: 'DatabaseFailure')
  const factory DataError.databaseFailure() = _DatabaseFailure;
  @MappableClass(discriminatorValue: 'SessionError')
  const factory DataError.sessionError(SessionError sessionError) = _SessionError;
  @MappableClass(discriminatorValue: 'ConnectionError')
  const factory DataError.badData() = _ConnectionError;

  String getErrorMessage() {
    return when(
      databaseFailure: () => 'Error: database failure',
      sessionError: (sessionError) => 'Error: session expired (log in again)',
      badData: () => "Error: bad data",
    );
  }
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class StringOptionInternallyTagged with _$StringOptionInternallyTagged {
  @MappableClass(discriminatorValue: 'None')
  const factory StringOptionInternallyTagged.none() = _StringNone;
  @MappableClass(discriminatorValue: 'Some')
  const factory StringOptionInternallyTagged.some(String data) = _StringSome;
}

@freezed
@MappableClass(discriminatorKey: 'Type')
class IntOptionInternallyTagged with _$StringOptionInternallyTagged {
  @MappableClass(discriminatorValue: 'None')
  const factory IntOptionInternallyTagged.none() = _IntNone;
  @MappableClass(discriminatorValue: 'Some')
  const factory IntOptionInternallyTagged.some(int data) = _IntSome;
}

extension AddEditButton on List<TableRowElement> {
  void addDeleteButton(String onDeleteMessage, void Function() onDelete) {
    add(TableRowElement()
      ..children.addAll([
        TableCellElement(),
        TableCellElement()
          ..children.add(ButtonElement()
            ..innerText = onDeleteMessage
            ..onClick.listen((event) {
              print(onDeleteMessage);
              onDelete.call();
            })),
      ]));
  }
}

abstract class ToOptionElement {
  OptionElement toOptionElement();
}

abstract class ToDisplayRow {
  DivElement toDisplayRow();
}

abstract class ToInputTable<T> {
  TableElement toInputTable(T options);
}
