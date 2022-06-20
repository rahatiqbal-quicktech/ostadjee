class SliderModel {
  List<Sliders>? sliders;

  SliderModel({this.sliders});

  SliderModel.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  int? id;
  String? burl;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Sliders(
      {this.id,
      this.burl,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    burl = json['burl'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['burl'] = burl;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
