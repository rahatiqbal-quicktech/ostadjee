class WithdrawListModel {
  String? status;
  List<Withdraws>? withdraws;

  WithdrawListModel({this.status, this.withdraws});

  WithdrawListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['withdraws'] != null) {
      withdraws = <Withdraws>[];
      json['withdraws'].forEach((v) {
        withdraws!.add(Withdraws.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (withdraws != null) {
      data['withdraws'] = withdraws!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Withdraws {
  int? id;
  String? title;
  int? amount;
  int? teacherId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Withdraws(
      {this.id,
      this.title,
      this.amount,
      this.teacherId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Withdraws.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    amount = json['amount'];
    teacherId = json['teacher_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['amount'] = amount;
    data['teacher_id'] = teacherId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
