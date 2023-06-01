import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/dto_courses_list.dart';

class RepoCourses {
  RepoCourses({required this.api});

  final Api api;

  Future<List<CoursesList>> fetch() async {
    final result = await api.dio.get('/students/get-student-courses');
    return coursesListFromJson(json.encode(result.data));
  }
}
