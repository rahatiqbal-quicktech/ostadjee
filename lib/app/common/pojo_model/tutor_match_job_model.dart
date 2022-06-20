class TutorMatchJobModel {
  String? status;
  List<Jobmatch>? jobmatch;

  TutorMatchJobModel({this.status, this.jobmatch});

  TutorMatchJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['jobmatch'] != null) {
      jobmatch = <Jobmatch>[];
      json['jobmatch'].forEach((v) {
        jobmatch!.add(Jobmatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (jobmatch != null) {
      data['jobmatch'] = jobmatch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobmatch {
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

  Jobmatch(
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

  Jobmatch.fromJson(Map<String, dynamic> json) {
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
