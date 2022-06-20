class UniversityModel {
  List<Universities>? universities;

  UniversityModel({this.universities});

  UniversityModel.fromJson(Map<String, dynamic> json) {
    if (json['universities'] != null) {
      universities = <Universities>[];
      json['universities'].forEach((v) {
        if (v.isNotEmpty) {
          universities!.add(Universities.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (universities != null) {
      data['universities'] = universities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Universities {
  int? id;
  String? text;

  Universities({this.id, this.text});

  Universities.fromJson(Map<String, dynamic> json) {
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
