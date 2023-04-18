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

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum UpdateTypeType {
  put(id: 1),
  delete(id: 2),
  ignore(id: 3);

  final int id;

  const UpdateTypeType({
    required this.id,
  });
}

@MappableClass(ignoreNull: true, generateMethods: GenerateMethods.encode)
class UpdateType<T> with UpdateTypeMappable {
  @MappableField(key: 'item')
  T? _item;
  @MappableField(key: 'id')
  int? _id;
  @MappableField(key: 'type')
  UpdateTypeType? updateType;

  UpdateType.put(this._item) {
    this.updateType = UpdateTypeType.put;
  }

  UpdateType.delete(this._id) {
    this.updateType = UpdateTypeType.delete;
  }

  UpdateType.ignore() {
    this.updateType = UpdateTypeType.ignore;
  }

  @MappableConstructor()
  UpdateType.serialize(this.updateType, this._id, this._item);

  U? when<U>({
    required U Function(T item) put,
    required U Function(int id) delete,
  }) {
    switch (updateType) {
      case UpdateTypeType.put:
        return put.call(_item!);
      case UpdateTypeType.delete:
        return delete.call(_id!);
      default:
        return null;
    }
  }
}

@MappableClass(ignoreNull: true)
class DataResult<T> with DataResultMappable {
  T? ok;
  DataError? err;

  DataResult.ok(this.ok);

  DataResult.err(this.err);

  U when<U>({
    required U Function(T ok) ok,
    required U Function(DataError err) err,
  }) {
    if (this.ok != null && this.err == null) {
      return ok.call(this.ok as T);
    } else if (this.ok == null && this.err != null) {
      return err.call(this.err!);
    } else {
      throw Exception("Invalid union state!");
    }
  }
}

@MappableClass(ignoreNull: true, generateMethods: GenerateMethods.decode)
class DataMaybeId<T> with DataMaybeIdMappable {
  T data;
  int? id;

  DataMaybeId.id(this.id, this.data);

  DataMaybeId.noId(this.data);

  U when<U>({
    required U Function(int id) id,
    required U Function() noId,
  }) {
    if (this.id == null) {
      return noId.call();
    } else {
      return id.call(this.id!);
    }
  }
}

@MappableClass()
class DataWithId<T> with DataMaybeIdMappable {
  T data;
  int id;

  DataWithId(this.id, this.data);

  DataMaybeId<T> toMaybeId() {
    return DataMaybeId.id(id, data);
  }
}

extension AddEditButton on List<TableRowElement> {
  void addDeleteButton(
    String buttonText,
    String onDeleteMessage,
    void Function() onDelete,
  ) {
    add(TableRowElement()
      ..children.addAll([
        TableCellElement(),
        TableCellElement()
          ..children.add(ButtonElement()
            ..innerText = buttonText
            ..onClick.listen((event) {
              print(onDeleteMessage);
              onDelete.call();
            })),
      ]));
  }
}

abstract class HttpGetRange<T> {
  T? httpGet(int fristIndex, int lastIndex);
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
