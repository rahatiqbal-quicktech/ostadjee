// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ostadjee/changes/features/featured_tutor/model/featured_tutor_model.dart';
import 'package:http/http.dart' as http;

class FeaturedTutorsService {
  String fullUrl = "https://ostadjee.com/api/v1/feature-tutors";

  Future<FeaturedTutorsModel?> fetchFeaturedTutors() async {
    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());
      // print("Featured tutors service $data");

      if (response.statusCode == 200) {
        return FeaturedTutorsModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
