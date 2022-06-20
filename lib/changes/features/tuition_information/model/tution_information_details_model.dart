// To parse this JSON data, do
//
//     final tuitionInformationDetailsModel = tuitionInformationDetailsModelFromJson(jsonString);

import 'dart:convert';

TuitionInformationDetailsModel tuitionInformationDetailsModelFromJson(
        String str) =>
    TuitionInformationDetailsModel.fromJson(json.decode(str));

String tuitionInformationDetailsModelToJson(
        TuitionInformationDetailsModel data) =>
    json.encode(data.toJson());

class TuitionInformationDetailsModel {
  TuitionInformationDetailsModel({
    this.status,
    this.teacher,
    this.tsubjects,
    this.tareas,
    this.tdepartment,
    this.tdays,
    this.tshift,
    this.tstyle,
  });

  String? status;
  Teacher? teacher;
  List<dynamic>? tsubjects;
  List<dynamic>? tareas;
  List<dynamic>? tdepartment;
  List<dynamic>? tdays;
  List<dynamic>? tshift;
  List<dynamic>? tstyle;

  factory TuitionInformationDetailsModel.fromJson(Map<String, dynamic> json) =>
      TuitionInformationDetailsModel(
        status: json["status"],
        teacher: Teacher.fromJson(json["teacher"]),
        tsubjects: List<dynamic>.from(json["tsubjects"].map((x) => x)),
        tareas: List<dynamic>.from(json["tareas"].map((x) => x)),
        tdepartment: List<dynamic>.from(json["tdepartment"].map((x) => x)),
        tdays: List<dynamic>.from(json["tdays"].map((x) => x)),
        tshift: List<dynamic>.from(json["tshift"].map((x) => x)),
        tstyle: List<dynamic>.from(json["tstyle"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "teacher": teacher?.toJson(),
        "tsubjects": List<dynamic>.from(tsubjects!.map((x) => x)),
        "tareas": List<dynamic>.from(tareas!.map((x) => x)),
        "tdepartment": List<dynamic>.from(tdepartment!.map((x) => x)),
        "tdays": List<dynamic>.from(tdays!.map((x) => x)),
        "tshift": List<dynamic>.from(tshift!.map((x) => x)),
        "tstyle": List<dynamic>.from(tstyle!.map((x) => x)),
      };
}

class Teacher {
  Teacher({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.gender,
    this.teacherUniversity,
    this.teacherSubject,
    this.teacherDegree,
    this.teacherPresentAddress,
    this.teacherPermanentAddress,
    this.aboutYourself,
    this.sscYear,
    this.sscInstitute,
    this.sscGroup,
    this.sscGpa,
    this.hscYear,
    this.hscInstitute,
    this.hscGroup,
    this.hscGpa,
    this.hscCertificate,
    this.sscCertificate,
    this.honoursYear,
    this.honoursInstitute,
    this.honoursSubject,
    this.honoursGpa,
    this.otherCertificate,
    this.divisionId,
    this.districtId,
    this.tuitionMedium,
    this.tuitionSalary,
    this.tuitionExperience,
    this.nidCard,
    this.nidCardBack,
    this.studentCard,
    this.studentCardBack,
    this.verifyToken,
    this.passResetToken,
    this.image,
    this.featureTutor,
    this.premiumTutor,
    this.amount,
    this.applylimit,
    this.latitude,
    this.longitude,
    this.universityId,
    this.departmentId,
    this.status,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? gender;
  String? teacherUniversity;
  String? teacherSubject;
  String? teacherDegree;
  String? teacherPresentAddress;
  String? teacherPermanentAddress;
  String? aboutYourself;
  dynamic sscYear;
  dynamic sscInstitute;
  dynamic sscGroup;
  dynamic sscGpa;
  dynamic hscYear;
  dynamic hscInstitute;
  dynamic hscGroup;
  dynamic hscGpa;
  dynamic hscCertificate;
  dynamic sscCertificate;
  dynamic honoursYear;
  dynamic honoursInstitute;
  dynamic honoursSubject;
  dynamic honoursGpa;
  dynamic otherCertificate;
  int? divisionId;
  int? districtId;
  dynamic tuitionMedium;
  String? tuitionSalary;
  dynamic tuitionExperience;
  dynamic nidCard;
  dynamic nidCardBack;
  dynamic studentCard;
  dynamic studentCardBack;
  String? verifyToken;
  dynamic passResetToken;
  String? image;
  dynamic featureTutor;
  dynamic premiumTutor;
  int? amount;
  int? applylimit;
  dynamic latitude;
  dynamic longitude;
  int? universityId;
  dynamic departmentId;
  int? status;
  dynamic video;
  String? createdAt;
  DateTime? updatedAt;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        teacherUniversity: json["teacher_university"],
        teacherSubject: json["teacher_subject"],
        teacherDegree: json["teacher_degree"],
        teacherPresentAddress: json["teacher_present_address"],
        teacherPermanentAddress: json["teacher_permanent_address"],
        aboutYourself: json["about_yourself"],
        sscYear: json["ssc_year"],
        sscInstitute: json["ssc_institute"],
        sscGroup: json["ssc_group"],
        sscGpa: json["ssc_gpa"],
        hscYear: json["hsc_year"],
        hscInstitute: json["hsc_institute"],
        hscGroup: json["hsc_group"],
        hscGpa: json["hsc_gpa"],
        hscCertificate: json["hsc_certificate"],
        sscCertificate: json["ssc_certificate"],
        honoursYear: json["honours_year"],
        honoursInstitute: json["honours_institute"],
        honoursSubject: json["honours_subject"],
        honoursGpa: json["honours_gpa"],
        otherCertificate: json["other_certificate"],
        divisionId: json["division_id"],
        districtId: json["district_id"],
        tuitionMedium: json["tuition_medium"],
        tuitionSalary: json["tuition_salary"],
        tuitionExperience: json["tuition_experience"],
        nidCard: json["nid_card"],
        nidCardBack: json["nid_card_back"],
        studentCard: json["student_card"],
        studentCardBack: json["student_card_back"],
        verifyToken: json["verifyToken"],
        passResetToken: json["passResetToken"],
        image: json["image"],
        featureTutor: json["feature_tutor"],
        premiumTutor: json["premium_tutor"],
        amount: json["amount"],
        applylimit: json["applylimit"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        universityId: json["university_id"],
        departmentId: json["department_id"],
        status: json["status"],
        video: json["video"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "teacher_university": teacherUniversity,
        "teacher_subject": teacherSubject,
        "teacher_degree": teacherDegree,
        "teacher_present_address": teacherPresentAddress,
        "teacher_permanent_address": teacherPermanentAddress,
        "about_yourself": aboutYourself,
        "ssc_year": sscYear,
        "ssc_institute": sscInstitute,
        "ssc_group": sscGroup,
        "ssc_gpa": sscGpa,
        "hsc_year": hscYear,
        "hsc_institute": hscInstitute,
        "hsc_group": hscGroup,
        "hsc_gpa": hscGpa,
        "hsc_certificate": hscCertificate,
        "ssc_certificate": sscCertificate,
        "honours_year": honoursYear,
        "honours_institute": honoursInstitute,
        "honours_subject": honoursSubject,
        "honours_gpa": honoursGpa,
        "other_certificate": otherCertificate,
        "division_id": divisionId,
        "district_id": districtId,
        "tuition_medium": tuitionMedium,
        "tuition_salary": tuitionSalary,
        "tuition_experience": tuitionExperience,
        "nid_card": nidCard,
        "nid_card_back": nidCardBack,
        "student_card": studentCard,
        "student_card_back": studentCardBack,
        "verifyToken": verifyToken,
        "passResetToken": passResetToken,
        "image": image,
        "feature_tutor": featureTutor,
        "premium_tutor": premiumTutor,
        "amount": amount,
        "applylimit": applylimit,
        "latitude": latitude,
        "longitude": longitude,
        "university_id": universityId,
        "department_id": departmentId,
        "status": status,
        "video": video,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
