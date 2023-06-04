part of 'gradebook_bloc.dart';

abstract class GradebookState {}

class GradebookInitial extends GradebookState {}

class GradebookLoading extends GradebookState {}

class GradebookError extends GradebookState {
  GradebookError({required this.message});

  final String message;
}

class GradebookData extends GradebookState {
  GradebookData({required this.listGradeBook});

  final List<CoursesList> listGradeBook;
}
