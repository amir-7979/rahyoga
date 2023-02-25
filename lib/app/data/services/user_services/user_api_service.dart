import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import '../../models/client.dart';
import 'dio_class.dart';

class UserApiService{
  final DioClass _dioService = DioClass();
  late Client client;


  Future<dynamic> login(String userName, String password) async {
    try {
      final response = await _dioService.dio.post(
        '/api/auth/login/',
        data: jsonEncode(<String, String>{
          'username': userName,
          'password': password,
        }),
      );

      client = Client.fromJson(response.data);
      client.writeClientInfo();
      print(response.toString());
      return response.statusCode;
    } catch (error) {
      userErrorHandler(error);
      print(error);
      return error.toString();
    }
  }

  Future<dynamic> signup(String userName, String email, String password) async {
    try {
      final response = await _dioService.dio.post(
        '/api/auth/login/',
        data: jsonEncode(<String, dynamic>{
          'username': userName,
          'email': email,
          'password': password,
        }),
      );
      client = Client.fromJson(response.data);
      client.writeClientInfo();
      return '201';
    }catch(error){
      return userErrorHandler(error);
    }
  }

  Future<dynamic> logOutUser() async {
    try{
    final response = await _dioService.dio.put('/api/user/logout/');
    client.removeClientInfo();
      return "";
    } catch(error) {
      return userErrorHandler(error);
    }
  }


  Future<int?> getToken() async {
    //todo await mut.acquire();
    final response = await _dioService.tokenDio.put('login/refresh?noCookie=true');
    if (response.data['code'] == 200) {
      // todo writeUserInfo(response);
    }

    return response.statusCode;
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