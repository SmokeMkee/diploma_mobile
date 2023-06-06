import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/repo_sign.dart';

part 'sign_event.dart';

part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final RepoSign repo;

  SignBloc({required this.repo}) : super(SignInitial()) {
    on<AuthSignEvent>((event, emit) async {
      // const storage = FlutterSecureStorage();
      //
      // try {
      //   final response = await repo.fetch(
      //     email: event.email,
      //     password: event.password,
      //   );
      //   if (response.token != null && response.token!.isNotEmpty) {
      //     await storage.write(key: 'token', value: response.token!);
      //     emit(AuthSuccessSignIn());
      //   }
        emit(AuthSuccessSignIn());
      // } catch (e) {
      //   if (e is DioError) {
      //     print(e.error);
      //   }
      // }
    });
    on<LogOutSignEvent>(
      (event, emit) async {
        const storage = FlutterSecureStorage();

        try {
         // await storage.delete(key: 'token');
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
