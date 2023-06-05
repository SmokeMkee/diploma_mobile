import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/dto_unit_assignment_material.dart';
import '../dto/dto_unit_section_material.dart';
import '../repo/repo_unit_material.dart';

part 'section_material_event.dart';

part 'section_material_state.dart';

class SectionMaterialBloc
    extends Bloc<SectionMaterialEvent, SectionMaterialState> {
  final RepoUnitMaterial repo;

  SectionMaterialBloc({required this.repo}) : super(SectionMaterialInitial()) {
    on<FetchSectionMaterialEvent>(
      (event, emit) async {
        emit(SectionMaterialLoading());
        try {
          final response = await repo.getUnitSectionMaterial(
            event.unitId,
            event.courseId,
            event.sectionId,
          );
          final responseAssignment = await repo.fetchAssignmentMaterial(
            event.unitId,
            event.courseId,
            event.sectionId,
          );
          emit(
            SectionMaterialData(
              listMaterial: response,
              assignmentMaterial: responseAssignment,
            ),
          );
        } catch (e) {
          if (e is DioError) {
            print(e.error);
          }
          print(e);
          emit(SectionMaterialError(message: 'fetch material error'));
        }
      },
      transformer: sequential(),
    );
  }
}
