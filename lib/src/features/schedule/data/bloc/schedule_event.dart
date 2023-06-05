part of 'schedule_bloc.dart';

abstract class ScheduleEvent {}

class FetchScheduleEvent extends ScheduleEvent {
  final String day;

  FetchScheduleEvent({required this.day});
}
