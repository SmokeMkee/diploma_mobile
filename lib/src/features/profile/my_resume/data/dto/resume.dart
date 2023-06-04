
import 'dart:convert';

List<Resume> resumeFromJson(String str) => List<Resume>.from(json.decode(str).map((x) => Resume.fromJson(x)));

String resumeToJson(List<Resume> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Resume {
  final String? birthDate;
  final String? cellPhone;
  final String? citizenship;
  final String? cityOfResidence;
  final String? department;
  final String? desiredPosition;
  final String? educationalInstitution;
  final String? endOfWork;
  final String? firstName;
  final String? gender;
  final int? id;
  final DateTime? insertDate;
  final String? keySkills;
  final String? level;
  final String? nativeLanguage;
  final String? organization;
  final String? patronymicName;
  final String? photoContentType;
  final String? photoData;
  final String? photoName;
  final String? position;
  final String? salary;
  final String? secondName;
  final String? specialization;
  final String? startOfWork;
  final int? userId;
  final String? workExperience;
  final String? yearOfGraduation;
  final String? yourProfile;

  Resume({
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

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
    birthDate: json["birthDate"],
    cellPhone: json["cellPhone"],
    citizenship: json["citizenship"],
    cityOfResidence: json["cityOfResidence"],
    department: json["department"],
    desiredPosition: json["desiredPosition"],
    educationalInstitution: json["educationalInstitution"],
    endOfWork: json["endOfWork"],
    firstName: json["firstName"],
    gender: json["gender"],
    id: json["id"],
    insertDate: json["insertDate"] == null ? null : DateTime.parse(json["insertDate"]),
    keySkills: json["keySkills"],
    level: json["level"],
    nativeLanguage: json["nativeLanguage"],
    organization: json["organization"],
    patronymicName: json["patronymicName"],
    photoContentType: json["photoContentType"],
    photoData: json["photoData"],
    photoName: json["photoName"],
    position: json["position"],
    salary: json["salary"],
    secondName: json["secondName"],
    specialization: json["specialization"],
    startOfWork: json["startOfWork"],
    userId: json["userId"],
    workExperience: json["workExperience"],
    yearOfGraduation: json["yearOfGraduation"],
    yourProfile: json["yourProfile"],
  );

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
