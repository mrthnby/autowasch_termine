import 'package:autowasch_termine/core/base/service/admin_service_interface.dart';
import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/view/admin/service/admin_service.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';

class AdminViewmodel extends IAdminService {
  final IAdminService adminService = AdminService();
  AdminController controller = AdminController.instance;
  @override
  Future<Autowash> createNewUser(Autowash autowash) async {
    Autowash? loggedUser;
    loggedUser = await adminService.createNewUser(autowash);
    controller.loggedUser = loggedUser;
    return loggedUser;
  }

  @override
  Future<List<Booking>> getTermins(Autowash autowash) async{
    return await adminService.getTermins(autowash);
  }

  @override
  Future<bool> login(String email, String password) async{
    return await adminService.login(email, password);
  }
}
