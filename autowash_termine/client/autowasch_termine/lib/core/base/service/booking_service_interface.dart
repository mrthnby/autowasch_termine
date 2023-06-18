import 'package:autowasch_termine/view/booking/model/booking_model.dart';

import '../../../view/user/model/autowash_model.dart';

abstract class IBookingService {
  Future<List<int>> getUnavailableHours(
    DateTime date,
    Autowash autowash,
    int openingHour,
    int closingHour,
  );
  Future<Booking> addBookig(Booking booking);
  Future<void> deleteBooking(String id);
}
