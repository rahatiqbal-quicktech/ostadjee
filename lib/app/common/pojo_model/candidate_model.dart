class CandidateModel {
  String? status;
  Candidate? candidate;

  CandidateModel({this.status, this.candidate});

  CandidateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    candidate = json['candidate'] != null
        ? Candidate.fromJson(json['candidate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    return data;
  }
}

class Candidate {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? districtId;
  String? presentAddress;
  String? parmanentAddress;
  String? verifyToken;
  String? passResetToken;
  String? image;
  String? nid;
  String? nidBack;
  int? postlimit;
  int? status;
  String? createdAt;
  String? updatedAt;

  Candidate(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.districtId,
      this.presentAddress,
      this.parmanentAddress,
      this.verifyToken,
      this.passResetToken,
      this.image,
      this.nid,
      this.nidBack,
      this.postlimit,
      this.status,
      this.createdAt,
      this.updatedAt});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    districtId = json['district_id'];
    presentAddress = json['present_address'];
    parmanentAddress = json['parmanent_address'];
    verifyToken = json['verifyToken'];
    passResetToken = json['passResetToken'];
    image = json['image'];
    nid = json['nid'];
    nidBack = json['nid_back'];
    postlimit = json['postlimit'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['district_id'] = districtId;
    data['present_address'] = presentAddress;
    data['parmanent_address'] = parmanentAddress;
    data['verifyToken'] = verifyToken;
    data['passResetToken'] = passResetToken;
    data['image'] = image;
    data['nid'] = nid;
    data['nid_back'] = nidBack;
    data['postlimit'] = postlimit;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
