import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/booking/service/booking_services.dart';

import '../../../core/base/service/booking_service_interface.dart';
import '../../user/model/autowash_model.dart';

class BookingViewModel extends IBookingService {
  IBookingService bookingService = BookingServices();
  @override
  Future<Booking> addBookig(Booking booking) async {
    return await bookingService.addBookig(booking);
  }

  @override
  Future<void> deleteBooking(String id) async {
    return await bookingService.deleteBooking(id);
  }

  @override
  Future<List<int>> getUnavailableHours(
    DateTime date,
    Autowash autowash,
    int openingHour,
    int closingHour,
  ) {
    return bookingService.getUnavailableHours(
      date,
      autowash,
      openingHour,
      closingHour,
    );
  }
}
