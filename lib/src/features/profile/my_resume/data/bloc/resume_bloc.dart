import 'package:diploma_mobile/src/features/profile/my_resume/data/repo/repo_resume.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/resume.dart';

part 'resume_event.dart';

part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  final RepoResume repo;

  ResumeBloc({required this.repo}) : super(ResumeInitial()) {
    on<FetchResumeEvent>((event, emit) async {
      emit(ResumeLoading());

      try {
        final response = await repo.fetchResumeList();
        emit(ResumeData(listResume: response));
      } catch (e) {
        emit(ResumeError(message: 'fetch resume error'));
      }
    });
  }
}
