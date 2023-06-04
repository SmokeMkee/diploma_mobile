import 'dart:async';

import 'package:dio/dio.dart';
import 'package:diploma_mobile/src/features/gradebook/gradebook_detailed/data/repo/repo_gradebook_detailed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_gradebook.dart';

part 'gradebook_detailed_event.dart';

part 'gradebook_detailed_state.dart';

class GradebookDetailedBloc
    extends Bloc<GradebookDetailedEvent, GradebookDetailedState> {
  final RepoGradeBookDetailed repo;

  GradebookDetailedBloc({required this.repo})
      : super(GradebookDetailedInitial()) {
    on<FetchGradebookEvent>(
      (event, emit) async {
        emit(GradebookDetailedLoading());
        try {
          final response = await repo.fetch(event.courseId);
          emit(GradebookDetailedData(listGradeBook: response));
        } catch (e) {
          print(e);
          if (e is DioError) {
            print(e.response);
            print(e.error);
          }
          emit(GradebookDetailedError(message: 'error fetch list'));
        }
      },
    );
  }
}
