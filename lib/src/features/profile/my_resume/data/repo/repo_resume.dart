import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/resume.dart';

class RepoResume {
  RepoResume({required this.api});

  final Api api;

  Future<List<Resume>> fetchResumeList() async {
    final result = await api.dio.get('/user-info/get-resume');
    print(result.data);
    return resumeFromJson(json.encode(result.data));
  }
}
