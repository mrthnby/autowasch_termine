import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';

import '../service/user_service.dart';

class UserViewModel extends IUserService {
  final IUserService _userService = UserService();
  final UserController _userController = UserController.instance;
 

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
