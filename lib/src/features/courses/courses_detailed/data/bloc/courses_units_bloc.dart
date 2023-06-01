import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_courses_units_list.dart';
import '../repo/repo_units.dart';

part 'courses_units_event.dart';

part 'courses_units_state.dart';

class CoursesUnitsBloc extends Bloc<CoursesUnitsEvent, CoursesUnitsState> {
  final RepoUnits repo;

  CoursesUnitsBloc({required this.repo}) : super(CoursesUnitsInitial()) {
    on<FetchCoursesUnitsEvent>(
      (event, emit) async {
        emit(CoursesUnitsLoading());
        try {
          final response = await repo.fetch(event.courseId);
          emit(CoursesUnitsData(listUnits: response));
        } catch (e) {
          emit(CoursesUnitsError(message: 'fetch course units error'));
        }
      },
    );
  }
}
