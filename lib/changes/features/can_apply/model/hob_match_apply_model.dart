// To parse this JSON data, do
//
//     final jobMatchApplyModel = jobMatchApplyModelFromJson(jsonString);

import 'dart:convert';

JobMatchApplyModel jobMatchApplyModelFromJson(String str) =>
    JobMatchApplyModel.fromJson(json.decode(str));

String jobMatchApplyModelToJson(JobMatchApplyModel data) =>
    json.encode(data.toJson());

class JobMatchApplyModel {
  JobMatchApplyModel({
    this.status,
    this.jobmatch,
  });

  String? status;
  List<Jobmatch>? jobmatch;

  factory JobMatchApplyModel.fromJson(Map<String, dynamic> json) =>
      JobMatchApplyModel(
        status: json["status"],
        jobmatch: List<Jobmatch>.from(
            json["jobmatch"].map((x) => Jobmatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "jobmatch": List<dynamic>.from(jobmatch!.map((x) => x.toJson())),
      };
}

class Jobmatch {
  Jobmatch({
    this.id,
  });

  int? id;

  factory Jobmatch.fromJson(Map<String, dynamic> json) => Jobmatch(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
