import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_gradebook.dart';

class RepoGradeBookDetailed {
  RepoGradeBookDetailed({required this.api});

  final Api api;

  Future<Grades> fetch(int courseId) async {
    print(courseId);
    final result =
        await api.dio.get('/students/get-student-grades', queryParameters: {
      "courseId": courseId,
    });
    print('dasdasldals;,d;,lad;,l');
    return gradesFromJson(json.encode(result.data));
  }
}
