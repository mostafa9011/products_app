import '../../../domain/entities/user_entity.dart';
import 'address_model.dart';
import 'company.dart';

class UserModel extends UserEntity {
  final int id;
  final String name;
  final String email;
  AddressModel? addressModel;
  String? username;
  String? phone;
  String? website;
  Company? company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.addressModel,
    this.username,
    this.phone,
    this.website,
    this.company,
  }) : super(
          id: id,
          name: name,
          email: email,
          address: addressModel?.street,
          phone: phone,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      addressModel: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }
}
