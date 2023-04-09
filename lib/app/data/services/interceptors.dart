import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:mutex/mutex.dart';
import '../../../routes/routes.dart';
import '../models/client.dart';
import 'user_api_service.dart';


class TokenInterceptor implements Interceptor {
  final Client _client = Get.find<Client>();
  UserApiService userService = UserApiService();

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    print('error :::${err.response?.statusCode}');
    if (err.response?.statusCode == 403) {
        await userService.refreshToken();
    }
    if (err.response?.statusCode == 401) {
      _client.removeClientInfo();
      Get.offAndToNamed(AppRoutes.loginScreen);
    }
    handler.next(err);
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
        _client.accessTime * 1000
            - DateTime.now().millisecondsSinceEpoch < 60000) {
      userService.refreshToken();
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
