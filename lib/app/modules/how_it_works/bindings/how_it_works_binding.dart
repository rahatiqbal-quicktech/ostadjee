import 'package:get/get.dart';
import 'package:ostadjee/app/modules/how_it_works/controllers/how_it_works_controller.dart';

class HowItWorksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowItWorksController>(
      () => HowItWorksController(),
    );
  }
}
