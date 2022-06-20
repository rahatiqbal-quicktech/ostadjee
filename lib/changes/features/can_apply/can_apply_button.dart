import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/values/strings.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/upgrade_apply_limit/upgrade_apply_limit_screen.dart';

class CanApplyButton extends StatefulWidget {
  const CanApplyButton({required this.jobId, Key? key}) : super(key: key);
  final int jobId;

  @override
  State<CanApplyButton> createState() => _CanApplyButtonState();
}

class _CanApplyButtonState extends State<CanApplyButton>
    with AllChangedControllers {
  final FrontendController controller = Get.put(FrontendController());

  @override
  Widget build(BuildContext context) {
    // canApplyFunctionController.getJobMatchIdList();
    canApplyFunctionController.ifShouldUpgrade();
    if (canApplyFunctionController.jobMatchIdList.contains(widget.jobId)) {
      printFunction();
      if (!canApplyFunctionController.shouldUpgrade.value) {
        return CustomTextButton(
          onPressed: () {
            controller.postApplyJob("${widget.jobId}");
          },
          title: controller.token.value.isNotEmpty && controller.tutor.value
              ? Strings.apply
              : Strings.login,
        );
      } else {
        return GestureDetector(
          onTap: () {
            Get.to(() => UpgradeApplyLimitScreen());
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(color: Colors.blue),
              color: Colors.yellow,
            ),
            child: const Text(
              "Your apply limit is over. Click here to upgrade.",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        );
      }
    } else {
      printFunction();
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.shade200),
        child: const Center(
          child: Text(
            "You are not eligible for this job",
            style: TextStyle(),
          ),
        ),
      );
    }
  }

  printFunction() {
    print(
        "canApplyFunctionController.shouldUpgrade ${canApplyFunctionController.shouldUpgrade}");
  }
}
