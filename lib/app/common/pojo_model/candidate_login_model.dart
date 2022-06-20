class CandidateLoginModel {
  String? status;
  String? token;

  CandidateLoginModel({this.status, this.token});

  CandidateLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['ctoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ctoken'] = token;
    return data;
  }
}
