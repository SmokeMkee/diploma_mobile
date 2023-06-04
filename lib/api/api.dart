import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    options.contentType = 'application/json; charset=utf-8';
    options.responseType = ResponseType.json;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbWluYXpoZW5pc292YUBnbWFpbC5jb20iLCJleHAiOjE2ODcwMjQ4MDB9.WHKq77JvY5M-fmmV8_qjXtFvHRlRIVLNRi9XgouB3rL2mG6ZH5pEpoMEwKuDIoWjoQaI_vzMn7kmLSd0wdw4bw';
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
