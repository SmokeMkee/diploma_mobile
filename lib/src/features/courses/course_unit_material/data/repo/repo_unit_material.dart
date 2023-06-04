import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/unit_section.dart';

class RepoUnitMaterial {
  RepoUnitMaterial({required this.api});

  final Api api;

  Future<List<UnitSection>> fetch(int unitId) async {
    final result = await api.dio.get(
      '/students/get-courses-units-section',
      queryParameters: {
        "unitId": unitId,
      },
    );

    return unitSectionFromJson(json.encode(result.data));
  }
}
