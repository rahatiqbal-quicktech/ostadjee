class DivisionModel {
  List<Divisions>? divisions;

  DivisionModel({this.divisions});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(Divisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divisions {
  int? id;
  String? text;

  Divisions({this.id, this.text});

  Divisions.fromJson(Map<String, dynamic> json) {
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
