import 'dart:convert';

List<CoursesUnitsList> coursesUnitsListFromJson(String str) => List<CoursesUnitsList>.from(json.decode(str).map((x) => CoursesUnitsList.fromJson(x)));

String coursesUnitsListToJson(List<CoursesUnitsList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesUnitsList {
  final int? courseId;
  final int? id;
  final String? unitName;
  final int? userId;

  CoursesUnitsList({
    this.courseId,
    this.id,
    this.unitName,
    this.userId,
  });

  factory CoursesUnitsList.fromJson(Map<String, dynamic> json) => CoursesUnitsList(
    courseId: json["courseId"],
    id: json["id"],
    unitName: json["unitName"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "id": id,
    "unitName": unitName,
    "userId": userId,
  };
}
