class AreaModel {
  List<Areas>? areas;

  AreaModel({this.areas});

  AreaModel.fromJson(Map<String, dynamic> json) {
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        if (v.isNotEmpty) {
          areas!.add(Areas.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (areas != null) {
      data['areas'] = areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? id;
  String? text;

  Areas({this.id, this.text});

  Areas.fromJson(Map<String, dynamic> json) {
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
