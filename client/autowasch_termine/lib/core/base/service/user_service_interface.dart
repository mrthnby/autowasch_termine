import 'package:autowasch_termine/product/models/autowash_model.dart';
import 'package:autowasch_termine/product/models/booking_model.dart';

abstract class IUserService {
  Future<List<Autowash>?> fetchAutowashList();
  Future<void> addBooking(Booking booking);
  Future<void> deleteBooking(String plate);
}
