// ignore_for_file: prefer_typing_uninitialized_variables

class CandidateOverview {
  String? status;
  int? totalpost;
  int? totaltutor;
  var totalpayment;

  CandidateOverview(
      {this.status, this.totalpost, this.totaltutor, this.totalpayment});

  CandidateOverview.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalpost = json['totalpost'];
    totaltutor = json['totaltutor'];
    totalpayment = json['totalpayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalpost'] = totalpost;
    data['totaltutor'] = totaltutor;
    data['totalpayment'] = totalpayment;
    return data;
  }
}
