class TutorModel {
  Tutors? tutors;

  TutorModel({this.tutors});

  TutorModel.fromJson(Map<String, dynamic> json) {
    tutors = json['tutors'] != null ? Tutors.fromJson(json['tutors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tutors != null) {
      data['tutors'] = tutors!.toJson();
    }
    return data;
  }
}

class Tutors {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Tutors(
      {this.currentPage,
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
      this.total});

  Tutors.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
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

  Data(
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
      this.tsubjects});

  Data.fromJson(Map<String, dynamic> json) {
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
