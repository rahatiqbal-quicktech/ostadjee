import 'package:get/get.dart';

class EditJobPostController extends GetxController {
  var jobTitle = "".obs;

  getJobTitle({required String value}) {
    jobTitle.value = value;
    print("getJobTitle $jobTitle");
  }
}
