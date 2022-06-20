class CandidatePaymentListModel {
  String? status;
  List<Paymentlist>? paymentlist;

  CandidatePaymentListModel({this.status, this.paymentlist});

  CandidatePaymentListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['paymentlist'] != null) {
      paymentlist = <Paymentlist>[];
      json['paymentlist'].forEach((v) {
        paymentlist!.add(Paymentlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (paymentlist != null) {
      data['paymentlist'] = paymentlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paymentlist {
  int? id;
  int? jobId;
  String? title;
  int? amount;
  int? teacherId;
  int? candidateId;
  String? date;
  String? status;
  String? createdAt;
  String? updatedAt;
  Payteacher? payteacher;

  Paymentlist(
      {this.id,
      this.jobId,
      this.title,
      this.amount,
      this.teacherId,
      this.candidateId,
      this.date,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.payteacher});

  Paymentlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    title = json['title'];
    amount = json['amount'];
    teacherId = json['teacher_id'];
    candidateId = json['candidate_id'];
    date = json['date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    payteacher = json['payteacher'] != null
        ? Payteacher.fromJson(json['payteacher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['title'] = title;
    data['amount'] = amount;
    data['teacher_id'] = teacherId;
    data['candidate_id'] = candidateId;
    data['date'] = date;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (payteacher != null) {
      data['payteacher'] = payteacher!.toJson();
    }
    return data;
  }
}

class Payteacher {
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
  String? sscYear;
  String? sscInstitute;
  String? sscGroup;
  String? sscGpa;
  String? hscYear;
  String? hscInstitute;
  String? hscGroup;
  String? hscGpa;
  String? honoursYear;
  String? honoursInstitute;
  String? honoursSubject;
  String? honoursGpa;
  int? divisionId;
  int? districtId;
  String? tuitionMedium;
  String? tuitionSalary;
  String? tuitionExperience;
  String? nidCard;
  String? studentCard;
  String? verifyToken;
  String? passResetToken;
  String? image;
  int? featureTutor;
  int? premiumTutor;
  int? amount;
  String? latitude;
  String? longitude;
  int? status;
  String? createdAt;
  String? updatedAt;

  Payteacher(
      {this.id,
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
      this.honoursYear,
      this.honoursInstitute,
      this.honoursSubject,
      this.honoursGpa,
      this.divisionId,
      this.districtId,
      this.tuitionMedium,
      this.tuitionSalary,
      this.tuitionExperience,
      this.nidCard,
      this.studentCard,
      this.verifyToken,
      this.passResetToken,
      this.image,
      this.featureTutor,
      this.premiumTutor,
      this.amount,
      this.latitude,
      this.longitude,
      this.status,
      this.createdAt,
      this.updatedAt});

  Payteacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    gender = json['gender'];
    teacherUniversity = json['teacher_university'];
    teacherSubject = json['teacher_subject'];
    teacherDegree = json['teacher_degree'];
    teacherPresentAddress = json['teacher_present_address'];
    teacherPermanentAddress = json['teacher_permanent_address'];
    aboutYourself = json['about_yourself'];
    sscYear = json['ssc_year'];
    sscInstitute = json['ssc_institute'];
    sscGroup = json['ssc_group'];
    sscGpa = json['ssc_gpa'];
    hscYear = json['hsc_year'];
    hscInstitute = json['hsc_institute'];
    hscGroup = json['hsc_group'];
    hscGpa = json['hsc_gpa'];
    honoursYear = json['honours_year'];
    honoursInstitute = json['honours_institute'];
    honoursSubject = json['honours_subject'];
    honoursGpa = json['honours_gpa'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    tuitionMedium = json['tuition_medium'];
    tuitionSalary = json['tuition_salary'];
    tuitionExperience = json['tuition_experience'];
    nidCard = json['nid_card'];
    studentCard = json['student_card'];
    verifyToken = json['verifyToken'];
    passResetToken = json['passResetToken'];
    image = json['image'];
    featureTutor = json['feature_tutor'];
    premiumTutor = json['premium_tutor'];
    amount = json['amount'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['teacher_university'] = teacherUniversity;
    data['teacher_subject'] = teacherSubject;
    data['teacher_degree'] = teacherDegree;
    data['teacher_present_address'] = teacherPresentAddress;
    data['teacher_permanent_address'] = teacherPermanentAddress;
    data['about_yourself'] = aboutYourself;
    data['ssc_year'] = sscYear;
    data['ssc_institute'] = sscInstitute;
    data['ssc_group'] = sscGroup;
    data['ssc_gpa'] = sscGpa;
    data['hsc_year'] = hscYear;
    data['hsc_institute'] = hscInstitute;
    data['hsc_group'] = hscGroup;
    data['hsc_gpa'] = hscGpa;
    data['honours_year'] = honoursYear;
    data['honours_institute'] = honoursInstitute;
    data['honours_subject'] = honoursSubject;
    data['honours_gpa'] = honoursGpa;
    data['division_id'] = divisionId;
    data['district_id'] = districtId;
    data['tuition_medium'] = tuitionMedium;
    data['tuition_salary'] = tuitionSalary;
    data['tuition_experience'] = tuitionExperience;
    data['nid_card'] = nidCard;
    data['student_card'] = studentCard;
    data['verifyToken'] = verifyToken;
    data['passResetToken'] = passResetToken;
    data['image'] = image;
    data['feature_tutor'] = featureTutor;
    data['premium_tutor'] = premiumTutor;
    data['amount'] = amount;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
