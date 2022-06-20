class SocialIconsModel {
  List<Socialicons>? socialicons;

  SocialIconsModel({this.socialicons});

  SocialIconsModel.fromJson(Map<String, dynamic> json) {
    if (json['socialicons'] != null) {
      socialicons = <Socialicons>[];
      json['socialicons'].forEach((v) {
        socialicons!.add(Socialicons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (socialicons != null) {
      data['socialicons'] = socialicons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Socialicons {
  int? id;
  String? name;
  String? icon;
  String? link;
  int? status;
  String? createdAt;
  String? updatedAt;

  Socialicons(
      {this.id,
        this.name,
        this.icon,
        this.link,
        this.status,
        this.createdAt,
        this.updatedAt});

  Socialicons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['link'] = link;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
