import 'package:dio/dio.dart';

/*
class GeneralInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    checkUserConnection();
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    (options.path.contains('upload')) ?  options.headers = {"Content-Type": 'image/jpg'} : options.headers = {"Content-Type": 'application/json; charset=UTF-8'};
    if (options.path.contains("signup") || options.path.contains("login")) {
      options.headers
          .addEntries({"accessToken": '', "refreshToken": ''}.entries);
    } else if (options.path.contains("getToken")) {
      options.headers.addEntries(
          {"accessToken": '', "refreshToken": userClient.refreshToken}.entries);
    } else {
      options.headers.addEntries({
        "authorization": 'Bearer ' + userClient.accessToken,
        "refreshToken": userClient.refreshToken
      }.entries);
    }
    return handler.next(options);
  }

  @override
  void onResponse(
          Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
*/

// todo check validation
/*(userClient.accessToken == '' ||
        userClient.accessTokenExpire! - DateTime.now().millisecondsSinceEpoch <
            10000)*/

