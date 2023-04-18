// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'password.dart';

class PasswordInvalidationDescriptionMapper
    extends ClassMapperBase<PasswordInvalidationDescription> {
  PasswordInvalidationDescriptionMapper._();
  static PasswordInvalidationDescriptionMapper? _instance;
  static PasswordInvalidationDescriptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PasswordInvalidationDescriptionMapper._());
      FilteredCharactersPMapper.ensureInitialized();
      FirstCharacterPMapper.ensureInitialized();
      LastCharacterPMapper.ensureInitialized();
      MinLengthPMapper.ensureInitialized();
      MaxLengthPMapper.ensureInitialized();
      DecodeErrorPMapper.ensureInitialized();
      UnknownErrorPMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PasswordInvalidationDescription';

  @override
  final Map<Symbol, Field<PasswordInvalidationDescription, dynamic>> fields =
      const {};

  static PasswordInvalidationDescription _instantiate(DecodingData data) {
    return PasswordInvalidationDescription.insecure();
  }

  @override
  final Function instantiate = _instantiate;

  static PasswordInvalidationDescription fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PasswordInvalidationDescription>(map));
  }

  static PasswordInvalidationDescription fromJson(String json) {
    return _guard((c) => c.fromJson<PasswordInvalidationDescription>(json));
  }
}

extension PasswordInvalidationDescriptionMapperExtension
    on PasswordInvalidationDescription {
  String toJson() {
    return PasswordInvalidationDescriptionMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return PasswordInvalidationDescriptionMapper._guard((c) => c.toMap(this));
  }

  PasswordInvalidationDescriptionCopyWith<PasswordInvalidationDescription,
          PasswordInvalidationDescription, PasswordInvalidationDescription>
      get copyWith => _PasswordInvalidationDescriptionCopyWithImpl(
          this, $identity, $identity);
}

extension PasswordInvalidationDescriptionValueCopy<$R,
        $Out extends PasswordInvalidationDescription>
    on ObjectCopyWith<$R, PasswordInvalidationDescription, $Out> {
  PasswordInvalidationDescriptionCopyWith<$R, PasswordInvalidationDescription,
          $Out>
      get $asPasswordInvalidationDescription => $base.as(
          (v, t, t2) => _PasswordInvalidationDescriptionCopyWithImpl(v, t, t2));
}

typedef PasswordInvalidationDescriptionCopyWithBound
    = PasswordInvalidationDescription;

abstract class PasswordInvalidationDescriptionCopyWith<
        $R,
        $In extends PasswordInvalidationDescription,
        $Out extends PasswordInvalidationDescription>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  PasswordInvalidationDescriptionCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends PasswordInvalidationDescription>(
          Then<PasswordInvalidationDescription, $Out2> t, Then<$Out2, $R2> t2);
}

class _PasswordInvalidationDescriptionCopyWithImpl<$R,
        $Out extends PasswordInvalidationDescription>
    extends ClassCopyWithBase<$R, PasswordInvalidationDescription, $Out>
    implements
        PasswordInvalidationDescriptionCopyWith<$R,
            PasswordInvalidationDescription, $Out> {
  _PasswordInvalidationDescriptionCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PasswordInvalidationDescription> $mapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  PasswordInvalidationDescription $make(CopyWithData data) =>
      PasswordInvalidationDescription.insecure();

  @override
  PasswordInvalidationDescriptionCopyWith<$R2, PasswordInvalidationDescription,
      $Out2> $chain<$R2, $Out2 extends PasswordInvalidationDescription>(
          Then<PasswordInvalidationDescription, $Out2> t,
          Then<$Out2, $R2> t2) =>
      _PasswordInvalidationDescriptionCopyWithImpl($value, t, t2);
}

class FilteredCharactersPMapper
    extends SubClassMapperBase<FilteredCharactersP> {
  FilteredCharactersPMapper._();
  static FilteredCharactersPMapper? _instance;
  static FilteredCharactersPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilteredCharactersPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FilteredCharactersP';

  static String _$characters(FilteredCharactersP v) => v.characters;
  static const Field<FilteredCharactersP, String> _f$characters =
      Field('characters', _$characters);

  @override
  final Map<Symbol, Field<FilteredCharactersP, dynamic>> fields = const {
    #characters: _f$characters,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'FilteredCharacters';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static FilteredCharactersP _instantiate(DecodingData data) {
    return FilteredCharactersP(data.dec(_f$characters));
  }

  @override
  final Function instantiate = _instantiate;

  static FilteredCharactersP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FilteredCharactersP>(map));
  }

  static FilteredCharactersP fromJson(String json) {
    return _guard((c) => c.fromJson<FilteredCharactersP>(json));
  }
}

extension FilteredCharactersPMapperExtension on FilteredCharactersP {
  String toJson() {
    return FilteredCharactersPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return FilteredCharactersPMapper._guard((c) => c.toMap(this));
  }
}

class FirstCharacterPMapper extends SubClassMapperBase<FirstCharacterP> {
  FirstCharacterPMapper._();
  static FirstCharacterPMapper? _instance;
  static FirstCharacterPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FirstCharacterPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FirstCharacterP';

  static String _$character(FirstCharacterP v) => v.character;
  static const Field<FirstCharacterP, String> _f$character =
      Field('character', _$character);

  @override
  final Map<Symbol, Field<FirstCharacterP, dynamic>> fields = const {
    #character: _f$character,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'FirstCharacter';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static FirstCharacterP _instantiate(DecodingData data) {
    return FirstCharacterP(data.dec(_f$character));
  }

  @override
  final Function instantiate = _instantiate;

  static FirstCharacterP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FirstCharacterP>(map));
  }

  static FirstCharacterP fromJson(String json) {
    return _guard((c) => c.fromJson<FirstCharacterP>(json));
  }
}

extension FirstCharacterPMapperExtension on FirstCharacterP {
  String toJson() {
    return FirstCharacterPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return FirstCharacterPMapper._guard((c) => c.toMap(this));
  }
}

class LastCharacterPMapper extends SubClassMapperBase<LastCharacterP> {
  LastCharacterPMapper._();
  static LastCharacterPMapper? _instance;
  static LastCharacterPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LastCharacterPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'LastCharacterP';

  static String _$character(LastCharacterP v) => v.character;
  static const Field<LastCharacterP, String> _f$character =
      Field('character', _$character);

  @override
  final Map<Symbol, Field<LastCharacterP, dynamic>> fields = const {
    #character: _f$character,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'LastCharacter';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static LastCharacterP _instantiate(DecodingData data) {
    return LastCharacterP(data.dec(_f$character));
  }

  @override
  final Function instantiate = _instantiate;

  static LastCharacterP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<LastCharacterP>(map));
  }

  static LastCharacterP fromJson(String json) {
    return _guard((c) => c.fromJson<LastCharacterP>(json));
  }
}

extension LastCharacterPMapperExtension on LastCharacterP {
  String toJson() {
    return LastCharacterPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return LastCharacterPMapper._guard((c) => c.toMap(this));
  }
}

class MinLengthPMapper extends SubClassMapperBase<MinLengthP> {
  MinLengthPMapper._();
  static MinLengthPMapper? _instance;
  static MinLengthPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MinLengthPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'MinLengthP';

  static int _$passwordLength(MinLengthP v) => v.passwordLength;
  static const Field<MinLengthP, int> _f$passwordLength =
      Field('passwordLength', _$passwordLength);
  static int _$limit(MinLengthP v) => v.limit;
  static const Field<MinLengthP, int> _f$limit = Field('limit', _$limit);

  @override
  final Map<Symbol, Field<MinLengthP, dynamic>> fields = const {
    #passwordLength: _f$passwordLength,
    #limit: _f$limit,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'MinLength';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static MinLengthP _instantiate(DecodingData data) {
    return MinLengthP(data.dec(_f$passwordLength), data.dec(_f$limit));
  }

  @override
  final Function instantiate = _instantiate;

  static MinLengthP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<MinLengthP>(map));
  }

  static MinLengthP fromJson(String json) {
    return _guard((c) => c.fromJson<MinLengthP>(json));
  }
}

extension MinLengthPMapperExtension on MinLengthP {
  String toJson() {
    return MinLengthPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return MinLengthPMapper._guard((c) => c.toMap(this));
  }
}

class MaxLengthPMapper extends SubClassMapperBase<MaxLengthP> {
  MaxLengthPMapper._();
  static MaxLengthPMapper? _instance;
  static MaxLengthPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MaxLengthPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'MaxLengthP';

  static int _$passwordLength(MaxLengthP v) => v.passwordLength;
  static const Field<MaxLengthP, int> _f$passwordLength =
      Field('passwordLength', _$passwordLength);
  static int _$limit(MaxLengthP v) => v.limit;
  static const Field<MaxLengthP, int> _f$limit = Field('limit', _$limit);

  @override
  final Map<Symbol, Field<MaxLengthP, dynamic>> fields = const {
    #passwordLength: _f$passwordLength,
    #limit: _f$limit,
  };

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'MaxLength';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static MaxLengthP _instantiate(DecodingData data) {
    return MaxLengthP(data.dec(_f$passwordLength), data.dec(_f$limit));
  }

  @override
  final Function instantiate = _instantiate;

  static MaxLengthP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<MaxLengthP>(map));
  }

  static MaxLengthP fromJson(String json) {
    return _guard((c) => c.fromJson<MaxLengthP>(json));
  }
}

extension MaxLengthPMapperExtension on MaxLengthP {
  String toJson() {
    return MaxLengthPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return MaxLengthPMapper._guard((c) => c.toMap(this));
  }
}

class DecodeErrorPMapper extends SubClassMapperBase<DecodeErrorP> {
  DecodeErrorPMapper._();
  static DecodeErrorPMapper? _instance;
  static DecodeErrorPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DecodeErrorPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DecodeErrorP';

  @override
  final Map<Symbol, Field<DecodeErrorP, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'DecodeError';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static DecodeErrorP _instantiate(DecodingData data) {
    return DecodeErrorP();
  }

  @override
  final Function instantiate = _instantiate;

  static DecodeErrorP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DecodeErrorP>(map));
  }

  static DecodeErrorP fromJson(String json) {
    return _guard((c) => c.fromJson<DecodeErrorP>(json));
  }
}

extension DecodeErrorPMapperExtension on DecodeErrorP {
  String toJson() {
    return DecodeErrorPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return DecodeErrorPMapper._guard((c) => c.toMap(this));
  }
}

class UnknownErrorPMapper extends SubClassMapperBase<UnknownErrorP> {
  UnknownErrorPMapper._();
  static UnknownErrorPMapper? _instance;
  static UnknownErrorPMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnknownErrorPMapper._());
      PasswordInvalidationDescriptionMapper.ensureInitialized()
          .addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UnknownErrorP';

  @override
  final Map<Symbol, Field<UnknownErrorP, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'Type';
  @override
  final dynamic discriminatorValue = 'UnknownError';
  @override
  late final ClassMapperBase superMapper =
      PasswordInvalidationDescriptionMapper.ensureInitialized();

  static UnknownErrorP _instantiate(DecodingData data) {
    return UnknownErrorP();
  }

  @override
  final Function instantiate = _instantiate;

  static UnknownErrorP fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UnknownErrorP>(map));
  }

  static UnknownErrorP fromJson(String json) {
    return _guard((c) => c.fromJson<UnknownErrorP>(json));
  }
}

extension UnknownErrorPMapperExtension on UnknownErrorP {
  String toJson() {
    return UnknownErrorPMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return UnknownErrorPMapper._guard((c) => c.toMap(this));
  }
}
