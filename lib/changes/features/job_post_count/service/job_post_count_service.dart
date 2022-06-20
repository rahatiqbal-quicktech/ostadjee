import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/changes/features/job_post_count/model/job_post_count_model.dart';

class JobPostCountService {
  String fullUrl = "https://ostadjee.com/api/v1/my-jobpost";

  Future<JobPostCountModel?> fetchJobPostCount() async {
    final response = await http.get(Uri.parse(fullUrl), headers: {
      'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
    });
    var data = jsonDecode(response.body.toString());
    // print("job post count service $data");

    if (response.statusCode == 200) {
      return JobPostCountModel.fromJson(data);
    } else {
      return null;
    }
  }
}
