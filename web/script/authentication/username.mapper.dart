// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'username.dart';

class UsernameInvalidationDescriptionMapper
    extends ClassMapperBase<UsernameInvalidationDescription> {
  UsernameInvalidationDescriptionMapper._();
  static UsernameInvalidationDescriptionMapper? _instance;
  static UsernameInvalidationDescriptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UsernameInvalidationDescriptionMapper._());
      _FilteredCharactersMapper.ensureInitialized();
      _FirstCharacterMapper.ensureInitialized();
      _LastCharacterMapper.ensureInitialized();
      _MinLengthMapper.ensureInitialized();
      _MaxLengthMapper.ensureInitialized();
      _UnknownErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UsernameInvalidationDescription';

  @override
  final Map<Symbol, Field<UsernameInvalidationDescription, dynamic>> fields =
      const {};

  static UsernameInvalidationDescription _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'UsernameInvalidationDescription', 'Type', '${data.value['Type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static UsernameInvalidationDescription fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UsernameInvalidationDescription>(map));
  }

  static UsernameInvalidationDescription fromJson(String json) {
    return _guard((c) => c.fromJson<UsernameInvalidationDescription>(json));
  }
}

extension UsernameInvalidationDescriptionMapperExtension
    on UsernameInvalidationDescription {
  String toJson() {
    return UsernameInvalidationDescriptionMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return UsernameInvalidationDescriptionMapper._guard((c) => c.toMap(this));
  }
}

typedef UsernameInvalidationDescriptionCopyWithBound
    = UsernameInvalidationDescription;

abstract class UsernameInvalidationDescriptionCopyWith<
        $R,
        $In extends UsernameInvalidationDescription,
        $Out extends UsernameInvalidationDescription>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  UsernameInvalidationDescriptionCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends UsernameInvalidationDescription>(
          Then<UsernameInvalidationDescription, $Out2> t, Then<$Out2, $R2> t2);
}

class _FilteredCharactersMapper
    extends SubClassMapperBase<_FilteredCharacters> {
  _FilteredCharactersMapper._();
  static _FilteredCharactersMapper? _instance;
  static _FilteredCharactersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _FilteredCharactersMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_FilteredCharacters';

  static String _$characters(_FilteredCharacters v) => v.characters;

  @override
  final Map<Symbol, Field<_FilteredCharacters, dynamic>> fields = const {
    #characters: Field<_FilteredCharacters, String>('characters', _$characters),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'FilteredCharacters';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _FilteredCharacters _instantiate(DecodingData data) {
    return _FilteredCharacters(data.get(#characters));
  }

  @override
  final Function instantiate = _instantiate;

  static _FilteredCharacters fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_FilteredCharacters>(map));
  }

  static _FilteredCharacters fromJson(String json) {
    return _guard((c) => c.fromJson<_FilteredCharacters>(json));
  }
}

extension _FilteredCharactersMapperExtension on _FilteredCharacters {
  String toJson() {
    return _FilteredCharactersMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _FilteredCharactersMapper._guard((c) => c.toMap(this));
  }
}

class _FirstCharacterMapper extends SubClassMapperBase<_FirstCharacter> {
  _FirstCharacterMapper._();
  static _FirstCharacterMapper? _instance;
  static _FirstCharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _FirstCharacterMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_FirstCharacter';

  static String _$character(_FirstCharacter v) => v.character;

  @override
  final Map<Symbol, Field<_FirstCharacter, dynamic>> fields = const {
    #character: Field<_FirstCharacter, String>('character', _$character),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'FirstCharacter';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _FirstCharacter _instantiate(DecodingData data) {
    return _FirstCharacter(data.get(#character));
  }

  @override
  final Function instantiate = _instantiate;

  static _FirstCharacter fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_FirstCharacter>(map));
  }

  static _FirstCharacter fromJson(String json) {
    return _guard((c) => c.fromJson<_FirstCharacter>(json));
  }
}

extension _FirstCharacterMapperExtension on _FirstCharacter {
  String toJson() {
    return _FirstCharacterMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _FirstCharacterMapper._guard((c) => c.toMap(this));
  }
}

class _LastCharacterMapper extends SubClassMapperBase<_LastCharacter> {
  _LastCharacterMapper._();
  static _LastCharacterMapper? _instance;
  static _LastCharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _LastCharacterMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_LastCharacter';

  static String _$character(_LastCharacter v) => v.character;

  @override
  final Map<Symbol, Field<_LastCharacter, dynamic>> fields = const {
    #character: Field<_LastCharacter, String>('character', _$character),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'LastCharacter';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _LastCharacter _instantiate(DecodingData data) {
    return _LastCharacter(data.get(#character));
  }

  @override
  final Function instantiate = _instantiate;

  static _LastCharacter fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_LastCharacter>(map));
  }

  static _LastCharacter fromJson(String json) {
    return _guard((c) => c.fromJson<_LastCharacter>(json));
  }
}

extension _LastCharacterMapperExtension on _LastCharacter {
  String toJson() {
    return _LastCharacterMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _LastCharacterMapper._guard((c) => c.toMap(this));
  }
}

class _MinLengthMapper extends SubClassMapperBase<_MinLength> {
  _MinLengthMapper._();
  static _MinLengthMapper? _instance;
  static _MinLengthMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _MinLengthMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_MinLength';

  static int _$usernameLength(_MinLength v) => v.usernameLength;
  static int _$limit(_MinLength v) => v.limit;

  @override
  final Map<Symbol, Field<_MinLength, dynamic>> fields = const {
    #usernameLength: Field<_MinLength, int>('usernameLength', _$usernameLength),
    #limit: Field<_MinLength, int>('limit', _$limit),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'MinLength';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _MinLength _instantiate(DecodingData data) {
    return _MinLength(data.get(#usernameLength), data.get(#limit));
  }

  @override
  final Function instantiate = _instantiate;

  static _MinLength fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_MinLength>(map));
  }

  static _MinLength fromJson(String json) {
    return _guard((c) => c.fromJson<_MinLength>(json));
  }
}

extension _MinLengthMapperExtension on _MinLength {
  String toJson() {
    return _MinLengthMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _MinLengthMapper._guard((c) => c.toMap(this));
  }
}

class _MaxLengthMapper extends SubClassMapperBase<_MaxLength> {
  _MaxLengthMapper._();
  static _MaxLengthMapper? _instance;
  static _MaxLengthMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _MaxLengthMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_MaxLength';

  static int _$usernameLength(_MaxLength v) => v.usernameLength;
  static int _$limit(_MaxLength v) => v.limit;

  @override
  final Map<Symbol, Field<_MaxLength, dynamic>> fields = const {
    #usernameLength: Field<_MaxLength, int>('usernameLength', _$usernameLength),
    #limit: Field<_MaxLength, int>('limit', _$limit),
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'MaxLength';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _MaxLength _instantiate(DecodingData data) {
    return _MaxLength(data.get(#usernameLength), data.get(#limit));
  }

  @override
  final Function instantiate = _instantiate;

  static _MaxLength fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_MaxLength>(map));
  }

  static _MaxLength fromJson(String json) {
    return _guard((c) => c.fromJson<_MaxLength>(json));
  }
}

extension _MaxLengthMapperExtension on _MaxLength {
  String toJson() {
    return _MaxLengthMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _MaxLengthMapper._guard((c) => c.toMap(this));
  }
}

class _UnknownErrorMapper extends SubClassMapperBase<_UnknownError> {
  _UnknownErrorMapper._();
  static _UnknownErrorMapper? _instance;
  static _UnknownErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _UnknownErrorMapper._());
      UsernameInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = '_UnknownError';

  @override
  final Map<Symbol, Field<_UnknownError, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'UnknownError';
  @override
  late final ClassMapperBase superMapper =
      UsernameInvalidationDescriptionMapper.ensureInitialized();

  static _UnknownError _instantiate(DecodingData data) {
    return _UnknownError();
  }

  @override
  final Function instantiate = _instantiate;

  static _UnknownError fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<_UnknownError>(map));
  }

  static _UnknownError fromJson(String json) {
    return _guard((c) => c.fromJson<_UnknownError>(json));
  }
}

extension _UnknownErrorMapperExtension on _UnknownError {
  String toJson() {
    return _UnknownErrorMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return _UnknownErrorMapper._guard((c) => c.toMap(this));
  }
}
