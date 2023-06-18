// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'autowash_model.g.dart';

@JsonSerializable()
class Autowash {
  String? id;
  int image_id;
  String name;
  String email;
  String openingHours;
  String price;
  String phoneNumber;
  String address;
  String password;

  Autowash({
    this.id,
    required this.image_id,
    required this.name,
    required this.email,
    required this.address,
    required this.price,
    required this.password,
    required this.phoneNumber,
    required this.openingHours,
  });

  String getPhoto() {
    return "assets/images/logo_car_wash_$image_id.jpg";
  }

  static Autowash fromJson(Map<String, dynamic> json) =>
      _$AutowashFromJson(json);
  static Map<String, dynamic> toJson(Autowash instance) =>
      _$AutowashToJson(instance);

  @override
  String toString() {
    return name;
  }

 
}
