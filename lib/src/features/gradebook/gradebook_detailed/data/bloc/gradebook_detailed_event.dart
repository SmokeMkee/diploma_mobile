part of 'gradebook_detailed_bloc.dart';

abstract class GradebookDetailedEvent {}

class FetchGradebookEvent extends GradebookDetailedEvent {
  FetchGradebookEvent({required this.courseId});

  final int courseId;
}
