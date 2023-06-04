import 'package:dio/dio.dart';
import 'package:diploma_mobile/src/features/courses/data/dto/dto_courses_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/repo_gradebook.dart';

part 'gradebook_event.dart';

part 'gradebook_state.dart';

class GradebookBloc extends Bloc<GradebookEvent, GradebookState> {
  final RepoGradeBook repo;

  GradebookBloc({required this.repo}) : super(GradebookInitial()) {
    on<FetchCourseListGradebookEvent>(
      (event, emit) async {
        emit(GradebookLoading());
        try {
          final response = await repo.fetchCoursesList();
          emit(GradebookData(listGradeBook: response));
        } catch (e) {
          if(e is DioError){
            print(e.response);
            print(e.error);
          }
          emit(GradebookError(message: 'error fetch list'));
        }
      },
    );
  }
}
