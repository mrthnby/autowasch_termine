import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/view/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  initializeControllers();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainView());
}

void initializeControllers() {
  Get.put(UserController());
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Autowasch Termine",
      home: HomeView(),
    );
  }
}
