// To parse this JSON data, do
//
//     final tutorVerifyDetailsModel = tutorVerifyDetailsModelFromJson(jsonString);

import 'dart:convert';

TutorVerifyDetailsModel tutorVerifyDetailsModelFromJson(String str) =>
    TutorVerifyDetailsModel.fromJson(json.decode(str));

String tutorVerifyDetailsModelToJson(TutorVerifyDetailsModel data) =>
    json.encode(data.toJson());

class TutorVerifyDetailsModel {
  TutorVerifyDetailsModel({
    this.tutordetails,
  });

  Tutordetails? tutordetails;

  factory TutorVerifyDetailsModel.fromJson(Map<String, dynamic> json) =>
      TutorVerifyDetailsModel(
        tutordetails: Tutordetails.fromJson(json["tutordetails"]),
      );

  Map<String, dynamic> toJson() => {
        "tutordetails": tutordetails?.toJson(),
      };
}

class Tutordetails {
  Tutordetails({
    this.id,
    this.nidCard,
    this.nidCardBack,
    this.studentCard,
    this.studentCardBack,
  });

  int? id;
  String? nidCard;
  String? nidCardBack;
  String? studentCard;
  String? studentCardBack;

  factory Tutordetails.fromJson(Map<String, dynamic> json) => Tutordetails(
        id: json["id"],
        nidCard: json["nid_card"],
        nidCardBack: json["nid_card_back"],
        studentCard: json["student_card"],
        studentCardBack: json["student_card_back"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nid_card": nidCard,
        "nid_card_back": nidCardBack,
        "student_card": studentCard,
        "student_card_back": studentCardBack,
      };
}
