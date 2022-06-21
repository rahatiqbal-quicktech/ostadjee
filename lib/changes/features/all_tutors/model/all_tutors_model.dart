// To parse this JSON data, do
//
//     final allTutorsModel = allTutorsModelFromJson(jsonString);

import 'dart:convert';

AllTutorsModel allTutorsModelFromJson(String str) =>
    AllTutorsModel.fromJson(json.decode(str));

String allTutorsModelToJson(AllTutorsModel data) => json.encode(data.toJson());

class AllTutorsModel {
  AllTutorsModel({
    this.alltutors,
  });

  List<Alltutor>? alltutors;

  factory AllTutorsModel.fromJson(Map<String, dynamic> json) => AllTutorsModel(
        alltutors: List<Alltutor>.from(
            json["alltutors"].map((x) => Alltutor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "alltutors": List<dynamic>.from(alltutors!.map((x) => x.toJson())),
      };
}

class Alltutor {
  Alltutor({
    this.id,
    this.fullName,
    this.image,
    this.teacherUniversity,
    this.teacherSubject,
    this.districtId,
  });

  int? id;
  String? fullName;
  String? image;
  String? teacherUniversity;
  String? teacherSubject;
  int? districtId;

  factory Alltutor.fromJson(Map<String, dynamic> json) => Alltutor(
        id: json["id"],
        fullName: json["fullName"],
        image: json["image"],
        teacherUniversity: json["teacher_university"] == null
            ? null
            : json["teacher_university"],
        teacherSubject:
            json["teacher_subject"] == null ? null : json["teacher_subject"],
        districtId: json["district_id"] == null ? null : json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "image": image,
        "teacher_university":
            teacherUniversity == null ? null : teacherUniversity,
        "teacher_subject": teacherSubject == null ? null : teacherSubject,
        "district_id": districtId == null ? null : districtId,
      };
}
