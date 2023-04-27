import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static final instance = Get.find<UserController>();

  final _autowashLoadingState = AutowashLoadingState.LOADING.obs;

 AutowashLoadingState get autowashLoadingState => _autowashLoadingState.value;
 set autowashLoadingState(AutowashLoadingState value) => _autowashLoadingState.value = value;
}
