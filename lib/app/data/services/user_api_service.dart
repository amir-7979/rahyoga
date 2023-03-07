import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../core/values/consts.dart';
import '../models/client.dart';

class UserApiService extends GetxService {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
  final Client _client = Get.find<Client>();

  Future<dynamic> login(String userName, String password) async {
    try {
      final response = await _dio.post(
        '/api/auth/login/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );
      _client.fromJson(response.data);
      return response.statusCode;
    } catch (error) {
      userErrorHandler(error);
      print(error);
      return error.toString();
    }
  }

  Future<dynamic> signup(String userName, String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/register/',
        data: jsonEncode(<String, dynamic>{
          'username': userName,
          'email': email,
          'password': password,
        }),
      );
      return response.statusCode;
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  Future<dynamic> sendEmail(String userName, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/sendEmail/app/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );
      return response.statusCode;
    } catch (error) {
      userErrorHandler(error);
      print(error);
      return error.toString();
    }
  }

  Future<dynamic> verification(String userName) async {
    try {
      final response = await _dio.post(
        '/api/user/verification/?',
        data: jsonEncode(<String, String>{
          'username': userName,
        }),
      );
      return int.parse(response.data['status']);
    } catch (error) {
      userErrorHandler(error);
      print(error);
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
      print(error);
      return error.toString();
    }
  }

  Future<dynamic> getToken(String refresh) async {
    //todo await mut.acquire();
    //todo ask arman about status code for logout

    try {
      final response = await _dio.put(
        '/api/auth/login/refresh/',
        data: jsonEncode(<String, String>{'refresh': refresh}),
      );
      _client.fromJson(response.data);
      return response.statusCode;
    }catch(error){
      _client.removeClientInfo();
      /*if (error.statusCode == 401) {
        _client.removeClientInfo();
      }*/
      return error.toString();
    }
  }

  Future<dynamic> logOutUser(String refresh) async {
    try {
      final response = await _dio.put('/api/user/logout/', data: jsonEncode(<String, String>{'refresh': refresh}),);
      _client.removeClientInfo();
      return response.statusCode;
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  String userErrorHandler(dynamic error) {
    print(error);
    log(error.toString());
    if (error is DioError) {
      return error.toString();
    } else if (error is TimeoutException) {
      return error.message!;
    } else if (error is DioErrorType) {
      return error.name.toString();
    } else {
      return 'something went wrong';
    }
  }
}
