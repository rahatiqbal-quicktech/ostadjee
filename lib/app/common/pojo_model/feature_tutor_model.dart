class FeatureTutorModel {
  List<Featuretutors>? featuretutors;

  FeatureTutorModel({this.featuretutors});

  FeatureTutorModel.fromJson(Map<String, dynamic> json) {
    if (json['featuretutors'] != null) {
      featuretutors = <Featuretutors>[];
      json['featuretutors'].forEach((v) {
        featuretutors!.add(Featuretutors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuretutors != null) {
      data['featuretutors'] = featuretutors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Featuretutors {
  int? id;
  String? fullName;
  String? image;
  String? teacherUniversity;
  String? teacherSubject;
  int? districtId;
  Tdistrict? tdistrict;

  Featuretutors(
      {this.id,
      this.fullName,
      this.image,
      this.teacherUniversity,
      this.teacherSubject,
      this.districtId,
      this.tdistrict});

  Featuretutors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    image = json['image'];
    teacherUniversity = json['teacher_university'];
    teacherSubject = json['teacher_subject'];
    districtId = json['district_id'];
    tdistrict = json['tdistrict'] != null
        ? Tdistrict.fromJson(json['tdistrict'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['image'] = image;
    data['teacher_university'] = teacherUniversity;
    data['teacher_subject'] = teacherSubject;
    data['district_id'] = districtId;
    if (tdistrict != null) {
      data['tdistrict'] = tdistrict!.toJson();
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
