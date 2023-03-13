import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/liked_courses.dart';
import 'package:rahyoga/app/data/models/paid_course_info.dart';
import 'package:rahyoga/app/data/services/interceptors.dart';

import '../../../core/values/consts.dart';
import '../models/article.dart';
import '../models/basket.dart';
import '../models/blogs.dart';
import '../models/client.dart';
import '../models/home.dart';
import '../models/movements.dart';
import '../models/paid.dart';
import '../models/profile.dart';

class ContentApiService extends GetxService{
  final Client _client = Get.find<Client>();
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl))..interceptors.add(TokenInterceptor());


  Future<Home?> home() async {
    try {
      final response = await _dio.get('/api/root/home/');
      //print(response.data.toString());
      return Home.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Profile?> profile() async {
    try {
      final response = await _dio.get('/api/user/info/');
      return Profile.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Blogs?> blogs(int page) async {
    try {
      final response = await _dio.get('/api/article/list/?page=$page');
      //print(response.data.toString());
      return Blogs.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<LikedCourses?> getCourses(int page) async {
    try {
      final response = await _dio.get('/api/course/list/?page=$page');
      print(response.data.toString());
      return LikedCourses.fromJson(response.data);
    } catch (error) {
      print(error.toString());

      userErrorHandler(error);
      return null;
    }
  }
  Future<Movements?> movements(int page) async {
    try {
      final response = await _dio.get('/api/article/movement/list/?page=$page');
      //print(response.data.toString());
      return Movements.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }


  Future<Paid?> paid(int page) async {
    try {
      final response = await _dio.get('/api/course/allprogress/?page=$page');
      //print(response.data.toString());
      return Paid.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<PaidCourseInfo?> paidCourse(int id) async {
    try {
      final response = await _dio.get('/api/course/item/$id/');
      print(response.data.toString());
      return PaidCourseInfo.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<LikedCourses?> liked(int page) async {
    try {
      final response = await _dio.get('/api/course/liked/?page=$page');
      print(response.data.toString());
      return LikedCourses.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Basket?> basket() async {
    try {
      final response = await _dio.get('/api/course/cart/');
      //print(response.data);
      return Basket.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Basket?> deleteItemFromBasket(String id) async {
    try {
      final response = await _dio.post('/api/course/cart/rm/',
          data: jsonEncode(<String, String>{
            'course': id,
          }));
      return Basket.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<String?> addItemFromBasket(String id) async {
    try {
      final response = await _dio.post('/api/course/cart/',
          data: jsonEncode(<String, String>{
            'course': id,
          }));
      return response.statusCode.toString();
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  Future<Article?> article(int id) async {
    try {
      final response = await _dio.get('/api/article/item/$id/');
      print(response.data.toString());
      return Article.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<int?> logOutUser() async {
    try {
      final response = await _dio.post('/api/user/logout/', data: {"refresh": _client.refresh});
      _client.removeClientInfo();
      return response.statusCode;
    } catch (error) {
      print(error);
      return null;
    }
  }

  String userErrorHandler(dynamic error) {
    if (error is DioError) {
      return (error.response!.data['messages'] == null) ? error.response!.data['detail']:
       error.response!.data['messages'][0]['message'].toString();
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