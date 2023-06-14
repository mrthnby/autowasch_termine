import 'package:autowasch_termine/core/base/service/booking_service_interface.dart';
import 'package:autowasch_termine/core/service/api_service.dart';
import 'package:autowasch_termine/product/extensions/date_extensions.dart';
import 'package:autowasch_termine/view/admin/service/admin_service.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';

import '../../user/model/autowash_model.dart';

class BookingServices extends IBookingService with ApiSerivce {


  @override
  Future<Booking> addBookig(Booking booking) async {
    final response = await dio.post(API_PATHS.termins.getPath,
        data: Booking.toJson(booking));
    return Booking.fromJson(response.data);
  }

  @override
  Future<void> deleteBooking(String id) async {
    await dio.delete("${API_PATHS.termins.getPath}/$id");
  }

  @override
  Future<List<int>> getUnavailableHours(
    DateTime date,
    Autowash autowash,
    int openingHour,
    int closingHour,
  ) async {
    List<int> unavailableHours = [];
    List<Booking> termins = await AdminService().getTermins(autowash);
    for (Booking termin in termins) {
      if (date.isInSameDay(termin.terminDate)) {
        unavailableHours.add(termin.terminDate.hour);
      }
    }
    return unavailableHours;
  }
}
