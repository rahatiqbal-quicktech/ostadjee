import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PayableAmountController extends GetxController {
  var payableAmount = 0.obs;
  var quantity = 0.obs;
  var textEditingController = TextEditingController().obs;
  getPayableAmount({int? q, required int price}) {
    // payableAmount.value = int.parse(textEditingController.value.text) * price;
    payableAmount.value = (q! * price);
  }
}
