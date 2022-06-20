class GenderModel {
  List<Genders>? genders;

  GenderModel({this.genders});

  GenderModel.fromJson(Map<String, dynamic> json) {
    if (json['genders'] != null) {
      genders = <Genders>[];
      json['genders'].forEach((v) {
        genders!.add(Genders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genders != null) {
      data['genders'] = genders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genders {
  String? value;
  String? text;

  Genders({this.value, this.text});

  Genders.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}
