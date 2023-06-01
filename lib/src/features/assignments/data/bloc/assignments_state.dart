part of 'assignments_bloc.dart';

abstract class AssignmentsState {}

class AssignmentsInitial extends AssignmentsState {}

class AssignmentsLoading extends AssignmentsState {}

class AssignmentsError extends AssignmentsState {
  AssignmentsError({required this.message});

  final String message;
}

class AssignmentsData extends AssignmentsState {
  AssignmentsData({required this.listAssignments});

  final List<Assignments> listAssignments;
}
