part of 'schedule_bloc.dart';

abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}
class ScheduleLoading extends ScheduleState {}

class ScheduleError extends ScheduleState {
  final String message;

  ScheduleError({required this.message});
}

class ScheduleData extends ScheduleState {
  final List<Schedule> scheduleList;

  ScheduleData({required this.scheduleList});
}
