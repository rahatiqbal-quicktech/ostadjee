class SalaryModel {
  List<Salaries>? salaries;

  SalaryModel({this.salaries});

  SalaryModel.fromJson(Map<String, dynamic> json) {
    if (json['salaries'] != null) {
      salaries = <Salaries>[];
      json['salaries'].forEach((v) {
        salaries!.add(Salaries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (salaries != null) {
      data['salaries'] = salaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Salaries {
  int? id;
  String? salary;
  int? status;
  String? createdAt;
  String? updatedAt;

  Salaries({this.id, this.salary, this.status, this.createdAt, this.updatedAt});

  Salaries.fromJson(Map<String, dynamic> json) {
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
