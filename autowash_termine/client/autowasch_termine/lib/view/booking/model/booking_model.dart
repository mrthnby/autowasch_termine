import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable()
class Booking {
  String? id;
  String name;
  String phoneNumber;
  String plateNumber;
  String autoWaschId;
  DateTime terminDate;

  Booking({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.plateNumber,
    required this.autoWaschId,
    required this.terminDate,
  });

  static Booking fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  static Map<String, dynamic> toJson(Booking instance) =>
      _$BookingToJson(instance);
}
