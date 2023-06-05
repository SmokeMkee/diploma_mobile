part of 'create_resume_bloc.dart';

@immutable
abstract class CreateResumeState {}

class CreateResumeInitial extends CreateResumeState {}
class SuccessCreateResumeInitial extends CreateResumeState {}
class ErrorCreateResumeInitial extends CreateResumeState {}
