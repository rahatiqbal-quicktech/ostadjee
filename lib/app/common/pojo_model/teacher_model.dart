class TeacherModel {
  String? status;
  Teacher? teacher;

  TeacherModel({this.status, this.teacher});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    return data;
  }
}

class Teacher {
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
  String? sscCertificate;
  String? hscYear;
  String? hscInstitute;
  String? hscGroup;
  String? hscGpa;
  String? hscCertificate;
  String? honoursYear;
  String? honoursInstitute;
  String? honoursSubject;
  String? honoursGpa;
  String? honoursCertificate;
  int? divisionId;
  int? districtId;
  String? tuitionMedium;
  String? tuitionSalary;
  String? tuitionExperience;
  String? nidCard;
  String? nidCardBack;
  String? studentCard;
  String? studentCardBack;
  String? verifyToken;
  String? passResetToken;
  String? image;
  String? video;
  int? featureTutor;
  int? premiumTutor;
  int? amount;
  int? universityId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Teacher(
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
      this.nidCardBack,
      this.studentCard,
      this.studentCardBack,
      this.verifyToken,
      this.passResetToken,
      this.image,
      this.video,
      this.featureTutor,
      this.premiumTutor,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt});

  Teacher.fromJson(Map<String, dynamic> json) {
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
    sscCertificate = json['ssc_certificate'];
    hscYear = json['hsc_year'];
    hscInstitute = json['hsc_institute'];
    hscGroup = json['hsc_group'];
    hscGpa = json['hsc_gpa'];
    hscCertificate = json['hsc_certificate'];
    honoursYear = json['honours_year'];
    honoursInstitute = json['honours_institute'];
    honoursSubject = json['honours_subject'];
    honoursGpa = json['honours_gpa'];
    honoursCertificate = json['other_certificate'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    tuitionMedium = json['tuition_medium'];
    tuitionSalary = json['tuition_salary'];
    tuitionExperience = json['tuition_experience'];
    nidCard = json['nid_card'];
    nidCardBack = json['nid_card_back'];
    studentCard = json['student_card'];
    studentCardBack = json['student_card_back'];
    verifyToken = json['verifyToken'];
    passResetToken = json['passResetToken'];
    image = json['image'];
    video = json['video'];
    featureTutor = json['feature_tutor'];
    premiumTutor = json['premium_tutor'];
    amount = json['amount'];
    universityId = json['university_id'];
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
    data['ssc_certificate'] = sscCertificate;
    data['hsc_year'] = hscYear;
    data['hsc_institute'] = hscInstitute;
    data['hsc_group'] = hscGroup;
    data['hsc_gpa'] = hscGpa;
    data['hsc_certificate'] = hscCertificate;
    data['honours_year'] = honoursYear;
    data['honours_institute'] = honoursInstitute;
    data['honours_subject'] = honoursSubject;
    data['honours_gpa'] = honoursGpa;
    data['other_certificate'] = honoursCertificate;
    data['division_id'] = divisionId;
    data['district_id'] = districtId;
    data['tuition_medium'] = tuitionMedium;
    data['tuition_salary'] = tuitionSalary;
    data['tuition_experience'] = tuitionExperience;
    data['nid_card'] = nidCard;
    data['nid_card_back'] = nidCardBack;
    data['student_card'] = studentCard;
    data['student_card_back'] = studentCardBack;
    data['verifyToken'] = verifyToken;
    data['passResetToken'] = passResetToken;
    data['image'] = image;
    data['video'] = video;
    data['feature_tutor'] = featureTutor;
    data['premium_tutor'] = premiumTutor;
    data['amount'] = amount;
    data['university_id'] = universityId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
