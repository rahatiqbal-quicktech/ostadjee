class TimeShiftModel {
  List<Timeshifts>? timeshifts;

  TimeShiftModel({this.timeshifts});

  TimeShiftModel.fromJson(Map<String, dynamic> json) {
    if (json['timeshifts'] != null) {
      timeshifts = <Timeshifts>[];
      json['timeshifts'].forEach((v) {
        if (v.isNotEmpty) {
          timeshifts!.add(Timeshifts.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (timeshifts != null) {
      data['timeshifts'] = timeshifts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timeshifts {
  int? id;
  String? text;

  Timeshifts({this.id, this.text});

  Timeshifts.fromJson(Map<String, dynamic> json) {
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
