import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  final options = BaseOptions(
      baseUrl: 'https://public.test.onlinebank.kz/api/1c-service/',
      connectTimeout: 30000,
      receiveTimeout: 30000);
}

class _BasicInterceptor implements Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token =  'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbWluYXpoZW5pc292YUBnbWFpbC5jb20iLCJleHAiOjE2ODY4NTIwMDB9.lJiX8TADAYh8-ROi73_9i9jsYSABF7N3hQFtyGBKwMfkMnOVK7mDNhUcv3J1YvaggQ2rPDgF4LCcIwAZ2rFiTQ';
    options.contentType = 'application/json; charset=utf-8';
    options.responseType = ResponseType.json;
    options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
