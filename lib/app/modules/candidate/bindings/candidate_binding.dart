import 'package:get/get.dart';
import 'package:ostadjee/app/modules/candidate/controllers/candidate_controller.dart';

class CandidateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CandidateController>(
      () => CandidateController(),
    );
  }
}
