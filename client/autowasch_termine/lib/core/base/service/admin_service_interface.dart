import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';

abstract class IAdminService {
  Future<Autowash> createNewUser(Autowash autowash);
  Future<bool> login(String email, String password);
  Future<List<Booking>> getTermins(Autowash autowash);
}
