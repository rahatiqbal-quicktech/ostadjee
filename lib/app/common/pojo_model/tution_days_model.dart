class TutionDaysModel {
  List<Tutiondays>? tutiondays;

  TutionDaysModel({this.tutiondays});

  TutionDaysModel.fromJson(Map<String, dynamic> json) {
    if (json['tutiondays'] != null) {
      tutiondays = <Tutiondays>[];
      json['tutiondays'].forEach((v) {
        if (v.isNotEmpty) {
          tutiondays!.add(Tutiondays.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tutiondays != null) {
      data['tutiondays'] = tutiondays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tutiondays {
  int? id;
  String? text;

  Tutiondays({this.id, this.text});

  Tutiondays.fromJson(Map<String, dynamic> json) {
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
