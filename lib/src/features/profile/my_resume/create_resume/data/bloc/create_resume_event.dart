part of 'create_resume_bloc.dart';

abstract class CreateResumeEvent {}

class AddCreateResumeEvent extends CreateResumeEvent {
  AddCreateResumeEvent({required this.resume});

  final CreateResume resume;
}
