class TutorLoginModel {
  String? status;
  String? token;

  TutorLoginModel({this.status, this.token});

  TutorLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    return data;
  }
}
