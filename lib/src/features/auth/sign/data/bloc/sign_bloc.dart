import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/repo_sign.dart';

part 'sign_event.dart';

part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final RepoSign repo;
  SignBloc({required this.repo}) : super(SignInitial()) {
    on<AuthSignEvent>(
      (event, emit) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        // try {
        //   final response = await repo.fetch(
        //     email: event.email,
        //     password: event.password,
        //   );
        //   print(response);
        //   if (response.token != null && response.token!.isNotEmpty) {
        //     await prefs.setString('token', response.token!);
        //     emit(AuthSuccessSignIn());
        //   }
        emit(AuthSuccessSignIn());
        // } catch (e) {
        //   if(e is DioError){
        //     print(e.error);
        //   }
        }
    );
  }
}
