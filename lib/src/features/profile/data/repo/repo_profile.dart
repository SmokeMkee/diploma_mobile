

import '../../../../../api/api.dart';
import '../dto/dto_profile.dart';

class RepoProfile {
  RepoProfile({required this.api});
  final Api api;


  Future<Profile> fetch() async {
    final result = await api.dio.get('/user-info/get-user-info');
    return Profile.fromJson((result.data));
  }
}