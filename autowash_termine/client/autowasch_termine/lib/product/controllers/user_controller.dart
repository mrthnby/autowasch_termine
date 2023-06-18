import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:get/get.dart';

import '../../view/booking/model/booking_model.dart';

class UserController extends GetxController {
  static final instance = Get.find<UserController>();

  final RxList<Booking> _usersBookings = RxList.empty();

  final _autowashLoadingState = AutowashLoadingState.LOADING.obs;
  List<Autowash>? autowashList;
  AutowashLoadingState get autowashLoadingState => _autowashLoadingState.value;
  set autowashLoadingState(AutowashLoadingState value) =>
      _autowashLoadingState.value = value;

  List<Booking> get usersBookings => _usersBookings;
  set usersBookings(List<Booking> value) => _usersBookings.value = value;
}
