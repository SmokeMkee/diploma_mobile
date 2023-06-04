part of 'unit_material_bloc.dart';

abstract class UnitMaterialState {}

class UnitMaterialInitial extends UnitMaterialState {}

class UnitMaterialLoading extends UnitMaterialState {}

class UnitMaterialError extends UnitMaterialState {
  UnitMaterialError({required this.message});

  final String message;
}

class UnitMaterialData extends UnitMaterialState {
  UnitMaterialData({required this.tabs});

  final List<UnitSection> tabs;
}
