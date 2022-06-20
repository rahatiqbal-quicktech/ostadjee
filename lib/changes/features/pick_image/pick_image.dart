// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';

class PickImage {
  File? image;
  final controller = Get.put(FrontendController());
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      this.image = imageTemp;
      controller.onGetFrontNid(imageTemp);
    } on Exception catch (e) {
      print("pickImage $e");
    }
  }
}
