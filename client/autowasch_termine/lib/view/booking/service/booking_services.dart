import 'package:autowasch_termine/core/base/service/booking_service_interface.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:dio/dio.dart';

class BookingServices extends IBookingService {
  BookingServices instance = BookingServices._();

  BookingServices._();
  final String _baseUrl = " http://localhost:8080";
  final Dio _dio = Dio();
  @override
  Future<String> addBookig(Booking booking) async {
    final response =
        await _dio.post("$_baseUrl/termins", data: Booking.toJson(booking));
    return response.data;
  }

  @override
  Future<void> deleteTermin(String id) async {
    await _dio.delete("$_baseUrl/termins/$id");
  }

  @override
  List<int> getUnavailableHours(DateTime date) {
    // TODO: implement getUnavailableHours
    throw UnimplementedError();
  }
}
