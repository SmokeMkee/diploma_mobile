part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileData extends ProfileState {
  ProfileData({required this.profile});

  final Profile profile;
}

class ProfileError extends ProfileState {}
