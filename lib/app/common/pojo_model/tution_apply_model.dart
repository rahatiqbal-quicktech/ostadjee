class TutionApplyModel {
  String? status;
  List<Tutionapply>? tutionapply;

  TutionApplyModel({this.status, this.tutionapply});

  TutionApplyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['tutionapply'] != null) {
      tutionapply = <Tutionapply>[];
      json['tutionapply'].forEach((v) {
        tutionapply!.add(Tutionapply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (tutionapply != null) {
      data['tutionapply'] = tutionapply!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tutionapply {
  int? id;
  int? jobId;
  int? teacherId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Tapplyjob? tapplyjob;

  Tutionapply(
      {this.id,
      this.jobId,
      this.teacherId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.tapplyjob});

  Tutionapply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    teacherId = json['teacher_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    if (tapplyjob != null) {
      data['tapplyjob'] = tapplyjob!.toJson();
    }
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
    data['status'] = status;
    data['request'] = request;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
