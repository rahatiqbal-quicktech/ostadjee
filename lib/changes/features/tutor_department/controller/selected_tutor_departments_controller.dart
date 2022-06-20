import 'package:get/get.dart';
import 'package:ostadjee/changes/features/tutor_department/model/tutor_department_model.dart';

class SelectTutorDepartmentController extends GetxController {
  var selectedTutorDepartmentsList = <Tutordepartment>[].obs;

  add(Tutordepartment value) {
    selectedTutorDepartmentsList.add(value);
  }

  remove(Tutordepartment value) {
    selectedTutorDepartmentsList.remove(value);
  }
}
