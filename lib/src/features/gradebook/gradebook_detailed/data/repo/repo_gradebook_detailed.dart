import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_gradebook.dart';

class RepoGradeBookDetailed {
  RepoGradeBookDetailed({required this.api});

  final Api api;

  Future<GradeBook> fetch(int courseId) async {
    final result =
        await api.dio.get('/students/get-student-grades', queryParameters: {
      "courseId": courseId,
    });
    return gradeBookFromJson(json.encode(result.data));
  }
}
