import 'package:autowasch_termine/core/widgets/textfield/custom_textfield.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/view/admin/viewmodel/admin_viewmodel.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var adressController = TextEditingController();
  var priceController = TextEditingController();
  var hoursController = TextEditingController();
  int choosenPhoto = 0;

  AdminViewmodel adminViewmodel = AdminViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Create a New Account",
          style: TextStyle(
            color: Colors.orange.shade600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.orange.shade300,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Form(
                  child: Column(
                    children: [
                      ..._getTextFields(),
                      TextButton(
                        onPressed: () {
                          _showImagePicker(context);
                        },
                        child: const Text("Pick a Photo"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: _onSignUpButtonPressed,
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 60),
                          backgroundColor: Colors.orange.shade400,
                        ),
                        child: const Text("Sign Up"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUpButtonPressed() {
    if (nameController.text == "" ||
        emailController.text == "" ||
        adressController.text == "" ||
        priceController.text == "" ||
        passwordController.text == "" ||
        phoneController.text == "" ||
        hoursController.text == "") {
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
      Autowash autowash = Autowash(
        image_id: choosenPhoto,
        name: nameController.text,
        email: emailController.text,
        address: adressController.text,
        price: priceController.text,
        password: passwordController.text,
        phoneNumber: phoneController.text,
        openingHours: hoursController.text,
      );
      adminViewmodel.createNewUser(
        autowash,
      );
      if (UserController.instance.autowashList != null) {
        UserController.instance.autowashList!.add(autowash);
      } else {
        UserController.instance.autowashList = [autowash];
      }

      adminViewmodel.login(
        emailController.text,
        passwordController.text,
      );
    }
  }

  List<Widget> _getTextFields() => [
        CustomTextField(
          hint: "König Autowasch",
          label: "Autowasch Name",
          controller: nameController,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hint: "example@mail.com",
          label: "E-Mail",
          controller: emailController,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hint: "+90 553 985 44 85",
          label: "Phone",
          controller: phoneController,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hint: "Kavacık Beykoz/Istanbul",
          label: "Adress",
          controller: adressController,
          maxLines: 3,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hint: "09.00 - 18.00",
          label: "Opening Hours",
          controller: hoursController,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hint: "150",
          label: "Price",
          controller: priceController,
          suffixText: "₺",
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
          height: 10,
        ),
      ];

  Future<dynamic> _showImagePicker(BuildContext context) async {
    var height = MediaQuery.of(context).size.height / 6.5;
    var width = MediaQuery.of(context).size.width / 6;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width,
                vertical: height,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              choosenPhoto = index;
                              Get.back();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: index == choosenPhoto
                                    ? Colors.orange.shade400
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      "assets/images/logo_car_wash_$index.jpg",
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
