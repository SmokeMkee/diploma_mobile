import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  final options = BaseOptions(
      baseUrl: 'https://public.test.onlinebank.kz/api/1c-service/',
      connectTimeout: 30000,
      receiveTimeout: 30000);
}

class _BasicInterceptor implements Interceptor {
  final storage = const FlutterSecureStorage();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.contentType = 'application/json; charset=utf-8';
    options.responseType = ResponseType.json;
    String? token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbWluYXpoZW5pc292YUBnbWFpbC5jb20iLCJleHAiOjE2ODcyODQwMDB9.FhAyezPfIQbnUyGZAqB8WsWV6jUTlKKePnLTKHpGTBQLUcwsVH3MLAIbwYpwzevRYGeVyAAFN54rqyf1U6QmQw';
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
