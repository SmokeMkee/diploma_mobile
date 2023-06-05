part of 'section_material_bloc.dart';

abstract class SectionMaterialEvent {}

class FetchSectionMaterialEvent extends SectionMaterialEvent {
  FetchSectionMaterialEvent(
      {required this.courseId, required this.sectionId, required this.unitId});

  final int unitId;
  final int courseId;
  final int sectionId;
}
