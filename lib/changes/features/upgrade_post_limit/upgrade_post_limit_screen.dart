import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/upgrade_post_limit/service/upgrade_post_limit_service.dart';

class UpgradePostLimitScreen extends StatelessWidget
    with AllChangedControllers {
  UpgradePostLimitScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController upgradePostLimitController = TextEditingController();
    // upgradePostLimitController.text = "0";
    allPriceController.getAllPrice();

    return Scaffold(
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        title: "Upgrade Post Limit",
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
              "Post Quantity",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: upgradePostLimitController,
              onChanged: (String? value) {
                // payableAmountController.quantity.value = int.parse(value);
                if (value != null) {
                  if (value.isNotEmpty) {
                    payableAmountController.getPayableAmount(
                        q: int.parse(upgradePostLimitController.text),
                        price: int.parse(
                            "${allPriceController.allPriceModel.value.price?.postprice}"));
                  } else {
                    payableAmountController.getPayableAmount(
                        q: 0,
                        price: int.parse(
                            "${allPriceController.allPriceModel.value.price?.postprice}"));
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
              // int tempValue = temp * int.parse(upgradePostLimitController.text);
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
                  UpgradePostLimitService()
                      .post(quantity: upgradePostLimitController.text);
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
