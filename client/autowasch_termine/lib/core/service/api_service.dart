import 'dart:io';

import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/product/enum/user_enums.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:dio/dio.dart';

class ApiSerivce {
  static ApiSerivce instance = ApiSerivce._();

  ApiSerivce._();

  static const String _baseUrl = "http://localhost:8080";

  final Dio _dio = Dio();

  Future<List<Autowash>> getAutowashers() async {
    List<Autowash> res = [];
    Response? response;
    try {
      response = await _dio.get("$_baseUrl/autowaschers");
    } catch (_) {}

    if (response != null) {
      print(response.statusCode);

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
