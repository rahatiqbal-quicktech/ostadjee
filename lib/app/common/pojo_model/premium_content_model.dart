class PremiumContentModel {
  List<Contents>? contents;

  PremiumContentModel({this.contents});

  PremiumContentModel.fromJson(Map<String, dynamic> json) {
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(Contents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contents != null) {
      data['contents'] = contents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contents {
  int? id;
  String? title;
  String? description;
  int? amount;
  int? status;
  String? createdAt;
  String? updatedAt;

  Contents(
      {this.id,
      this.title,
      this.description,
      this.amount,
      this.status,
      this.createdAt,
      this.updatedAt});

  Contents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['amount'] = amount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
