import 'package:autowasch_termine/core/widgets/textfield/custom_textfield.dart';
import 'package:autowasch_termine/view/admin/view/admin_newuser_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Willkommen",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 35),
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
      ),
    );
  }
}
