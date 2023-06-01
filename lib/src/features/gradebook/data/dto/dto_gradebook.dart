// To parse this JSON data, do
//
//     final gradeBook = gradeBookFromJson(jsonString);

import 'dart:convert';

List<GradeBook> gradeBookFromJson(String str) => List<GradeBook>.from(json.decode(str).map((x) => GradeBook.fromJson(x)));

String gradeBookToJson(List<GradeBook> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GradeBook {
  final int? courseId;
  final String? fileDate;
  final String? fileName;
  final int? id;
  final int? sectionId;
  final int? unitId;
  final int? userId;

  GradeBook({
    this.courseId,
    this.fileDate,
    this.fileName,
    this.id,
    this.sectionId,
    this.unitId,
    this.userId,
  });

  factory GradeBook.fromJson(Map<String, dynamic> json) => GradeBook(
    courseId: json["courseId"],
    fileDate: json["fileDate"],
    fileName: json["fileName"],
    id: json["id"],
    sectionId: json["sectionId"],
    unitId: json["unitId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "fileDate": fileDate,
    "fileName": fileName,
    "id": id,
    "sectionId": sectionId,
    "unitId": unitId,
    "userId": userId,
  };
}
