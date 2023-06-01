import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_courses_list.dart';
import '../repo/repo_courses.dart';

part 'courses_event.dart';

part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final RepoCourses repo;

  CoursesBloc({required this.repo}) : super(CoursesInitial()) {
    on<FetchCoursesEvent>(
      (event, emit) async {
        emit(CoursesLoading());
        try {
          final response = await repo.fetch();
          emit(CoursesData(listCourses: response));
        } catch (e) {
          emit(CoursesError(message: 'fetch courses list error'));
        }
      },
    );
  }
}
