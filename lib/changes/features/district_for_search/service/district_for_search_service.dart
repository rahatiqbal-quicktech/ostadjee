import 'dart:convert';

import 'package:ostadjee/changes/features/district_for_search/model/district_for_search_model.dart';
import 'package:http/http.dart' as http;

class DistrictForSearchService {
  String fullUrl = "https://ostadjee.com/api/v1/districts/";

  Future<DistrictForSearchModel?> getDistricts() async {
    try {
      final response = await http.get(
        Uri.parse(fullUrl),
      );
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        return DistrictForSearchModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print("DistrictForSearchService $e");
      return null;
    }
  }
}
