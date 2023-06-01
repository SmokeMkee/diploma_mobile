import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_gradebook.dart';

class RepoGradeBook {
  RepoGradeBook({required this.api});

  final Api api;

  Future<List<GradeBook>> fetch() async {
    final result = await api.dio.get('/students/get-student-gradebook' ,queryParameters: {
      "courseId" : 11961002
    });
    return gradeBookFromJson(json.encode(result.data));
  }
}
