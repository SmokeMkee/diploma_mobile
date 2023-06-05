import 'dart:convert';

List<Schedule> scheduleFromJson(String str) => List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  final int? courseId;
  final String? courseName;
  final int? groupId;
  final int? id;
  final String? lessonDuration;
  final String? lessonTime;
  final int? userId;

  Schedule({
    this.courseId,
    this.courseName,
    this.groupId,
    this.id,
    this.lessonDuration,
    this.lessonTime,
    this.userId,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    courseId: json["courseId"],
    courseName: json["courseName"],
    groupId: json["groupId"],
    id: json["id"],
    lessonDuration: json["lessonDuration"],
    lessonTime: json["lessonTime"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "courseName": courseName,
    "groupId": groupId,
    "id": id,
    "lessonDuration": lessonDuration,
    "lessonTime": lessonTime,
    "userId": userId,
  };
}
