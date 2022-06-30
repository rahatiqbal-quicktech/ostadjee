import 'package:get/get.dart';
import 'package:ostadjee/changes/features/district_for_search/model/district_for_search_model.dart';
import 'package:ostadjee/changes/features/district_for_search/service/district_for_search_service.dart';

class DitrictForSearchController extends GetxController {
  var districtsList = <District>[].obs;

  getDistricts() async {
    var temp = await DistrictForSearchService().getDistricts();
    if (temp != null) {
      districtsList.value = temp.districts as List<District>;
      districtsList.remove(null);

      // if (districtsList[0] == null) {
      // }
    }
    print(districtsList);
  }
}
