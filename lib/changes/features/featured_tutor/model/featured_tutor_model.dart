// To parse this JSON data, do
//
//     final featuredTutorsModel = featuredTutorsModelFromJson(jsonString);

import 'dart:convert';

FeaturedTutorsModel featuredTutorsModelFromJson(String str) =>
    FeaturedTutorsModel.fromJson(json.decode(str));

String featuredTutorsModelToJson(FeaturedTutorsModel data) =>
    json.encode(data.toJson());

class FeaturedTutorsModel {
  FeaturedTutorsModel({
    this.featuretutors,
  });

  List<Featuretutor>? featuretutors;

  factory FeaturedTutorsModel.fromJson(Map<String, dynamic> json) =>
      FeaturedTutorsModel(
        featuretutors: List<Featuretutor>.from(
            json["featuretutors"].map((x) => Featuretutor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featuretutors":
            List<dynamic>.from(featuretutors!.map((x) => x.toJson())),
      };
}

class Featuretutor {
  Featuretutor({
    this.id,
    this.fullName,
    this.image,
    this.teacherUniversity,
    this.teacherSubject,
    this.districtId,
    this.tdistrict,
  });

  int? id;
  String? fullName;
  String? image;
  String? teacherUniversity;
  String? teacherSubject;
  int? districtId;
  Tdistrict? tdistrict;

  factory Featuretutor.fromJson(Map<String, dynamic> json) => Featuretutor(
        id: json["id"],
        fullName: json["fullName"],
        image: json["image"],
        teacherUniversity: json["teacher_university"],
        teacherSubject: json["teacher_subject"],
        districtId: json["district_id"] == null ? null : json["district_id"],
        tdistrict: json["tdistrict"] == null
            ? null
            : Tdistrict.fromJson(json["tdistrict"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "image": image,
        "teacher_university": teacherUniversity,
        "teacher_subject": teacherSubject,
        "district_id": districtId ?? null,
        "tdistrict": tdistrict == null ? null : tdistrict?.toJson(),
      };
}

class Tdistrict {
  Tdistrict({
    this.id,
    this.divisionId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic divisionId;
  String? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Tdistrict.fromJson(Map<String, dynamic> json) => Tdistrict(
        id: json["id"],
        divisionId: json["division_id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "division_id": divisionId,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
