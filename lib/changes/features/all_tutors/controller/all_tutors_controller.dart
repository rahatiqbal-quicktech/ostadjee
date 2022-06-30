import 'package:get/get.dart';
import 'package:ostadjee/changes/features/all_tutors/model/all_tutors_model.dart';
import 'package:ostadjee/changes/features/all_tutors/service/all_tutors_service.dart';

class AllTutorsController extends GetxController {
  var list = <Alltutor>[].obs;

  getAllTutor() async {
    var temp = await AllTutorsService().fetchAllTutors();
    if (temp != null) {
      list.value = temp.alltutors as List<Alltutor>;
      // print(list.value);
    }
  }
}
