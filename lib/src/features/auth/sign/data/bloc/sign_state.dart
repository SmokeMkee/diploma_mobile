part of 'sign_bloc.dart';

abstract class SignState {}

class SignInitial extends SignState {}

class AuthSuccessSignIn extends SignState {}

class AuthErrorSign extends SignState {
  AuthErrorSign({required this.message});

  final String message;
}
