part of 'gradebook_detailed_bloc.dart';

abstract class GradebookDetailedState {}

class GradebookDetailedInitial extends GradebookDetailedState {}

class GradebookDetailedLoading extends GradebookDetailedState {}

class GradebookDetailedError extends GradebookDetailedState {
  GradebookDetailedError({required this.message});

  final String message;
}

class GradebookDetailedData extends GradebookDetailedState {
  GradebookDetailedData({required this.listGradeBook});

  final GradeBook listGradeBook;
}
