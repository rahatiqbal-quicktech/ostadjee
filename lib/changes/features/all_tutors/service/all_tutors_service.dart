// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ostadjee/changes/features/all_tutors/model/all_tutors_model.dart';
import 'package:http/http.dart' as http;

class AllTutorsService {
  String fullUrl = "https://ostadjee.com/api/v1/all-tutor";

  Future<AllTutorsModel?> fetchAllTutors() async {
    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());
      // print("AllTutorsService fetchAllTutors service $data");

      if (response.statusCode == 200) {
        return AllTutorsModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("AllTutorsService fetchAllTutors service $e");
      return null;
    }
  }
}
