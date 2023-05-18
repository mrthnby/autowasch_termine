import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/core/service/api_service.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:autowasch_termine/view/user/model/booking_model.dart';

class UserService extends IUserService {
  @override
  Future<void> addBooking(Booking booking) {
    // TODO: implement addBooking
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBooking(String plate) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future<List<Autowash>?> fetchAutowashList() async {
    return await ApiSerivce.instance.getAutowashers();
  }
}
