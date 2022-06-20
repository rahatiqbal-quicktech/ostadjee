// To parse this JSON data, do
//
//     final tuitionInformationDivisionsModel = tuitionInformationDivisionsModelFromJson(jsonString);

import 'dart:convert';

TuitionInformationDivisionsModel tuitionInformationDivisionsModelFromJson(
        String str) =>
    TuitionInformationDivisionsModel.fromJson(json.decode(str));

String tuitionInformationDivisionsModelToJson(
        TuitionInformationDivisionsModel data) =>
    json.encode(data.toJson());

class TuitionInformationDivisionsModel {
  TuitionInformationDivisionsModel({
    this.divisiontutors,
  });

  List<Divisiontutor>? divisiontutors;

  factory TuitionInformationDivisionsModel.fromJson(
          Map<String, dynamic> json) =>
      TuitionInformationDivisionsModel(
        divisiontutors: List<Divisiontutor>.from(
            json["divisiontutors"].map((x) => Divisiontutor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "divisiontutors":
            List<dynamic>.from(divisiontutors!.map((x) => x.toJson())),
      };
}

class Divisiontutor {
  Divisiontutor({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.divisiontutorsCount,
  });

  int? id;
  String? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? divisiontutorsCount;

  factory Divisiontutor.fromJson(Map<String, dynamic> json) => Divisiontutor(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        divisiontutorsCount: json["divisiontutors_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "divisiontutors_count": divisiontutorsCount,
      };
}
