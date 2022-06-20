import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ostadjee/changes/features/tutor_department/model/tutor_department_model.dart';

class TutorDepartmentService {
  String fullUrl = "https://ostadjee.com/api/v1/tutor-departments";

  Future<TutorDepartmentModel?> fetchTutorDepartments() async {
    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());
      print("TutorDepartmentModel $data");

      if (response.statusCode == 200) {
        return TutorDepartmentModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
