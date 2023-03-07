import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import '../../../routes/routes.dart';
import '../models/client.dart';
import 'user_api_service.dart';

class TokenInterceptor implements Interceptor {
  final Client _client = Get.find<Client>();
  final UserApiService _userApiService = Get.find<UserApiService>();

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    //checkUserConnection();
    if(err.response!.statusCode == 401){
      //todo await logOutUser();
      Get.offAndToNamed(AppRoutes.loginScreen);

    }
    handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers
        .addEntries({"accessToken": _client.access}.entries);
    if (
        (_client.access.isEmpty ||
            _client.accessTime -
                DateTime.now().millisecondsSinceEpoch <
                15000)) {
      try {
        await _userApiService.getToken(_client.access);
      } catch (e) {
        //todo find out how to repeat this
        print(e.toString());
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }

}


