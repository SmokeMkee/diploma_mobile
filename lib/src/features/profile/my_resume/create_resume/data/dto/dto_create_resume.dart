// To parse this JSON data, do
//
//     final createResume = createResumeFromJson(jsonString);

import 'dart:convert';
import 'dart:io';



class CreateResume {
  String? birthDate;
  String? cellPhone;
  String? citizenship;
  String? cityOfResidence;
  String? department;
  String? desiredPosition;
  String? educationalInstitution;
  String? endOfWork;
  String? firstName;
  String? gender;
  int? id;
  DateTime? insertDate;
  String? keySkills;
  String? level;
  String? nativeLanguage;
  String? organization;
  String? patronymicName;
  String? photoContentType;
  String? photoData;
  String? photoName;
  String? position;
  String? salary;
  String? secondName;
  String? specialization;
  String? startOfWork;
  int? userId;
  String? workExperience;
  String? yearOfGraduation;
  String? yourProfile;

  CreateResume({
    this.birthDate,
    this.cellPhone,
    this.citizenship,
    this.cityOfResidence,
    this.department,
    this.desiredPosition,
    this.educationalInstitution,
    this.endOfWork,
    this.firstName,
    this.gender,
    this.id,
    this.insertDate,
    this.keySkills,
    this.level,
    this.nativeLanguage,
    this.organization,
    this.patronymicName,
    this.photoContentType,
    this.photoData,
    this.photoName,
    this.position,
    this.salary,
    this.secondName,
    this.specialization,
    this.startOfWork,
    this.userId,
    this.workExperience,
    this.yearOfGraduation,
    this.yourProfile,
  });

  Map<String, dynamic> toJson() => {
        "birthDate": birthDate,
        "cellPhone": cellPhone,
        "citizenship": citizenship,
        "cityOfResidence": cityOfResidence,
        "department": department,
        "desiredPosition": desiredPosition,
        "educationalInstitution": educationalInstitution,
        "endOfWork": endOfWork,
        "firstName": firstName,
        "gender": gender,
        "id": id,
        "insertDate": insertDate?.toIso8601String(),
        "keySkills": keySkills,
        "level": level,
        "nativeLanguage": nativeLanguage,
        "organization": organization,
        "patronymicName": patronymicName,
        "photoContentType": photoContentType,
        "photoData": photoData,
        "photoName": photoName,
        "position": position,
        "salary": salary,
        "secondName": secondName,
        "specialization": specialization,
        "startOfWork": startOfWork,
        "userId": userId,
        "workExperience": workExperience,
        "yearOfGraduation": yearOfGraduation,
        "yourProfile": yourProfile,
      };
}
