import 'package:autowasch_termine/core/widgets/textfield/custom_textfield.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text("Create a New Account",
            style: TextStyle(color: Colors.orange.shade600)),
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
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 300,
                                      vertical: 150,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GridView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
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
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: index == choosenPhoto
                                                        ? Colors.orange.shade400
                                                        : Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
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
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Text("Pick a Photo"),
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
}
