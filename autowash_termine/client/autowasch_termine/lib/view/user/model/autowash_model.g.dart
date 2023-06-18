// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autowash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Autowash _$AutowashFromJson(Map<String, dynamic> json) => Autowash(
      id: json['id'] as String,
      image_id: json['image_id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      price: json['price'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      openingHours: json['openingHours'] as String,
    );

Map<String, dynamic> _$AutowashToJson(Autowash instance) => <String, dynamic>{
      'id': instance.id,
      'image_id': instance.image_id,
      'name': instance.name,
      'email': instance.email,
      'openingHours': instance.openingHours,
      'price': instance.price,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'password': instance.password,
    };
