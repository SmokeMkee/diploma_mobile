import 'dart:convert';

import 'package:diploma_mobile/src/features/assignments/data/dto/dto_assignments.dart';

import '../../../../../../api/api.dart';

class RepoAssignment {
  RepoAssignment({required this.api});

  final Api api;

  Future<List<Assignments>> fetch() async {
    final result = await api.dio.get('/students/get-student-all-assignments');
    return assignmentsListFromJson(json.encode(result.data));
  }
}
