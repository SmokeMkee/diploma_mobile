import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:diploma_mobile/src/features/profile/my_resume/create_resume/data/dto/dto_create_resume.dart';

import '../../../../../../../api/api.dart';

class RepoCreateResume {
  RepoCreateResume({required this.api});

  final Api api;

  Future<void> createResume(CreateResume resume) async {
    FormData formData = FormData.fromMap({
      "firstName": resume.firstName,
      // "Services": servicejson,
      // "Image": {
      //   "image": await MultipartFile.fromFile(imageFile.path,
      //       filename: imageFileName, contentType: new MediaType('image', 'png')),
      //   "type": "image/png"
      // },
    });
    print(formData.fields);
    print(resume.firstName);
    final result = await api.dio.post(
      '/user-info/create-resume',
      data: {
        "firstName": resume.firstName,
      },
      options: Options(contentType: 'application/json; charset=utf-8'),
    );
    print(result.statusCode);
  }
}

// Future<String> uploadImage(File file) async {
//   String fileName = file.path.split('/').last;
//   FormData formData = FormData.fromMap({
//     "file":
//     await MultipartFile.fromFile(file.path, filename:fileName),
//   });
//   response = await dio.post("/info", data: formData);
//   return response.data['id'];
// }
