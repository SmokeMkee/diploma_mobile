part of 'courses_units_bloc.dart';

abstract class CoursesUnitsEvent {}

class FetchCoursesUnitsEvent extends CoursesUnitsEvent {
  FetchCoursesUnitsEvent({required this.courseId});

  final int courseId;
}
