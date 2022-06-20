// To parse this JSON data, do
//
//     final tutorDepartmentModel = tutorDepartmentModelFromJson(jsonString);

import 'dart:convert';

TutorDepartmentModel tutorDepartmentModelFromJson(String str) =>
    TutorDepartmentModel.fromJson(json.decode(str));

String tutorDepartmentModelToJson(TutorDepartmentModel data) =>
    json.encode(data.toJson());

class TutorDepartmentModel {
  TutorDepartmentModel({
    this.tutordepartments,
  });

  List<Tutordepartment>? tutordepartments;

  factory TutorDepartmentModel.fromJson(Map<String, dynamic> json) =>
      TutorDepartmentModel(
        tutordepartments: List<Tutordepartment>.from(
            json["tutordepartments"].map((x) => Tutordepartment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tutordepartments":
            List<dynamic>.from(tutordepartments!.map((x) => x.toJson())),
      };
}

class Tutordepartment {
  Tutordepartment({
    this.id,
    this.text,
  });

  int? id;
  String? text;

  factory Tutordepartment.fromJson(Map<String, dynamic> json) =>
      Tutordepartment(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
