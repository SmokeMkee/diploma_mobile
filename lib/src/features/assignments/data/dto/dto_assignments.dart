// To parse this JSON data, do
//
//     final assignmentsList = assignmentsListFromJson(jsonString);

import 'dart:convert';

List<Assignments> assignmentsListFromJson(String str) => List<Assignments>.from(json.decode(str).map((x) => Assignments.fromJson(x)));

String assignmentsListToJson(List<Assignments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Assignments {
  final int? courseId;
  final String? endDate;
  final String? heading;
  final int? id;
  final String? instructions;
  final String? material;
  final String? startDate;
  final int? unitSectionId;
  final int? userId;

  Assignments({
    this.courseId,
    this.endDate,
    this.heading,
    this.id,
    this.instructions,
    this.material,
    this.startDate,
    this.unitSectionId,
    this.userId,
  });

  factory Assignments.fromJson(Map<String, dynamic> json) => Assignments(
    courseId: json["courseId"],
    endDate: json["endDate"],
    heading: json["heading"],
    id: json["id"],
    instructions: json["instructions"],
    material: json["material"],
    startDate: json["startDate"],
    unitSectionId: json["unitSectionId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "endDate": endDate,
    "heading": heading,
    "id": id,
    "instructions": instructions,
    "material": material,
    "startDate": startDate,
    "unitSectionId": unitSectionId,
    "userId": userId,
  };
}
