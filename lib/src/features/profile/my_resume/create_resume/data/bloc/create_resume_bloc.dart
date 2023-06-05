import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/dto/dto_create_resume.dart';
import 'package:meta/meta.dart';

import '../repo/repo_create_resume.dart';

part 'create_resume_event.dart';

part 'create_resume_state.dart';

class CreateResumeBloc extends Bloc<CreateResumeEvent, CreateResumeState> {
  final RepoCreateResume repo;

  CreateResumeBloc({required this.repo}) : super(CreateResumeInitial()) {
    on<AddCreateResumeEvent>((event, emit) async {
      try{
        var response =await repo.createResume(event.resume);
        print('dasdasdasdasdadaadasdad');
      }catch(e){
        if(e is DioError){
          print(e.error);
        }
        print(e);
      }
    });
  }
}
