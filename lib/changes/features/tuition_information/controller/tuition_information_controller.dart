import 'package:get/get.dart';
import 'package:ostadjee/changes/features/tuition_information/function/tuition_information_functions.dart';
import 'package:ostadjee/changes/features/tuition_information/service/tuition_information_service.dart';

class TuitionInformationController extends GetxController {
  var district = "".obs;
  var area = "".obs;
  var salary = "".obs;

  getDivision() async {
    var temp = await TuitionInformationFunctions().getDivisionName();
    if (temp != null) {
      district.value = temp;
    }
  }

  getArea() async {
    var temp = await TuitionInformationFunctions().getAreaName();
    if (temp != null) {
      area.value = temp;
    }
  }

  getSalary() async {
    var temp = await TuitionInformationFunctions().getSalary();
    if (temp != null) {
      salary.value = temp;
    }
  }
}
