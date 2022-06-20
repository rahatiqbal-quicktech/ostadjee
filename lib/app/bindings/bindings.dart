import 'package:get/get.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrontendController>(
      () => FrontendController(),
    );
  }
}
