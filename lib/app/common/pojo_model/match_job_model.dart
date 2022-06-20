class MatchJobModel {
  String? status;
  int? jobmatch;

  MatchJobModel({this.status, this.jobmatch});

  MatchJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    jobmatch = json['jobmatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['jobmatch'] = jobmatch;
    return data;
  }
}
