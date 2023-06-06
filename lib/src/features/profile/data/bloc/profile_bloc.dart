import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_profile.dart';
import '../repo/repo_profile.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RepoProfile repo;
  Profile? profileInfo;
  ProfileBloc({required this.repo}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final response = await repo.fetch();
        profileInfo = response;
        emit(ProfileData(profile: response));
      } catch (e) {}
    });
  }
}
