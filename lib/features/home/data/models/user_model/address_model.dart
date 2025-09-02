import 'geo.dart';

class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  AddressModel({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json['street'] as String?,
        suite: json['suite'] as String?,
        city: json['city'] as String?,
        zipcode: json['zipcode'] as String?,
        geo: json['geo'] == null
            ? null
            : Geo.fromJson(json['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toJson(),
      };
}
