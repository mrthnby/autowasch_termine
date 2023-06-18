import 'package:autowasch_termine/core/widgets/textfield/custom_textfield.dart';
import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/view/admin/view/admin_newuser_view.dart';
import 'package:autowasch_termine/view/admin/view/admin_panel_view.dart';
import 'package:autowasch_termine/view/admin/viewmodel/admin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AdminController adminController = AdminController.instance;
  AdminViewmodel adminViewmodel = AdminViewmodel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => adminController.isLoggedIn
            ? const AdminPanel()
            : _loginScreen(context),
      ),
    );
  }

  Column _loginScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Willkommen",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 35),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Form(
            child: Column(
              children: [
                CustomTextField(
                  hint: "example@mail.com",
                  label: "E-Mail",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "123456",
                  label: "Password",
                  controller: passwordController,
                  isHidden: true,
                  onSubmitted: (p0) {
                    _login();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 60),
                    backgroundColor: Colors.orange.shade400,
                  ),
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("or"),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  child: const Text("Create Account"),
                  onPressed: () {
                    Get.to(() => const CreateUser());
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _login() {
    if (emailController.text == "" || passwordController.text == "") {
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          messageText: const Text(
            "Bitte füllen sie jede Field",
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
    } else {
      adminViewmodel.login(
        emailController.text,
        passwordController.text,
      );
    }
  }
}
