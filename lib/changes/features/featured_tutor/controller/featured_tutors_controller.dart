import 'package:get/get.dart';
import 'package:ostadjee/changes/features/featured_tutor/model/featured_tutor_model.dart';
import 'package:ostadjee/changes/features/featured_tutor/service/featured_tutors_service.dart';

class FeaturedTutorsController extends GetxController {
  var featuredTutorsList = <Featuretutor>[].obs;

  void getFeaturedTutors() async {
    var temp = await FeaturedTutorsService().fetchFeaturedTutors();
    if (temp != null) {
      featuredTutorsList.value = temp.featuretutors as List<Featuretutor>;
    }
  }
}
