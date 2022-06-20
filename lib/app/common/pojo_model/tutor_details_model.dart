class TutorDetailsModel {
  Tutordetails? tutordetails;

  TutorDetailsModel({this.tutordetails});

  TutorDetailsModel.fromJson(Map<String, dynamic> json) {
    tutordetails = json['tutordetails'] != null
        ? Tutordetails.fromJson(json['tutordetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tutordetails != null) {
      data['tutordetails'] = tutordetails!.toJson();
    }
    return data;
  }
}

class Tutordetails {
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
  int? status;
  String? createdAt;
  String? updatedAt;
  Tdistrict? tdistrict;
  List<Tareas>? tareas;
  List<Tsubjects>? tsubjects;
  Tsalary? tsalary;
  List<Tdays>? tdays;
  List<Tshifts>? tshifts;
  Tmedium? tmedium;
  List<Tdepartments>? tdepartments;

  Tutordetails(
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
      this.status,
      this.createdAt,
      this.updatedAt,
      this.tdistrict,
      this.tareas,
      this.tsubjects,
      this.tsalary,
      this.tdays,
      this.tshifts,
      this.tmedium,
      this.tdepartments});

  Tutordetails.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tdistrict = json['tdistrict'] != null
        ? Tdistrict.fromJson(json['tdistrict'])
        : null;
    if (json['tareas'] != null) {
      tareas = <Tareas>[];
      json['tareas'].forEach((v) {
        tareas!.add(Tareas.fromJson(v));
      });
    }
    if (json['tsubjects'] != null) {
      tsubjects = <Tsubjects>[];
      json['tsubjects'].forEach((v) {
        tsubjects!.add(Tsubjects.fromJson(v));
      });
    }
    tsalary =
        json['tsalary'] != null ? Tsalary.fromJson(json['tsalary']) : null;
    if (json['tdays'] != null) {
      tdays = <Tdays>[];
      json['tdays'].forEach((v) {
        tdays!.add(Tdays.fromJson(v));
      });
    }
    if (json['tshifts'] != null) {
      tshifts = <Tshifts>[];
      json['tshifts'].forEach((v) {
        tshifts!.add(Tshifts.fromJson(v));
      });
    }
    tmedium =
        json['tmedium'] != null ? Tmedium.fromJson(json['tmedium']) : null;
    if (json['tdepartments'] != null) {
      tdepartments = <Tdepartments>[];
      json['tdepartments'].forEach((v) {
        tdepartments!.add(Tdepartments.fromJson(v));
      });
    }
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
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tdistrict != null) {
      data['tdistrict'] = tdistrict!.toJson();
    }
    if (tareas != null) {
      data['tareas'] = tareas!.map((v) => v.toJson()).toList();
    }
    if (tsubjects != null) {
      data['tsubjects'] = tsubjects!.map((v) => v.toJson()).toList();
    }
    if (tsalary != null) {
      data['tsalary'] = tsalary!.toJson();
    }
    if (tdays != null) {
      data['tdays'] = tdays!.map((v) => v.toJson()).toList();
    }
    if (tshifts != null) {
      data['tshifts'] = tshifts!.map((v) => v.toJson()).toList();
    }
    if (tmedium != null) {
      data['tmedium'] = tmedium!.toJson();
    }
    if (tdepartments != null) {
      data['tdepartments'] = tdepartments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tdistrict {
  int? id;
  int? divisionId;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  Tdistrict(
      {this.id,
      this.divisionId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  Tdistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['division_id'] = divisionId;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tareas {
  int? id;
  int? districtId;
  String? area;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tareas(
      {this.id,
      this.districtId,
      this.area,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tareas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    area = json['area'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['district_id'] = districtId;
    data['area'] = area;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? teacherId;
  int? areaId;
  String? createdAt;
  String? updatedAt;

  Pivot({this.teacherId, this.areaId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    areaId = json['area_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['area_id'] = areaId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tsubjects {
  int? id;
  int? departmentId;
  String? subjectName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot2? pivot;

  Tsubjects(
      {this.id,
      this.departmentId,
      this.subjectName,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tsubjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    subjectName = json['subjectName'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot2.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['department_id'] = departmentId;
    data['subjectName'] = subjectName;
    data['slug'] = slug;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot2 {
  int? teacherId;
  int? subjectId;
  String? createdAt;
  String? updatedAt;

  Pivot2({this.teacherId, this.subjectId, this.createdAt, this.updatedAt});

  Pivot2.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['subject_id'] = subjectId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tsalary {
  int? id;
  String? salary;
  int? status;
  String? createdAt;
  String? updatedAt;

  Tsalary({this.id, this.salary, this.status, this.createdAt, this.updatedAt});

  Tsalary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salary = json['salary'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['salary'] = salary;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tdays {
  int? id;
  String? dayweek;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot3? pivot;

  Tdays(
      {this.id,
      this.dayweek,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tdays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayweek = json['dayweek'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot3.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayweek'] = dayweek;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot3 {
  int? teacherId;
  int? daysperweekId;
  String? createdAt;
  String? updatedAt;

  Pivot3({this.teacherId, this.daysperweekId, this.createdAt, this.updatedAt});

  Pivot3.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    daysperweekId = json['daysperweek_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['daysperweek_id'] = daysperweekId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tshifts {
  int? id;
  String? shiftname;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot4? pivot;

  Tshifts(
      {this.id,
      this.shiftname,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tshifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shiftname = json['shiftname'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot4.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shiftname'] = shiftname;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot4 {
  int? teacherId;
  int? timeshiftId;
  String? createdAt;
  String? updatedAt;

  Pivot4({this.teacherId, this.timeshiftId, this.createdAt, this.updatedAt});

  Pivot4.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    timeshiftId = json['timeshift_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['timeshift_id'] = timeshiftId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tmedium {
  int? id;
  String? name;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Tmedium(
      {this.id,
      this.name,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt});

  Tmedium.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tdepartments {
  int? id;
  int? mediumId;
  String? departmentName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot5? pivot;

  Tdepartments(
      {this.id,
      this.mediumId,
      this.departmentName,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tdepartments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediumId = json['medium_id'];
    departmentName = json['departmentName'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot5.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medium_id'] = mediumId;
    data['departmentName'] = departmentName;
    data['slug'] = slug;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot5 {
  int? teacherId;
  int? departmentId;
  String? createdAt;
  String? updatedAt;

  Pivot5({this.teacherId, this.departmentId, this.createdAt, this.updatedAt});

  Pivot5.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
