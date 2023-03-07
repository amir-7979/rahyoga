import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/services/interceptors.dart';

import '../../../core/values/consts.dart';
import '../models/client.dart';
import '../models/home.dart';

class ContentApiService extends GetxService{
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl))..interceptors.add(TokenInterceptor());

  Future<dynamic> home() async {
    try {
      final response = await _dio.post(
        '/api/root/home/');

      return Home.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      print(error);
      return error.toString();
    }
  }

  String userErrorHandler(dynamic error) {
    print(error);
    log(error.toString());
    if (error is DioError){
      return error.toString();
    }else if(error is TimeoutException){
      return error.message!;
    }else if(error is DioErrorType) {
      return error.name.toString();
    }else{
      return 'something went wrong';
    }
  }
}