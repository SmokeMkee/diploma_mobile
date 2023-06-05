import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_schedule.dart';
import '../repo/repo_schedule.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final RepoSchedule repo;

  ScheduleBloc({required this.repo}) : super(ScheduleInitial()) {
    on<FetchScheduleEvent>(
          (event, emit) async {
        emit(ScheduleLoading());
        try {
          final response = await repo.fetch(event.day);
          emit(ScheduleData(scheduleList: response));
        } catch (e) {
          emit(ScheduleError(message: 'fetch schedule list error'));
        }
      },
    );
  }
}
