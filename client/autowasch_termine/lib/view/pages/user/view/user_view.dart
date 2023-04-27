import 'package:autowasch_termine/core/widgets/card/custom_carwash_card.dart';
import 'package:autowasch_termine/product/constants/asset_path_constants.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/product/models/autowash_model.dart';
import 'package:autowasch_termine/view/pages/user/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with AutomaticKeepAliveClientMixin {
  List<Autowash>? _autowashList;
  UserController userController = UserController.instance;
  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    _getAutowashList();
    super.initState();
  }

  void _getAutowashList() async {
    _autowashList = await userViewModel.fetchAutowashList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _userViewTitle(),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => userController.autowashLoadingState ==
                      AutowashLoadingState.LOADING
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    )
                  : userController.autowashLoadingState ==
                          AutowashLoadingState.ERROR
                      ? const Center(
                          child: Text(
                            "ERROR",
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
            )
          ],
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
