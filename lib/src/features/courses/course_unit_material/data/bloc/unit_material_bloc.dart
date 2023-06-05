import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/unit_section.dart';
import '../repo/repo_unit_material.dart';

part 'unit_material_event.dart';

part 'unit_material_state.dart';

class UnitMaterialBloc extends Bloc<UnitMaterialEvent, UnitMaterialState> {
  final RepoUnitMaterial repo;

  UnitMaterialBloc({required this.repo}) : super(UnitMaterialInitial()) {
    on<FetchSectionUnitMaterialEvent>(
      (event, emit) async {
        emit(UnitMaterialLoading());
        try {
          final response = await repo.fetch(event.unitId, event.courseId);
          emit(UnitMaterialData(tabs: response));
        } catch (e) {
          emit(UnitMaterialError(message: 'error fetch tabs'));
        }
      },
    );
  }
}
