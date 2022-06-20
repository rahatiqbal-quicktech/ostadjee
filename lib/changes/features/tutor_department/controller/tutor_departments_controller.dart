import 'package:get/get.dart';
import 'package:ostadjee/changes/features/tutor_department/model/tutor_department_model.dart';
import 'package:ostadjee/changes/features/tutor_department/service/tutor_department_service.dart';

class TutorDepartmentsController extends GetxController {
  var model = TutorDepartmentModel().obs;
  getList() async {
    var temp = await TutorDepartmentService().fetchTutorDepartments();
    if (temp != null) {
      model.value = temp;
    }
  }
}
