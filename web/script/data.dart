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
  const factory StringOptionInternallyTagged.none() = _StringNone;
  const factory StringOptionInternallyTagged.some(String data) = _StringSome;
}

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum OptionInternallyTaggedType {
  some,
  none,
}

@MappableClass(generateMethods: GenerateMethods.encode | GenerateMethods.decode)
class OptionInternallyTagged<T> with OptionInternallyTaggedMappable {
  @MappableField(key: 'data')
  T? _data;

  @MappableField(key: 'type')
  late final OptionInternallyTaggedType _updateType;

  OptionInternallyTagged.some(this._data) {
    _updateType = OptionInternallyTaggedType.none;
  }

  OptionInternallyTagged.none() {
    _updateType = OptionInternallyTaggedType.none;
  }

  @MappableConstructor()
  OptionInternallyTagged.map(this._data, this._updateType);

  U when<U>({
    required U Function(T data) some,
    required U Function() none,
  }) {
    switch (_updateType) {
      case OptionInternallyTaggedType.none:
        return none.call();
      case OptionInternallyTaggedType.some:
        return some.call(_data as T);
      default:
        throw Exception("Invalid union state!");
    }
  }
}

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum UpdateTypeType {
  put,
  delete,
  ignore,
}

@MappableClass(ignoreNull: true, generateMethods: GenerateMethods.encode)
class UpdateType<T> with UpdateTypeMappable {
  @MappableField(key: 'item')
  T? _item;
  @MappableField(key: 'id')
  int? _id;
  @MappableField(key: 'type')
  late final UpdateTypeType updateType;

  UpdateType.put(this._item) {
    updateType = UpdateTypeType.put;
  }

  UpdateType.delete(this._id) {
    updateType = UpdateTypeType.delete;
  }

  UpdateType.ignore() {
    updateType = UpdateTypeType.ignore;
  }

  @MappableConstructor()
  UpdateType.map(this.updateType, this._id, this._item);

  U when<U>({
    required U Function(T item) put,
    required U Function(int id) delete,
  }) {
    switch (updateType) {
      case UpdateTypeType.put:
        return put.call(_item as T);
      case UpdateTypeType.delete:
        return delete.call(_id!);
      default:
        throw Exception("Invalid union state!");
    }
  }
}

@MappableClass(generateMethods: GenerateMethods.decode | GenerateMethods.encode)
class ItemCount<T> with ItemCountMappable {
  T item;
  int count;

  ItemCount(
    this.item,
    this.count,
  );
}

extension ConvertItemCount<T> on List<ItemCount<T>> {
  Iterable<T> items() {
    return map((element) => element.item);
  }

  List<T> itemList() {
    return items().toList();
  }
}

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum DataResultType {
  ok,
  err,
}

@MappableClass(ignoreNull: true, generateMethods: GenerateMethods.decode | GenerateMethods.encode)
class DataResult<T> with DataResultMappable {
  T? ok;
  DataError? err;
  @MappableField(key: 'type')
  late final DataResultType _type;

  DataResult.ok(this.ok) {
    _type = DataResultType.ok;
  }

  DataResult.err(this.err) {
    _type = DataResultType.err;
  }

  @MappableConstructor()
  DataResult.map(this.err, this.ok, this._type);

  U when<U>({
    required U Function(T ok) ok,
    required U Function(DataError err) err,
  }) {
    switch (_type) {
      case DataResultType.ok:
        return ok.call(this.ok as T);
      case DataResultType.err:
        return err.call(this.err!);
      default:
        throw Exception("Invalid union state!");
    }
  }
}

@MappableEnum(caseStyle: CaseStyle.camelCase)
enum DataMaybeIdType {
  id,
  noId,
}

@MappableClass(ignoreNull: true, generateMethods: GenerateMethods.decode | GenerateMethods.encode)
class DataMaybeId<T> with DataMaybeIdMappable {
  T data;
  int? id;
  @MappableField(key: 'type')
  late final DataMaybeIdType _type;

  DataMaybeId.id(this.id, this.data) {
    _type = DataMaybeIdType.id;
  }

  DataMaybeId.noId(this.data) {
    _type = DataMaybeIdType.noId;
  }

  @MappableConstructor()
  DataMaybeId.map(this.data, this.id, this._type);

  U when<U>({
    required U Function(int id, T data) id,
    required U Function(T data) noId,
  }) {
    switch (_type) {
      case DataMaybeIdType.id:
        return id.call(this.id!, data);
      case DataMaybeIdType.noId:
        return noId.call(data);
      default:
        throw Exception("Invalid union state!");
    }
  }
}

@MappableClass()
class DataWithId<T> with DataWithIdMappable {
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

abstract class HasTitle {
  String title();
}

extension ToOptionElementE on DataWithId<HasTitle> {
  OptionElement toOptionElement() {
    return OptionElement()
      ..innerText = data.title()
      ..value = id.toString();
  }
}

abstract class ToDisplayRow {
  DivElement toDisplayRow();
}

abstract class ToInputTable<T> {
  TableElement toInputTable(T options);
}
