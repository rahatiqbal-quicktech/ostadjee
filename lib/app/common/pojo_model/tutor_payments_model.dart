class TutorPaymentsModel {
  String? status;
  List<Payments>? payments;

  TutorPaymentsModel({this.status, this.payments});

  TutorPaymentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  int? id;
  int? jobId;
  String? title;
  int? amount;
  int? teacherId;
  int? candidateId;
  String? date;
  String? status;
  String? createdAt;
  String? updatedAt;
  Paycandidate? paycandidate;

  Payments(
      {this.id,
      this.jobId,
      this.title,
      this.amount,
      this.teacherId,
      this.candidateId,
      this.date,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.paycandidate});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    title = json['title'];
    amount = json['amount'];
    teacherId = json['teacher_id'];
    candidateId = json['candidate_id'];
    date = json['date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paycandidate = json['paycandidate'] != null
        ? Paycandidate.fromJson(json['paycandidate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['title'] = title;
    data['amount'] = amount;
    data['teacher_id'] = teacherId;
    data['candidate_id'] = candidateId;
    data['date'] = date;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (paycandidate != null) {
      data['paycandidate'] = paycandidate!.toJson();
    }
    return data;
  }
}

class Paycandidate {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  int? districtId;
  String? presentAddress;
  String? parmanentAddress;
  String? verifyToken;
  String? passResetToken;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Paycandidate(
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
      this.status,
      this.createdAt,
      this.updatedAt});

  Paycandidate.fromJson(Map<String, dynamic> json) {
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
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
