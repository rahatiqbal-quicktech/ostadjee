class MediumModel {
  List<Mediums>? mediums;

  MediumModel({this.mediums});

  MediumModel.fromJson(Map<String, dynamic> json) {
    if (json['mediums'] != null) {
      mediums = <Mediums>[];
      json['mediums'].forEach((v) {
        if (v.isNotEmpty) {
          mediums!.add(Mediums.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mediums != null) {
      data['mediums'] = mediums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mediums {
  int? id;
  String? text;

  Mediums({this.id, this.text});

  Mediums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}
