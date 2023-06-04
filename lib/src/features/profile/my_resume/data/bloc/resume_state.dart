part of 'resume_bloc.dart';

abstract class ResumeState {}

class ResumeInitial extends ResumeState {}

class ResumeLoading extends ResumeState {}

class ResumeData extends ResumeState {
  ResumeData({required this.listResume});

  final List<Resume> listResume;
}

class ResumeError extends ResumeState {
  ResumeError({required this.message});

  final String message;
}
