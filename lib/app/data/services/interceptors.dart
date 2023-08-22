import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import '../../../routes/routes.dart';
import '../models/client.dart';
import 'user_api_service.dart';

class TokenInterceptor implements Interceptor {
  final Client _client = Get.find<Client>();
  UserApiService userService = UserApiService();

  @override
  Future<void> onError(DioException error, ErrorInterceptorHandler handler) async {
    developer.log(
      'rahuoga',
      name: 'my.app.category',
      error: error.error.toString(),
    );
    if (error.response?.statusCode == 403) {
        await userService.refreshToken();
    }
    if (error.response?.statusCode == 401) {
      _client.removeClientInfo();
      Get.offAndToNamed(AppRoutes.loginScreen);
    }
    handler.next(error);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('login') ||
        options.path.contains('signup') ||
        options.path.contains('articles') ||
        options.path.contains('movements')) {
    } else {
      options.headers
          .addEntries({"Authorization": "Bearer ${_client.access}"}.entries);
    }
    if (_client.access.isEmpty ||
        _client.accessTime * 1000 - DateTime.now().millisecondsSinceEpoch < 60000) {
      userService.refreshToken();
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      'rahuoga',
      name: 'my.app.category',
      error: response.toString(),
    );
    handler.next(response);
  }
}
