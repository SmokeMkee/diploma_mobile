import 'dart:convert';

import '../../../../../../api/api.dart';
import '../../../courses/data/dto/dto_courses_list.dart';

class RepoGradeBook {
  RepoGradeBook({required this.api});

  final Api api;

  Future<List<CoursesList>> fetchCoursesList() async {
    final result = await api.dio.get('/students/get-student-courses');
    return coursesListFromJson(json.encode(result.data));
  }
}
