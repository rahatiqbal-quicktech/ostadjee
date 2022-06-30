// To parse this JSON data, do
//
//     final districtForSearchModelDart = districtForSearchModelDartFromJson(jsonString);

import 'dart:convert';

DistrictForSearchModel districtForSearchModelDartFromJson(String str) =>
    DistrictForSearchModel.fromJson(json.decode(str));

String districtForSearchModelDartToJson(DistrictForSearchModel data) =>
    json.encode(data.toJson());

class DistrictForSearchModel {
  DistrictForSearchModel({
    this.districts,
  });

  List<District>? districts;

  factory DistrictForSearchModel.fromJson(Map<String, dynamic> json) =>
      DistrictForSearchModel(
        districts: List<District>.from(json["districts"]
            .map((x) => x == null ? null : District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "districts": List<dynamic>.from(
            districts!.map((x) => x == null ? null : x.toJson())),
      };
}

class District {
  District({
    this.id,
    this.text,
  });

  int? id;
  String? text;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
