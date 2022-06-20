// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ostadjee/changes/features/verification/model/tutor_details_model.dart';

class TutorVerifyService {
  Future<TutorVerifyDetailsModel?> getDetails({required String id}) async {
    String fullUrl = "https://ostadjee.com/api/v1/tutor/details/$id";

    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return TutorVerifyDetailsModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("TutorVerifyService = $e");

      return null;
    }
  }
}
