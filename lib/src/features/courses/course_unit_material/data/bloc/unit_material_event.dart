part of 'unit_material_bloc.dart';

abstract class UnitMaterialEvent {}

class FetchSectionUnitMaterialEvent extends UnitMaterialEvent {
  FetchSectionUnitMaterialEvent({required this.unitId, required this.courseId});

  final int unitId;
  final int courseId;
}
