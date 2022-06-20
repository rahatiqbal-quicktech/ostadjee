class DivisionTutorModel {
  List<Divisiontutors>? divisiontutors;

  DivisionTutorModel({this.divisiontutors});

  DivisionTutorModel.fromJson(Map<String, dynamic> json) {
    if (json['divisiontutors'] != null) {
      divisiontutors = <Divisiontutors>[];
      json['divisiontutors'].forEach((v) {
        divisiontutors!.add(Divisiontutors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (divisiontutors != null) {
      data['divisiontutors'] = divisiontutors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divisiontutors {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? divisiontutorsCount;

  Divisiontutors(
      {this.id,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.divisiontutorsCount});

  Divisiontutors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    divisiontutorsCount = json['divisiontutors_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['divisiontutors_count'] = divisiontutorsCount;
    return data;
  }
}
