// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:ostadjee/changes/features/can_apply/service/job_match_list_service.dart';
import 'package:ostadjee/changes/features/can_apply/service/should_upgrade_service.dart';

class CanApplyFunction extends GetxController {
  var jobMatchIdList = <int?>[].obs;
  var applyLimit = 10.obs;
  var totalApply = 1.obs;

  var shouldUpgrade = false.obs;

  getJobMatchIdList() async {
    // jobMatchIdList.clear();
    var temp = await JobMatchListService().fetchJobMatchList();
    // jobMatchIdList.contains(5);

    if (temp != null) {
      for (int i = 0; i < temp.jobmatch!.length; i++) {
        jobMatchIdList.add(temp.jobmatch![i].id);
        // print();
      }
    }
    print("getJobMatchIdList $jobMatchIdList");
  }

  getApplyLimit() async {
    var temp = await ShouldUpgradeService().fetchApplyLimit();
    if (temp != null) {
      applyLimit.value = temp.teacher?.applylimit as int;
    }
    print("getApplyLimit $applyLimit");
  }

  getTotalApply() async {
    var temp = await ShouldUpgradeService().fetchTotalApply();
    if (temp != null) {
      totalApply.value = temp.totalapply as int;
    }
    print("getTotalApply ${totalApply.value}");
  }

  ifShouldUpgrade() async {
    getApplyLimit();
    getTotalApply();
    if (applyLimit.value <= totalApply.value) {
      shouldUpgrade(true);
    }
  }
}
