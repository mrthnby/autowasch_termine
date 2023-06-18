import 'package:autowasch_termine/core/base/service/admin_service_interface.dart';
import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/view/admin/service/admin_service.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/booking/service/booking_services.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminViewmodel extends IAdminService {
  final IAdminService adminService = AdminService();
  AdminController controller = AdminController.instance;
  UserController userController = UserController.instance;
  @override
  Future<Autowash> createNewUser(Autowash autowash) async {
    Autowash? loggedUser;
    loggedUser = await adminService.createNewUser(autowash);
    controller.loggedUser = loggedUser;
    userController.autowashList?.forEach((element) {
      if (loggedUser?.email == element.email &&
          loggedUser?.password == element.password) {
        element.id = loggedUser?.id;
      }
    });
    return loggedUser;
  }

  @override
  Future<List<Booking>> getTermins(Autowash autowash) async {
    List<Booking> termins = await adminService.getTermins(autowash);
    List<Booking> res = [];
    for (var element in termins) {
      if (!element.terminDate.isBefore(DateTime.now())) {
        res.add(element);
      } else {
        BookingServices().deleteBooking(element.id ?? "");
      }
    }
    res.sort(
      (a, b) => a.terminDate.compareTo(b.terminDate),
    );
    return res;
  }

  @override
  Future<bool> login(String email, String password) async {
    bool isLogged = await adminService.login(email, password);
    if (!isLogged) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          messageText: const Text(
            "Ihre E-Mail oder Passwort ist falsch",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orange,
          borderRadius: 12,
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: Get.size.width / 4.toInt(),
          ),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {}
    return isLogged;
  }

  void signOut() {
    controller.isLoggedIn = false;
    controller.loggedUser = null;
  }
}
