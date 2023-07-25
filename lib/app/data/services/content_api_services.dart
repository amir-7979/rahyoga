import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import '../../../core/values/consts.dart';
import '../models/article.dart';
import '../models/basket.dart';
import '../models/blogs.dart';
import '../models/buy_course_info.dart';
import '../models/client.dart';
import '../models/home.dart';
import '../models/liked_blogs.dart';
import '../models/liked_courses.dart';
import '../models/movements.dart';
import '../models/paid.dart';
import '../models/paid_course_info.dart';
import '../models/profile.dart';
import 'interceptors.dart';
import 'dart:developer' as developer;

class ContentApiService extends GetxService {
  late final Client _client;
  late final Dio _dio;

  Dio get dio => _dio;

  ContentApiService() {
    _client = Get.find<Client>();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio.interceptors.addAll(
        [
          TokenInterceptor(),
          RetryInterceptor(
            dio: _dio,
            logPrint: print,
            retries: 2,
            retryDelays: const [
              Duration(seconds: 3),
              Duration(seconds: 6),
            ],
          ),
        ],
      );
  }

  Future<Home?> home() async {
    try {
      final response = await _dio.get('/api/root/home/');
      return Home.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }


  Future<String?> getVideoUrl(int courseId, int sessionId) async {
    try {
      final response = await _dio.get('/api/season/hls/$sessionId/', queryParameters: {'course': courseId});
      print(response.data.toString());
      return response.data['hls_url'].toString();
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
      return Blogs.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<LikedCourses?> getCourses(int page) async {
    try {
      final response = await _dio.get('/api/course/list/?page=$page');
      return LikedCourses.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<LikedCourses?> getMiniCourses(int page) async {
    try {
      final response = await _dio.get('/api/course/mini/list/?page=$page');
      return LikedCourses.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Paid?> paid(int page) async {
    try {
      final response = await _dio.get('/api/course/allprogress/?page=$page');
      return Paid.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<PaidCourseInfo?> updateSessionState(int course, int season) async {
    try {
      final response = await _dio.post('/api/course/makeProgress/',
          data: jsonEncode(<String, int>{
        'course': course,
        'season': season,
      }));
      print(response.data.toString());
      return PaidCourseInfo.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<PaidCourseInfo?> paidCourse(dynamic id) async {
    try {
      final response = await _dio.get('/api/course/item/$id/');
      return PaidCourseInfo.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<BuyCourseInfo?> buyCourse(int id) async {
    try {
      final response = await _dio.get('/api/course/item/$id/');
      return BuyCourseInfo.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<String?> likeCourse(String id, bool like) async {
    try {
      final response = await _dio.post('/api/course/liked/change/',
          data: jsonEncode(<String, dynamic>{
            'course': id,
            'liked': like.toString().capitalizeFirst,
          }));
      print(response.data.toString());
      return response.statusCode.toString();
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  Future<LikedCourses?> getLikedCourse(int page) async {
    try {
      final response = await _dio.get('/api/course/liked/?page=$page');
      return LikedCourses.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Basket?> getCart() async {
    try {
      final response = await _dio.get('/api/course/cart/');
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
      return Article.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<dynamic> getLikedArticles(int page) async {
    try {
      final response = await _dio.get('/api/article/liked/?page=$page');
      return LikedBlogs.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<Movements?> movements(int page) async {
    try {
      final response = await _dio.get('/api/article/movement/list/?page=$page');
      return Movements.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<String?> likeArticle(String id, bool like) async {
    try {
      final response = await _dio.post('/api/article/liked/change/',
          data: jsonEncode(<String, dynamic>{
            'article': id,
            'liked': like.toString().capitalizeFirst,
          }));
      return response.statusCode.toString();
    } catch (error) {
      return userErrorHandler(error);
    }
  }

  Future<LikedBlogs?> getLikedMovements(int page) async {
    try {
      final response = await _dio.get('/api/article/movement/liked/?page=$page');
      return LikedBlogs.fromJson(response.data);
    } catch (error) {
      userErrorHandler(error);
      return null;
    }
  }

  Future<int?> logOutUser() async {
    try {
      _client.removeClientInfo();
      final response = await _dio
          .post('/api/user/logout/', data: {"refresh": _client.refresh});
      return response.statusCode;
    } catch (error) {
      print(error);
      return null;
    }
  }

  String userErrorHandler(dynamic error) {
    print(error.toString());
    if (error is DioError) {
      developer.log(
        'rahuoga',
        name: 'my.app.category',
        error: error.response.toString(),
      );
      //todo which one??
      return (error.response!.data['messages'] != null && error.response!.data['messages'][0]['message_per'] != null ) ?
      error.response!.data['messages'][0]['message_per'].toString(): 'خظا ذر سرور';
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
