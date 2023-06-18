import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  initializeControllers();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1024, 700),
    minimumSize: Size(1024, 700),
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MainView());
}

void initializeControllers() {
  Get.put(UserController());
  Get.put(AdminController());
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Autowasch Termine",
      home: HomeView(),
    );
  }
}
