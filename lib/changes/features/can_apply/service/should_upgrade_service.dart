// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/changes/features/can_apply/model/job_apply_count_model.dart';
import 'package:ostadjee/changes/features/can_apply/model/should_upgrade_apply_limit_model.dart';

class ShouldUpgradeService {
  //
  Future<ShouldUpgradeApplyLimitModel?> fetchApplyLimit() async {
    //
    // String fullUrl = "https://ostadjee.com/api/v1/tutor/details/$id";
    String fullUrl = "https://ostadjee.com/api/v1/teacher/profile/edit";

    try {
      final response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
      });
      if (response.statusCode == 200) {
        return shouldUpgradeApplyLimitModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("fetchApplyLimit");
      print(e);
      return null;
    }
  }

  Future<JobApplyCountModel?> fetchTotalApply() async {
    //
    String fullUrl = "https://ostadjee.com/api/v1/teacher/jobapply/count";

    try {
      final response = await http.get(
        Uri.parse(fullUrl),
        headers: {
          'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
        },
      );
      if (response.statusCode == 200) {
        return jobApplyCountModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("fetchApplyCount");
      print(e);
      return null;
    }
  }
}
