// To parse this JSON data, do
//
//     final grades = gradesFromJson(jsonString);

import 'dart:convert';

Grades gradesFromJson(String str) => Grades.fromJson(json.decode(str));

String gradesToJson(Grades data) => json.encode(data.toJson());

class Grades {
  final List<StudentGradeBookDtoList>? studentGradeBookDtoList;
  final double? total;

  Grades({
    this.studentGradeBookDtoList,
    this.total,
  });

  factory Grades.fromJson(Map<String, dynamic> json) => Grades(
    studentGradeBookDtoList: json["studentGradeBookDtoList"] == null ? [] : List<StudentGradeBookDtoList>.from(json["studentGradeBookDtoList"]!.map((x) => StudentGradeBookDtoList.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "studentGradeBookDtoList": studentGradeBookDtoList == null ? [] : List<dynamic>.from(studentGradeBookDtoList!.map((x) => x.toJson())),
    "total": total,
  };
}

class StudentGradeBookDtoList {
  final int? courseId;
  final String? courseName;
  final String? grade;
  final int? groupId;
  final int? sectionId;
  final String? sectionName;
  final String? status;
  final String? studentEmail;
  final String? studentName;
  final String? studentSurname;
  final String? teacherName;
  final int? userId;

  StudentGradeBookDtoList({
    this.courseId,
    this.courseName,
    this.grade,
    this.groupId,
    this.sectionId,
    this.sectionName,
    this.status,
    this.studentEmail,
    this.studentName,
    this.studentSurname,
    this.teacherName,
    this.userId,
  });

  factory StudentGradeBookDtoList.fromJson(Map<String, dynamic> json) => StudentGradeBookDtoList(
    courseId: json["courseId"],
    courseName: json["courseName"],
    grade: json["grade"],
    groupId: json["groupId"],
    sectionId: json["sectionId"],
    sectionName: json["sectionName"],
    status: json["status"],
    studentEmail: json["studentEmail"],
    studentName: json["studentName"],
    studentSurname: json["studentSurname"],
    teacherName: json["teacherName"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "courseName": courseName,
    "grade": grade,
    "groupId": groupId,
    "sectionId": sectionId,
    "sectionName": sectionName,
    "status": status,
    "studentEmail": studentEmail,
    "studentName": studentName,
    "studentSurname": studentSurname,
    "teacherName": teacherName,
    "userId": userId,
  };
}
