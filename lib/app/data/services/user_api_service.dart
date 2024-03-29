import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mutex/mutex.dart';

import '../../../core/values/consts.dart';
import '../models/client.dart';

class UserApiService extends GetxService {
  final Client _client = Get.find<Client>();
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
  final Mutex mutex = Mutex();

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
      if (error is DioException && error.response != null ){
        
        return 'این اکانت در سیستم وجود ندارد';
      } else {
        userErrorHandler(error);
        return 'این اکانت در سیستم وجود ندارد';
      }
    }
  }

  Future<String> signup(
      String userName, String phone, String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/register/',
        data: jsonEncode(<String, dynamic>{
          'username': userName,
          'email': email,
          'phone_number': phone,
          'password': password,
        }),
      );

      return response.statusCode.toString();
    } catch (error) {
      if (error is DioException && error.response != null ){
        return error.response!.data['messages'][0]['message_per'].toString();
      }
      return  'an error occurred';
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
      return '-1';
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
      return '-1';
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
      return '-1';
    }
  }

  Future<dynamic> refreshToken() async {
    try {
      mutex.acquire();
      final response = await _dio.put('/api/auth/login/refresh/',
          data: jsonEncode(<String, String>{'refresh': _client.refresh}));
      _client.fromJson(response.data);
    } catch (error) {
      return error.toString();
    } finally {
      mutex.release();
    }
  }

  Future<String> sendPasswordEmail(String email) async {
    try {
      final response = await _dio.post(
        '/api/user/changePass/',
        data: jsonEncode(<String, String>{
          'phone_number': email,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      userErrorHandler(error);
      return '-1';
    }
  }

  Future<String> changePasswordCode(
      String email, String code, String pass1) async {
    try {
      print(email +' : '+ code +' : '+ pass1);
      final response = await _dio.post(
        '/api/user/changePass/check/',
        data: jsonEncode(<String, String>{
          'phone_number': email,
          'code': code,
          'new_password': pass1,
        }),
      );
      return response.statusCode.toString();
    } catch (error) {
      if (error is DioException && error.response != null ){
        return error.response!.data['detail'];
      } else {
        userErrorHandler(error);
        return error.toString();
      }

    }
  }

  void userErrorHandler(dynamic error) {
    developer.log('rahuoga', name: 'my.app.category', error: error);
  }
}
