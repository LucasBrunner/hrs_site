import 'package:dart_mappable/dart_mappable.dart';

part 'address.mapper.dart';

@MappableClass()
class Address with AddressMappable {
  int id;
  String street;
  String city;
  String region;
  String zip;

  Address(
    this.id,
    this.street,
    this.city,
    this.region,
    this.zip,
  );

  @override
  String toString() {
    return '$street, $city, $region $zip';
  }
}
