import 'package:get/get.dart';
import 'package:ostadjee/changes/shared/models/all_price_model.dart';
import 'package:ostadjee/changes/shared/services/all_price_service.dart';

class AllPriceController extends GetxController {
  var allPriceModel = AllPriceModel().obs;
  var postPrice = 10.obs;
  var applyPrice = 2.obs;
  getAllPrice() async {
    var temp = await AllPriceService().fetchAllPrice();
    if (temp != null) {
      allPriceModel.value = temp;
    }
  }
}
