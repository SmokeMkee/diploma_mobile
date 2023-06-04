
import 'dart:convert';

List<UnitSection> unitSectionFromJson(String str) => List<UnitSection>.from(json.decode(str).map((x) => UnitSection.fromJson(x)));

String unitSectionToJson(List<UnitSection> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitSection {
  final int? id;
  final String? sectionName;
  final int? unitId;
  final int? userId;

  UnitSection({
    this.id,
    this.sectionName,
    this.unitId,
    this.userId,
  });

  factory UnitSection.fromJson(Map<String, dynamic> json) => UnitSection(
    id: json["id"],
    sectionName: json["sectionName"],
    unitId: json["unitId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sectionName": sectionName,
    "unitId": unitId,
    "userId": userId,
  };
}
