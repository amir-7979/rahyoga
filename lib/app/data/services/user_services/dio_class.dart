import 'package:dio/dio.dart';

import 'token_intercepter.dart';

class DioClass {
  BaseOptions options = BaseOptions(baseUrl: 'http://194.62.43.212:9090');

  late Dio dio;
  late Dio tokenDio;

  DioClass() {
    dio = Dio(options);
    tokenDio = Dio(options);
    tokenDio.interceptors.addAll([TokenInterceptor()]);
  }
}
