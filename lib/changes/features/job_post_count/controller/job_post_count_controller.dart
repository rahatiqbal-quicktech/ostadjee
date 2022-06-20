import 'package:get/get.dart';
import 'package:ostadjee/changes/features/job_post_count/model/job_post_count_model.dart';
import 'package:ostadjee/changes/features/job_post_count/service/job_post_count_service.dart';

class JobPostCountController extends GetxController {
  var postLimit = 0.obs;
  getJobPostCount() async {
    var temp = await JobPostCountService().fetchJobPostCount();
    if (temp != null) {
      postLimit.value = temp.mylimit as int;
    }
    // print("Job Post Limit $postLimit");
  }
}
