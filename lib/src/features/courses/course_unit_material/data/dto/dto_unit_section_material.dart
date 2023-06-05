import 'dart:convert';

List<UnitSectionMaterial> unitSectionMaterialFromJson(String str) =>
    List<UnitSectionMaterial>.from(
        json.decode(str).map((x) => UnitSectionMaterial.fromJson(x)));

String unitSectionMaterialToJson(List<UnitSectionMaterial> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitSectionMaterial {
  final String? articleHeading;
  final String? articleText;
  final String? contentType;
  final int? courseId;
  final String? description;
  final bool? dividingLine;
  final String? fileData;
  final String? fileName;
  final String? flagCreationInfo;
  final String? heading;
  final int? id;
  final String? message;
  final String? question;
  final int? sectionId;
  final bool? textMarker;
  final String? typeOfWriting;
  final int? unitId;
  final int? unitSectionMaterialId;
  final int? userId;

  UnitSectionMaterial({
    this.articleHeading,
    this.articleText,
    this.contentType,
    this.courseId,
    this.description,
    this.dividingLine,
    this.fileData,
    this.fileName,
    this.flagCreationInfo,
    this.heading,
    this.id,
    this.message,
    this.question,
    this.sectionId,
    this.textMarker,
    this.typeOfWriting,
    this.unitId,
    this.unitSectionMaterialId,
    this.userId,
  });

  factory UnitSectionMaterial.fromJson(Map<String, dynamic> json) =>
      UnitSectionMaterial(
        articleHeading: json["articleHeading"],
        articleText: json["articleText"],
        contentType: json["contentType"],
        courseId: json["courseId"],
        description: json["description"],
        dividingLine: json["dividingLine"],
        fileData: json["fileData"],
        fileName: json["fileName"],
        flagCreationInfo: json["flagCreationInfo"],
        heading: json["heading"],
        id: json["id"],
        message: json["message"],
        question: json["question"],
        sectionId: json["sectionId"],
        textMarker: json["textMarker"],
        typeOfWriting: json["typeOfWriting"],
        unitId: json["unitId"],
        unitSectionMaterialId: json["unitSectionMaterialId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "articleHeading": articleHeading,
        "articleText": articleText,
        "contentType": contentType,
        "courseId": courseId,
        "description": description,
        "dividingLine": dividingLine,
        "fileData": fileData,
        "fileName": fileName,
        "flagCreationInfo": flagCreationInfo,
        "heading": heading,
        "id": id,
        "message": message,
        "question": question,
        "sectionId": sectionId,
        "textMarker": textMarker,
        "typeOfWriting": typeOfWriting,
        "unitId": unitId,
        "unitSectionMaterialId": unitSectionMaterialId,
        "userId": userId,
      };
}
