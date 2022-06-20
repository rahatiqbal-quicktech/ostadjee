import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';

class TutorEditProfileWidget extends GetView<FrontendController> {
  const TutorEditProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Column(
        children: [
          if (controller.profileEditTabs.isNotEmpty)
            Container(
              color: AppColors.kPrimaryColor,
              child: Row(
                children: controller.profileEditTabs
                    .map(
                      (Icon icon) => Expanded(
                        flex: 1,
                        child: InkWell(
                          // changesComment : changes are made here to solve edit profile bug
                          onTap: () {
                            controller.selectedProfileEditTab(
                                controller.profileEditTabs.indexOf(icon));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 8, 3, 5),
                            child: Column(
                              children: [
                                icon,
                                const CustomSpaceWidget(
                                  height: 5,
                                ),
                                Container(
                                  height: 3,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: controller.profileEditTabs
                                                .indexOf(icon) ==
                                            controller
                                                .selectedProfileEditTab.value
                                        ? AppColors.white
                                        : AppColors.kPrimaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          if (controller.profileEditTabs.isNotEmpty)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: controller.profileEditWidgets[
                    controller.selectedProfileEditTab.value],
              ),
            ),
        ],
      ),
    ));
  }
}
