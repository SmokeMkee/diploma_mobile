import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_gradebook.dart';
import '../repo/repo_gradebook.dart';

part 'gradebook_event.dart';

part 'gradebook_state.dart';

class GradebookBloc extends Bloc<GradebookEvent, GradebookState> {
  final RepoGradeBook repo;

  GradebookBloc({required this.repo}) : super(GradebookInitial()) {
    on<FetchGradebookEvent>(
      (event, emit) async {
        emit(GradebookLoading());
        try {
          final response = await repo.fetch();
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
