import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_courses_units_list.dart';

class RepoUnits {
  RepoUnits({required this.api});

  final Api api;

  Future<List<CoursesUnitsList>> fetch(int courseId) async {
    final result =
        await api.dio.get('/students/get-courses-units', queryParameters: {
      "courseId": courseId,
    });
    return coursesUnitsListFromJson(json.encode(result.data));
  }
}
