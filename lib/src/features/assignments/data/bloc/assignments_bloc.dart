import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_assignments.dart';
import '../repo/repo_assignment.dart';

part 'assignments_event.dart';

part 'assignments_state.dart';

class AssignmentsBloc extends Bloc<AssignmentsEvent, AssignmentsState> {
  final RepoAssignment repo;

  AssignmentsBloc({required this.repo}) : super(AssignmentsInitial()) {
    on<FetchAssignmentsEvent>(
      (event, emit) async {
        emit(AssignmentsLoading());
        try {
          final response = await repo.fetch();
          emit(AssignmentsData(listAssignments: response));
        } catch (e) {
          if(e is DioError){
            print(e.response);
            print(e.error);
          }
          emit(AssignmentsError(message: 'fetch assignments list error '));
        }
      },
    );
  }
}
