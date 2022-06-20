class TutionJobsModel {
  Jobs? jobs;
  int? maletutors;
  int? femaletutors;

  TutionJobsModel({this.jobs, this.maletutors, this.femaletutors});

  TutionJobsModel.fromJson(Map<String, dynamic> json) {
    jobs = json['jobs'] != null ? Jobs.fromJson(json['jobs']) : null;
    maletutors = json['maletutors'];
    femaletutors = json['femaletutors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobs != null) {
      data['jobs'] = jobs!.toJson();
    }
    data['maletutors'] = maletutors;
    data['femaletutors'] = femaletutors;
    return data;
  }
}

class Jobs {
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

  Jobs(
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

  Jobs.fromJson(Map<String, dynamic> json) {
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
  String? status;
  int? request;
  String? createdAt;
  String? updatedAt;
  Jmedium? jmedium;
  Jdepartment? jdepartment;
  Jsalary? jsalary;
  Jsubject? jsubject;
  Jdays? jdays;

  Data(
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
      this.status,
      this.request,
      this.createdAt,
      this.updatedAt,
      this.jmedium,
      this.jdepartment,
      this.jsalary,
      this.jsubject,
      this.jdays});

  Data.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    request = json['request'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jmedium =
        json['jmedium'] != null ? Jmedium.fromJson(json['jmedium']) : null;
    jdepartment = json['jdepartment'] != null
        ? Jdepartment.fromJson(json['jdepartment'])
        : null;
    jsalary =
        json['jsalary'] != null ? Jsalary.fromJson(json['jsalary']) : null;
    jsubject =
        json['jsubject'] != null ? Jsubject.fromJson(json['jsubject']) : null;
    jdays = json['jdays'] != null ? Jdays.fromJson(json['jdays']) : null;
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
    data['status'] = status;
    data['request'] = request;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (jmedium != null) {
      data['jmedium'] = jmedium!.toJson();
    }
    if (jdepartment != null) {
      data['jdepartment'] = jdepartment!.toJson();
    }
    if (jsalary != null) {
      data['jsalary'] = jsalary!.toJson();
    }
    if (jsubject != null) {
      data['jsubject'] = jsubject!.toJson();
    }
    if (jdays != null) {
      data['jdays'] = jdays!.toJson();
    }
    return data;
  }
}

class Jmedium {
  int? id;
  String? name;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Jmedium(
      {this.id,
      this.name,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt});

  Jmedium.fromJson(Map<String, dynamic> json) {
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

class Jdepartment {
  int? id;
  int? mediumId;
  String? departmentName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Jdepartment(
      {this.id,
      this.mediumId,
      this.departmentName,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt});

  Jdepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediumId = json['medium_id'];
    departmentName = json['departmentName'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}

class Jsalary {
  int? id;
  String? salary;
  int? status;
  String? createdAt;
  String? updatedAt;

  Jsalary({this.id, this.salary, this.status, this.createdAt, this.updatedAt});

  Jsalary.fromJson(Map<String, dynamic> json) {
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

class Jsubject {
  int? id;
  int? departmentId;
  String? subjectName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Jsubject(
      {this.id,
      this.departmentId,
      this.subjectName,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt});

  Jsubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    subjectName = json['subjectName'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}

class Jdays {
  int? id;
  String? dayweek;
  int? status;
  String? createdAt;
  String? updatedAt;

  Jdays({this.id, this.dayweek, this.status, this.createdAt, this.updatedAt});

  Jdays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayweek = json['dayweek'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayweek'] = dayweek;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
