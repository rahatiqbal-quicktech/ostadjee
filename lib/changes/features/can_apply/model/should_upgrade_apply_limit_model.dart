// To parse this JSON data, do
//
//     final shouldUpgradeApplyLimitModel = shouldUpgradeApplyLimitModelFromJson(jsonString);

import 'dart:convert';

ShouldUpgradeApplyLimitModel shouldUpgradeApplyLimitModelFromJson(String str) =>
    ShouldUpgradeApplyLimitModel.fromJson(json.decode(str));

String shouldUpgradeApplyLimitModelToJson(ShouldUpgradeApplyLimitModel data) =>
    json.encode(data.toJson());

class ShouldUpgradeApplyLimitModel {
  ShouldUpgradeApplyLimitModel({
    this.teacher,
  });

  Teacher? teacher;

  factory ShouldUpgradeApplyLimitModel.fromJson(Map<String, dynamic> json) =>
      ShouldUpgradeApplyLimitModel(
        teacher: Teacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "teacher": teacher?.toJson(),
      };
}

class Teacher {
  Teacher({
    this.id,
    this.applylimit,
  });

  int? id;
  int? applylimit;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        applylimit: json["applylimit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applylimit": applylimit,
      };
}
