part of 'courses_units_bloc.dart';

abstract class CoursesUnitsState {}

class CoursesUnitsInitial extends CoursesUnitsState {}

class CoursesUnitsLoading extends CoursesUnitsState {}

class CoursesUnitsData extends CoursesUnitsState {
  CoursesUnitsData({required this.listUnits});

  final List<CoursesUnitsList> listUnits;
}

class CoursesUnitsError extends CoursesUnitsState {
  CoursesUnitsError({required this.message});

  final String message;
}
