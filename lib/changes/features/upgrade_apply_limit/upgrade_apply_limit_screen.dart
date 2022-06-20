import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/upgrade_apply_limit/service/upgrade_apply_limit_service.dart';
import 'package:ostadjee/changes/features/upgrade_post_limit/service/upgrade_post_limit_service.dart';

class UpgradeApplyLimitScreen extends StatelessWidget
    with AllChangedControllers {
  UpgradeApplyLimitScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController upgradeApplyLimitController = TextEditingController();
    // upgradeApplyLimitController.text = "0";
    allPriceController.getAllPrice();

    return Scaffold(
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        title: "Upgrade Apply Limit",
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Apply Quantity",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: upgradeApplyLimitController,
              onChanged: (String? value) {
                // payableAmountController.quantity.value = int.parse(value);
                if (value != null) {
                  if (value.isNotEmpty) {
                    payableAmountController.getPayableAmount(
                        q: int.parse(upgradeApplyLimitController.text),
                        price: int.parse(
                            "${allPriceController.allPriceModel.value.price?.applyprice}"));
                  } else {
                    payableAmountController.getPayableAmount(
                        q: 0,
                        price: int.parse(
                            "${allPriceController.allPriceModel.value.price?.applyprice}"));
                  }
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(() {
              // int temp = int.parse(
              //     "${allPriceController.allPriceModel.value.price?.postprice}");
              // int tempValue = temp * int.parse(upgradeApplyLimitController.text);
              return Text(
                "Payable Amount "
                "${payableAmountController.payableAmount}"
                " tk",
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 15,
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  UpgradeApplyLimitService()
                      .post(quantity: upgradeApplyLimitController.text);
                  // allPriceController.getAllPrice();
                },
                icon: const Icon(Icons.update),
                label: const Text("Upgrade"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
