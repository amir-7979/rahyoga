import 'package:dio/dio.dart';

class TokenInterceptor implements Interceptor {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    //todo checkUserConnection();
    /* todo if (err.response!.statusCode == 401) {
      await logOutUser();
    }*/
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) => handler.next(options);

  @override
  void onResponse(
          Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
