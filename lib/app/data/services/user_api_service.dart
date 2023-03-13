import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mutex/mutex.dart';

import '../../../core/values/consts.dart';
import '../../../routes/routes.dart';
import '../models/client.dart';
import 'interceptors.dart';

//todo see the structure of message erorr

class UserApiService extends GetxService {
  final Client _client = Get.find<Client>();
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  final mutex = Mutex();

  Future<String> login(String userName, String password) async {
    try {
      final response = await _dio.post(
        '/api/auth/login/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );
      _client.fromJson(response.data);
      return response.statusCode.toString();
    } catch (error) {
      if (error is DioError) {
        print(error.response!.data['detail'].toString());
        return error.response!.data['detail'].toString();
      }else {
        return userErrorHandler(error);
      }
    }
  }

  Future<String> signup(String userName, String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/register/',
        data: jsonEncode(<String, dynamic>{
          'username': userName,
          'email': email,
          'password': password,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  Future<String> sendEmail(String userName, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/sendEmail/app/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      userErrorHandler(error);
      print(error);
      return error.toString();
    }
  }

  Future<String> verification(String userName) async {
    try {
      final response = await _dio.post(
        '/api/user/verification/?',
        data: jsonEncode(<String, String>{
          'username': userName,
        }),
      );
      return response.data['status'];
    } catch (error) {
      userErrorHandler(error);
      return error.toString();
    }
  }

  Future<dynamic> checkCode(
      String userName, String password, String code) async {
    try {
      final response = await _dio.post(
        '/api/user/checkCode/app/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
          'code': code
        }),
      );
      _client.fromJson(response.data);
      return response.statusCode;
    } catch (error) {
      userErrorHandler(error);
      return error.toString();
    }
  }

  Future<dynamic> refreshToken() async {
    try {
      mutex.acquire();
      print('get token');
      final response = await _dio.put(
        '/api/auth/login/refresh/',
        data: jsonEncode(<String, String>{'refresh': _client.refresh}),
      );
      _client.fromJson(response.data);
      mutex.release();
      return response.statusCode;
    } catch (error) {
      mutex.release();
     if (error is DioError && error.response!.statusCode == 401) {
       _client.removeClientInfo();
       Get.offNamed(AppRoutes.loginScreen);
      }
      return error.toString();
    }
  }

  //todo ask arman


  Future<String> sendPasswordEmail(String email) async {
    try {
      final response = await _dio.post(
        '/api/user/changePass/',
        data: jsonEncode(<String, String>{
          'email': email,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      userErrorHandler(error);
      return error.toString();
    }
  }

  Future<String> changePasswordCode(String email, String code, String pass1) async {
    try {
      final response = await _dio.post(
        '/api/user/changePass/',
        data: jsonEncode(<String, String>{
          'username': email,
          'code': code,
          'password': pass1,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      if (error is DioError) {
        return error.response!.data['detail'].toString();
      }else {
        return userErrorHandler(error);
      }
    }
  }

  String userErrorHandler(dynamic error) {
    print(error.runtimeType);
    //log(error.toString());
    if (error is DioError) {
      print(error.response!.data['detail'].toString());
      return error.response!.data['detail'].toString();
    } else if (error is TimeoutException) {
      return error.message!;
    } else if (error is DioErrorType) {
      return error.name.toString();
    } else if (error is TypeError) {
      return error.toString();
    } else {
      return 'something went wrong';
    }
  }
}
