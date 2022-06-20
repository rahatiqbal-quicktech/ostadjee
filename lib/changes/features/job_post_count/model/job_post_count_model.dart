// To parse this JSON data, do
//
//     final jobPostCountModel = jobPostCountModelFromJson(jsonString);

import 'dart:convert';

JobPostCountModel jobPostCountModelFromJson(String str) =>
    JobPostCountModel.fromJson(json.decode(str));

String jobPostCountModelToJson(JobPostCountModel data) =>
    json.encode(data.toJson());

class JobPostCountModel {
  JobPostCountModel({
    this.status,
    this.totalpost,
    this.mylimit,
  });

  String? status;
  int? totalpost;
  int? mylimit;

  factory JobPostCountModel.fromJson(Map<String, dynamic> json) =>
      JobPostCountModel(
        status: json["status"],
        totalpost: json["totalpost"],
        mylimit: json["mylimit"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalpost": totalpost,
        "mylimit": mylimit,
      };
}
