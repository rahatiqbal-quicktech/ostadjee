// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/area_model.dart';
import 'package:ostadjee/app/common/pojo_model/salary_model.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/changes/features/tuition_information/model/tuition_information_divisions_model.dart';
import 'package:http/http.dart' as http;
import 'package:ostadjee/changes/features/tuition_information/model/tution_information_details_model.dart';

class TuitionInformationService {
  Future<TuitionInformationDivisionsModel?> fetchDivisions() async {
    String fullUrl = "https://ostadjee.com/api/v1/division-tutors/";

    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return TuitionInformationDivisionsModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("TuitionInformationService fetchDivisions $e");
      return null;
    }
  }

  Future<AreaModel?> fetchArea() async {
    String fullUrl = "https://ostadjee.com/api/v1/areas";

    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return AreaModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("TuitionInformationService fetchArea $e");

      return null;
    }
  }

  Future<SalaryModel?> fetchSalary() async {
    String fullUrl = "https://ostadjee.com/api/v1/salaries/";

    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return SalaryModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("TuitionInformationService fetchSalary $e");

      return null;
    }
  }

  Future<TuitionInformationDetailsModel?> fetchDetails() async {
    String fullUrl = "https://ostadjee.com/api/v1/teacher/profile/edit";

    try {
      final response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
      });
      if (response.statusCode == 200) {
        return tuitionInformationDetailsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("TuitionInformationService fetchDetails $e");
      return null;
    }
  }
}
