import 'package:dart_mappable/dart_mappable.dart';

part 'address.mapper.dart';

@MappableClass()
class Address with AddressMappable {
  int id;
  String street;
  String city;
  String state;
  String zip;

  Address(
    this.id,
    this.street,
    this.city,
    this.state,
    this.zip,
  );

  @override
  String toString() {
    return '$street, $city, $state $zip';
  }
}
