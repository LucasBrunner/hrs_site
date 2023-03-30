import 'package:dart_mappable/dart_mappable.dart';

part 'phone.mapper.dart';

@MappableClass()
class PhoneType with PhoneTypeMappable {
  int id;
  String name;

  PhoneType(
    this.id,
    this.name,
  );
}

@MappableClass()
class Phone with PhoneMappable {
  int id;
  String number;
  PhoneType type;

  Phone(
    this.id,
    this.number,
    this.type,
  );

  @override
  String toString() {
    return '$type: $number';
  }
}
