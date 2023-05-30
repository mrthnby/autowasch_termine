import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:autowasch_termine/view/user/service/fake_user_service.dart';

import '../../booking/model/booking_model.dart';

class UserViewModel extends IUserService {
  //final IUserService _userService = UserService();
  final IUserService _userService = FakeUserService();
  final UserController _userController = UserController.instance;
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
    _userController.autowashLoadingState = AutowashLoadingState.LOADING;
    var list = await _userService.fetchAutowashList();
    if (list != null && list.isNotEmpty) {
      _userController.autowashLoadingState = AutowashLoadingState.LOADED;
      _userController.autowashList = list;
      return list;
    } else {
      _userController.autowashLoadingState = AutowashLoadingState.ERROR;
      return null;
    }
  }
}
