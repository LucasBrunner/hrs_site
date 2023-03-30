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

  @override
  String toString() {
    return name;
  }
}

@MappableClass()
class Phone with PhoneMappable {
  int id;
  String number;
  PhoneType phoneType;

  Phone(
    this.id,
    this.number,
    this.phoneType,
  );

  @override
  String toString() {
    return '$phoneType: $number';
  }
}
