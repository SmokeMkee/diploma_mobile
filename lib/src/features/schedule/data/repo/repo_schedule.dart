import 'dart:convert';

import 'package:diploma_mobile/api/api.dart';
import 'package:diploma_mobile/src/features/schedule/data/dto/dto_schedule.dart';

class RepoSchedule {
  final Api api;

  RepoSchedule({required this.api});

  Future<List<Schedule>> fetch(String day) async {
    final result = await api.dio.get(
        '/students/get-student-schedule-by-day-of-week',
        queryParameters: {'dayOfWeek': day});
    return scheduleFromJson(json.encode(result.data));
  }
}
