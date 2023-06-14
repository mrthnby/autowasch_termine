import 'package:autowasch_termine/core/base/service/admin_service_interface.dart';
import 'package:autowasch_termine/core/service/api_service.dart';
import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';

import '../../../product/controllers/user_controller.dart';

class AdminService extends IAdminService with ApiSerivce {
  AdminController controller = AdminController.instance;

  @override
  Future<Autowash> createNewUser(Autowash autowash) async {
    var data = Autowash.toJson(autowash);
    data["id"] = null;
    var response = await dio.post(API_PATHS.autowaschers.getPath, data: data);

    return Autowash.fromJson(response.data);
  }

  @override
  Future<List<Booking>> getTermins(Autowash autowash) async {
    List<Booking> termins = [];
    var response = await dio.get(API_PATHS.termins.getPath);
    for (Map<String, dynamic> termin in response.data) {
      if (termin["autoWaschId"] == autowash.id) {
        termins.add(Booking.fromJson(termin));
      }
    }

    return termins;
  }

  @override
  Future<bool> login(String email, String password) async {
    for (Autowash autowash in UserController.instance.autowashList ?? []) {
      if (autowash.email == email && autowash.password == password) {
        controller.loggedUser = autowash;
        controller.isLoggedIn = true;
        return true;
      }
    }
    return false;
  }
}
