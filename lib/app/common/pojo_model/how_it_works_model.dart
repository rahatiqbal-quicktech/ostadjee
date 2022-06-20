class HowItWorksModel {
  List<Faq>? teacherfaq;
  List<Faq>? candidatefaq;

  HowItWorksModel({this.teacherfaq, this.candidatefaq});

  HowItWorksModel.fromJson(Map<String, dynamic> json) {
    if (json['teacherfaq'] != null) {
      teacherfaq = <Faq>[];
      json['teacherfaq'].forEach((v) {
        teacherfaq!.add(Faq.fromJson(v));
      });
    }
    if (json['candidatefaq'] != null) {
      candidatefaq = <Faq>[];
      json['candidatefaq'].forEach((v) {
        candidatefaq!.add(Faq.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacherfaq != null) {
      data['teacherfaq'] = teacherfaq!.map((v) => v.toJson()).toList();
    }
    if (candidatefaq != null) {
      data['candidatefaq'] = candidatefaq!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faq {
  int? id;
  String? type;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Faq(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
