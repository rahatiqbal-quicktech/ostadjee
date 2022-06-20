// To parse this JSON data, do
//
//     final tutorJobsListModel = tutorJobsListModelFromJson(jsonString);

import 'dart:convert';

TutorJobsListModel tutorJobsListModelFromJson(String str) =>
    TutorJobsListModel.fromJson(json.decode(str));

String tutorJobsListModelToJson(TutorJobsListModel data) =>
    json.encode(data.toJson());

class TutorJobsListModel {
  TutorJobsListModel({
    this.jobs,
    this.maletutors,
    this.femaletutors,
  });

  Jobs? jobs;
  int? maletutors;
  int? femaletutors;

  factory TutorJobsListModel.fromJson(Map<String, dynamic> json) =>
      TutorJobsListModel(
        jobs: Jobs.fromJson(json["jobs"]),
        maletutors: json["maletutors"],
        femaletutors: json["femaletutors"],
      );

  Map<String, dynamic> toJson() => {
        "jobs": jobs?.toJson(),
        "maletutors": maletutors,
        "femaletutors": femaletutors,
      };
}

class Jobs {
  Jobs({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
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
    this.jmedium,
    this.jdepartment,
    this.jsalary,
    this.jsubject,
    this.jdays,
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
  int? universityId;
  String? status;
  int? request;
  String? createdAt;
  DateTime? updatedAt;
  Jmedium? jmedium;
  Jdepartment? jdepartment;
  Jdays? jsalary;
  dynamic jsubject;
  Jdays? jdays;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        candidateId: json["candidate_id"],
        title: json["title"],
        fullName: json["fullName"],
        college: json["college"],
        sGender: json["s_gender"],
        mediumId: json["medium_id"],
        departmentId: json["department_id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
        districtId: json["district_id"],
        areaId: json["area_id"],
        address: json["address"],
        genderId: json["gender_id"] == null ? null : json["gender_id"],
        subjectId: json["subject_id"],
        dayweek: json["dayweek"],
        salary: json["salary"],
        extranote: json["extranote"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        universityId:
            json["university_id"] == null ? null : json["university_id"],
        status: json["status"],
        request: json["request"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        jmedium: Jmedium.fromJson(json["jmedium"]),
        jdepartment: Jdepartment.fromJson(json["jdepartment"]),
        jsalary: Jdays.fromJson(json["jsalary"]),
        jsubject: json["jsubject"],
        jdays: Jdays.fromJson(json["jdays"]),
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
        "email": email == null ? null : email,
        "district_id": districtId,
        "area_id": areaId,
        "address": address,
        "gender_id": genderId == null ? null : genderId,
        "subject_id": subjectId,
        "dayweek": dayweek,
        "salary": salary,
        "extranote": extranote,
        "latitude": latitude,
        "longitude": longitude,
        "university_id": universityId == null ? null : universityId,
        "status": status,
        "request": request,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "jmedium": jmedium?.toJson(),
        "jdepartment": jdepartment?.toJson(),
        "jsalary": jsalary?.toJson(),
        "jsubject": jsubject,
        "jdays": jdays?.toJson(),
      };
}

class Jdays {
  Jdays({
    this.id,
    this.dayweek,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.salary,
  });

  int? id;
  String? dayweek;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? salary;

  factory Jdays.fromJson(Map<String, dynamic> json) => Jdays(
        id: json["id"],
        dayweek: json["dayweek"] == null ? null : json["dayweek"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        salary: json["salary"] == null ? null : json["salary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dayweek": dayweek == null ? null : dayweek,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "salary": salary == null ? null : salary,
      };
}

class Jdepartment {
  Jdepartment({
    this.id,
    this.mediumId,
    this.departmentName,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? mediumId;
  String? departmentName;
  String? slug;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Jdepartment.fromJson(Map<String, dynamic> json) => Jdepartment(
        id: json["id"],
        mediumId: json["medium_id"],
        departmentName: json["departmentName"],
        slug: json["slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "medium_id": mediumId,
        "departmentName": departmentName,
        "slug": slug,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Jmedium {
  Jmedium({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Jmedium.fromJson(Map<String, dynamic> json) => Jmedium(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
