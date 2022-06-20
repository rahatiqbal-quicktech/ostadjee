import 'package:get/get.dart';
import 'package:ostadjee/changes/features/job_match_list/model/job_match_list_model.dart';
import 'package:ostadjee/changes/features/job_match_list/service/job_match_list_service.dart';

class JobMatchListController extends GetxController {
  var list = <Jobmatch>[].obs;

  getList() async {
    var temp = await JobMatchListService().fetchList();
    if (temp != null) {
      list.value = temp.jobmatch as List<Jobmatch>;
    }
    print("JobMatchListController ${list.value}");
  }
}
