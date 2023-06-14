import 'dart:io';

import 'package:autowasch_termine/core/base/service/user_service_interface.dart';
import 'package:autowasch_termine/core/service/api_service.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:dio/dio.dart';

import '../../../product/controllers/user_controller.dart';
import '../../../product/enum/user_enums.dart';

class UserService extends IUserService with ApiSerivce {


  @override
  Future<List<Autowash>?> fetchAutowashList() async {
 
    List<Autowash> res = [];
    Response? response;
    try {
      response = await dio.get(API_PATHS.autowaschers.getPath);
    } catch (_) {}

    if (response != null) {
      if (response.statusCode == HttpStatus.ok) {
        for (Map<String, dynamic> autowashData in response.data) {
          res.add(Autowash.fromJson(autowashData));
        }
      }
    } else {
      UserController.instance.autowashLoadingState = AutowashLoadingState.ERROR;
    }
    return res;
  }
}
