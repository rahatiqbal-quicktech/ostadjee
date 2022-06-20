// To parse this JSON data, do
//
//     final jobApplyCountModel = jobApplyCountModelFromJson(jsonString);

import 'dart:convert';

JobApplyCountModel jobApplyCountModelFromJson(String str) =>
    JobApplyCountModel.fromJson(json.decode(str));

String jobApplyCountModelToJson(JobApplyCountModel data) =>
    json.encode(data.toJson());

class JobApplyCountModel {
  JobApplyCountModel({
    this.status,
    this.totalapply,
  });

  String? status;
  int? totalapply;

  factory JobApplyCountModel.fromJson(Map<String, dynamic> json) =>
      JobApplyCountModel(
        status: json["status"],
        totalapply: json["totalapply"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalapply": totalapply,
      };
}
