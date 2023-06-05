import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_unit_assignment_material.dart';
import '../dto/dto_unit_section_material.dart';
import '../dto/unit_section.dart';

class RepoUnitMaterial {
  RepoUnitMaterial({required this.api});

  final Api api;

  Future<List<UnitSection>> fetch(int unitId, int courseId) async {
    final result = await api.dio.get(
      '/students/get-courses-units-section',
      queryParameters: {
        "unitId": unitId,
        "courseId": courseId,
      },
    );

    return unitSectionFromJson(json.encode(result.data));
  }

  Future<UnitSectionAssignmentMaterial?> fetchAssignmentMaterial(
    int unitId,
    int courseId,
    int sectionId,
  ) async {
    final result = await api.dio.get(
      '/students/get-student-all-assignments-by-course-id-unit-id-section-id',
      queryParameters: {
        "unitId": unitId,
        "courseId": courseId,
        "sectionId": sectionId,
      },
    );

    if(result.data != null && result.data.toString().isNotEmpty) {
     final jsonData = json.encode(result.data); // Преобразование строки в JSON объект
     print(result.data);
      return unitSectionAssignmentMaterialFromJson(jsonData);
    }

    return null;
  }

  Future<List<UnitSectionMaterial>> getUnitSectionMaterial(
      int unitId, int courseId, int sectionId) async {
    final result = await api.dio.get(
      '/students/get-section-material',
      queryParameters: {
        "unitId": unitId,
        "courseId": courseId,
        "sectionId": sectionId,
      },
    );
    return unitSectionMaterialFromJson(json.encode(result.data));
  }
}
