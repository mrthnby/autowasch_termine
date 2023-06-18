// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';

mixin class ApiSerivce {
  ApiSerivce._();
  final Dio dio = Dio();
}

enum API_PATHS{
  autowaschers,termins,
}

extension ApiPathExtentions on API_PATHS{
  String get getPath => "http://localhost:8080/$name";
}