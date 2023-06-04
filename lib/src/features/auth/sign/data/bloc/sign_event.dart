part of 'sign_bloc.dart';

abstract class SignEvent {}

class AuthSignEvent extends SignEvent {
  AuthSignEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
