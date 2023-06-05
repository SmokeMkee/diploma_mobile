import 'package:dio/dio.dart';

import '../dto/auth.dart';

class RepoSign {
  Dio dio = Dio();

  Future<Auth> fetch({required String email, required String password}) async {
    final result = await dio.post(
      'https://public.test.onlinebank.kz/api/1c-service/auth/signin',
      data: {
        "password": password,
        "username": email,
      },
    );
    return Auth.fromJson(result.data);
  }
}
