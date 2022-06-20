// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/changes/features/job_match_list/model/job_match_list_model.dart';

class JobMatchListService {
  String fullUrl = "https://ostadjee.com/api/v1/teacher/jobmatch/list";

  Future<JobMatchListModel?> fetchList() async {
    try {
      final response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
      });
      var data = jsonDecode(response.body.toString());
      print("job match list service $data");

      if (response.statusCode == 200) {
        return JobMatchListModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
