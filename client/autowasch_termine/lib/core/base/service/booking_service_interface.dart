import 'package:autowasch_termine/view/booking/model/booking_model.dart';

abstract class IBookingService {
  List<int> getUnavailableHours(DateTime date);
  Future<String> addBookig(Booking booking);
  Future<void> deleteTermin(String id);
}
