// To parse this JSON data, do
//
//     final gradeBook = gradeBookFromJson(jsonString);

import 'dart:convert';

GradeBook gradeBookFromJson(String str) => GradeBook.fromJson(json.decode(str));

String gradeBookToJson(GradeBook data) => json.encode(data.toJson());

class GradeBook {
  final List<StudentGradeBookDtoList>? studentGradeBookDtoList;
  final num? total;

  GradeBook({
    this.studentGradeBookDtoList,
    this.total,
  });

  factory GradeBook.fromJson(Map<String, dynamic> json) => GradeBook(
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
