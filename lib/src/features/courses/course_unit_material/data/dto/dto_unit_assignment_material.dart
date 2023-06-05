import 'dart:convert';

UnitSectionAssignmentMaterial unitSectionAssignmentMaterialFromJson(
        String str) =>
    UnitSectionAssignmentMaterial.fromJson(json.decode(str));

String unitSectionAssignmentMaterialToJson(
        UnitSectionAssignmentMaterial data) =>
    json.encode(data.toJson());

class UnitSectionAssignmentMaterial {
  final int? courseId;
  final String? endDate;
  final String? heading;
  final int? id;
  final String? instructions;
  final String? material;
  final String? startDate;
  final int? unitId;
  final int? unitSectionId;
  final int? userId;

  UnitSectionAssignmentMaterial({
    this.courseId,
    this.endDate,
    this.heading,
    this.id,
    this.instructions,
    this.material,
    this.startDate,
    this.unitId,
    this.unitSectionId,
    this.userId,
  });

  factory UnitSectionAssignmentMaterial.fromJson(Map<String, dynamic> json) =>
      UnitSectionAssignmentMaterial(
        courseId: json["courseId"],
        endDate: json["endDate"],
        heading: json["heading"],
        id: json["id"],
        instructions: json["instructions"],
        material: json["material"],
        startDate: json["startDate"],
        unitId: json["unitId"],
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
        "unitId": unitId,
        "unitSectionId": unitSectionId,
        "userId": userId,
      };
}
