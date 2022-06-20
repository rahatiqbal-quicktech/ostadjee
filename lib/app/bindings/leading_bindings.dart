import 'package:get/get.dart';
import 'package:ostadjee/app/controllers/leading_controller.dart';

class LeadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeadingController>(
      () => LeadingController(),
    );
  }
}
