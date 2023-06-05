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

    var token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbWluYXpoZW5pc292YUBnbWFpbC5jb20iLCJleHAiOjE2ODcxOTc2MDB9.lzNI8wpg60LEdK4zOTZaB3v_P477BtSMdOwuT-prOvadwJE7cyS9Kua7v_yTR3VYlumhAL_BdzNQaT22c_txNA';
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
