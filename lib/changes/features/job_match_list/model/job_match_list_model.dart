// To parse this JSON data, do
//
//     final jobMatchListModel = jobMatchListModelFromJson(jsonString);

import 'dart:convert';

JobMatchListModel jobMatchListModelFromJson(String str) =>
    JobMatchListModel.fromJson(json.decode(str));

String jobMatchListModelToJson(JobMatchListModel data) =>
    json.encode(data.toJson());

class JobMatchListModel {
  JobMatchListModel({
    this.status,
    this.jobmatch,
  });

  String? status;
  List<Jobmatch>? jobmatch;

  factory JobMatchListModel.fromJson(Map<String, dynamic> json) =>
      JobMatchListModel(
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
    this.candidateId,
    this.title,
    this.fullName,
    this.college,
    this.sGender,
    this.mediumId,
    this.departmentId,
    this.phoneNumber,
    this.email,
    this.districtId,
    this.areaId,
    this.address,
    this.genderId,
    this.subjectId,
    this.dayweek,
    this.salary,
    this.extranote,
    this.latitude,
    this.longitude,
    this.universityId,
    this.status,
    this.request,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? candidateId;
  String? title;
  String? fullName;
  String? college;
  String? sGender;
  String? mediumId;
  String? departmentId;
  String? phoneNumber;
  String? email;
  String? districtId;
  String? areaId;
  String? address;
  String? genderId;
  dynamic subjectId;
  String? dayweek;
  String? salary;
  String? extranote;
  dynamic latitude;
  dynamic longitude;
  dynamic universityId;
  String? status;
  int? request;
  String? createdAt;
  DateTime? updatedAt;

  factory Jobmatch.fromJson(Map<String, dynamic> json) => Jobmatch(
        id: json["id"],
        candidateId: json["candidate_id"],
        title: json["title"],
        fullName: json["fullName"],
        college: json["college"],
        sGender: json["s_gender"],
        mediumId: json["medium_id"],
        departmentId: json["department_id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        districtId: json["district_id"],
        areaId: json["area_id"],
        address: json["address"],
        genderId: json["gender_id"],
        subjectId: json["subject_id"],
        dayweek: json["dayweek"],
        salary: json["salary"],
        extranote: json["extranote"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        universityId: json["university_id"],
        status: json["status"],
        request: json["request"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "candidate_id": candidateId,
        "title": title,
        "fullName": fullName,
        "college": college,
        "s_gender": sGender,
        "medium_id": mediumId,
        "department_id": departmentId,
        "phoneNumber": phoneNumber,
        "email": email,
        "district_id": districtId,
        "area_id": areaId,
        "address": address,
        "gender_id": genderId,
        "subject_id": subjectId,
        "dayweek": dayweek,
        "salary": salary,
        "extranote": extranote,
        "latitude": latitude,
        "longitude": longitude,
        "university_id": universityId,
        "status": status,
        "request": request,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
