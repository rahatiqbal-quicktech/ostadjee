class JobApplyListModel {
  String? status;
  List<Applylist>? applylist;

  JobApplyListModel({this.status, this.applylist});

  JobApplyListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['applylist'] != null) {
      applylist = <Applylist>[];
      json['applylist'].forEach((v) {
        applylist!.add(Applylist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (applylist != null) {
      data['applylist'] = applylist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Applylist {
  int? id;
  int? jobId;
  int? teacherId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Applyteacher? applyteacher;
  Tapplyjob? tapplyjob;

  Applylist(
      {this.id,
      this.jobId,
      this.teacherId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.applyteacher,
      this.tapplyjob});

  Applylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    teacherId = json['teacher_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    applyteacher = json['applyteacher'] != null
        ? Applyteacher.fromJson(json['applyteacher'])
        : null;
    tapplyjob = json['tapplyjob'] != null
        ? Tapplyjob.fromJson(json['tapplyjob'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['teacher_id'] = teacherId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (applyteacher != null) {
      data['applyteacher'] = applyteacher!.toJson();
    }
    if (tapplyjob != null) {
      data['tapplyjob'] = tapplyjob!.toJson();
    }
    return data;
  }
}

class Applyteacher {
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
  String? video;
  String? createdAt;
  String? updatedAt;

  Applyteacher(
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
      this.video,
      this.createdAt,
      this.updatedAt});

  Applyteacher.fromJson(Map<String, dynamic> json) {
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
    video = json['video'];
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
    data['video'] = video;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tapplyjob {
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
  String? subjectId;
  String? dayweek;
  String? salary;
  String? extranote;
  String? latitude;
  String? longitude;
  int? universityId;
  String? status;
  int? request;
  String? createdAt;
  String? updatedAt;

  Tapplyjob(
      {this.id,
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
      this.updatedAt});

  Tapplyjob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    title = json['title'];
    fullName = json['fullName'];
    college = json['college'];
    sGender = json['s_gender'];
    mediumId = json['medium_id'];
    departmentId = json['department_id'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    districtId = json['district_id'];
    areaId = json['area_id'];
    address = json['address'];
    genderId = json['gender_id'];
    subjectId = json['subject_id'];
    dayweek = json['dayweek'];
    salary = json['salary'];
    extranote = json['extranote'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    universityId = json['university_id'];
    status = json['status'];
    request = json['request'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['candidate_id'] = candidateId;
    data['title'] = title;
    data['fullName'] = fullName;
    data['college'] = college;
    data['s_gender'] = sGender;
    data['medium_id'] = mediumId;
    data['department_id'] = departmentId;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['district_id'] = districtId;
    data['area_id'] = areaId;
    data['address'] = address;
    data['gender_id'] = genderId;
    data['subject_id'] = subjectId;
    data['dayweek'] = dayweek;
    data['salary'] = salary;
    data['extranote'] = extranote;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['university_id'] = universityId;
    data['status'] = status;
    data['request'] = request;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
