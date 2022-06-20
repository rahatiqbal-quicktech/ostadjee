import 'package:get/get.dart';
import 'package:ostadjee/app/modules/tutor/controllers/tutor_controller.dart';

class TutorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorController>(
      () => TutorController(),
    );
  }
}
