part of 'section_material_bloc.dart';

abstract class SectionMaterialState {}

class SectionMaterialInitial extends SectionMaterialState {}

class SectionMaterialData extends SectionMaterialState {
  SectionMaterialData({
    required this.listMaterial,
     this.assignmentMaterial,
  });

  final List<UnitSectionMaterial> listMaterial;
  final UnitSectionAssignmentMaterial? assignmentMaterial;
}

class SectionMaterialLoading extends SectionMaterialState {}

class SectionMaterialError extends SectionMaterialState {
  SectionMaterialError({required this.message});

  final String message;
}
