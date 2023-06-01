// To parse this JSON data, do
//
//     final coursesList = coursesListFromJson(jsonString);

import 'dart:convert';

List<CoursesList> coursesListFromJson(String str) => List<CoursesList>.from(json.decode(str).map((x) => CoursesList.fromJson(x)));

String coursesListToJson(List<CoursesList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesList {
  final int? courseId;
  final String? courseName;
  final String? email;
  final int? groupId;
  final int? userId;

  CoursesList({
    this.courseId,
    this.courseName,
    this.email,
    this.groupId,
    this.userId,
  });

  factory CoursesList.fromJson(Map<String, dynamic> json) => CoursesList(
    courseId: json["courseId"],
    courseName: json["courseName"],
    email: json["email"],
    groupId: json["groupId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "courseName": courseName,
    "email": email,
    "groupId": groupId,
    "userId": userId,
  };
}
