import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  static AdminController instance = Get.find<AdminController>();

  final RxBool _isLoggedIn = false.obs;
  Autowash? loggedUser;


  bool get isLoggedIn => _isLoggedIn.value;
  set isLoggedIn(bool value) => _isLoggedIn.value = value;

}


