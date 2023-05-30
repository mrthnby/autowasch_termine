// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      plateNumber: json['plateNumber'] as String,
      autoWaschId: json['autoWaschId'] as String,
      bookingDate: DateTime.parse(json['bookingDate'] as String),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'plateNumber': instance.plateNumber,
      'autoWaschId': instance.autoWaschId,
      'bookingDate': instance.bookingDate.toIso8601String(),
    };
