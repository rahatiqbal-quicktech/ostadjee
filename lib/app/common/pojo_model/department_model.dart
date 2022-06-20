class DepartmentModel {
  List<Departments>? departments;

  DepartmentModel({this.departments});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        if (v.isNotEmpty) {
          departments!.add(Departments.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? id;
  String? text;

  Departments({this.id, this.text});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
