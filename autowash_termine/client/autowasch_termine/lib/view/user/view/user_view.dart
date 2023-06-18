import 'package:autowasch_termine/core/widgets/card/custom_carwash_card.dart';
import 'package:autowasch_termine/product/constants/asset_path_constants.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:autowasch_termine/view/user/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserController userController = UserController.instance;
  List<Autowash>? _autowashList;
  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    _getAutowashList();
    super.initState();
  }

  void _getAutowashList() async {
    if (userController.autowashList == null ||
        userController.autowashList == []) {
      _autowashList = await userViewModel.fetchAutowashList();
    } else {
      _autowashList = userController.autowashList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _userViewTitle(),
            const SizedBox(
              height: 5,
            ),
            _showAutowashList()
          ],
        ),
      ),
    );
  }

  Obx _showAutowashList() {
    return Obx(
      () => userController.autowashLoadingState == AutowashLoadingState.LOADING
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : userController.autowashLoadingState == AutowashLoadingState.ERROR
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "ERROR",
                      style: TextStyle(color: Colors.orange, fontSize: 30),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _autowashList!.length,
                    itemBuilder: (context, index) {
                      Autowash currentAutowash = _autowashList![index];
                      return CustomCarWashCard(
                        autowash: currentAutowash,
                      );
                    },
                  ),
                ),
    );
  }

  Row _userViewTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
          child: Image.asset(
            CAR_WASH_ICON,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "Autowäschern Liste",
          style: TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
