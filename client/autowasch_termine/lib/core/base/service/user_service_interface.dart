import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:autowasch_termine/view/user/model/booking_model.dart';

abstract class IUserService {
  Future<List<Autowash>?> fetchAutowashList();
  Future<void> addBooking(Booking booking);
  Future<void> deleteBooking(String plate);
}
