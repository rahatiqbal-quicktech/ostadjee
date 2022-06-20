import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/profile/widgets/dashboard_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/features/can_apply/controller/can_apply_function.dart';
import 'package:ostadjee/changes/features/upgrade_apply_limit/upgrade_apply_limit_screen.dart';

class TutorDashboardWidget extends GetView<FrontendController> {
  const TutorDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var canApplyController = Get.put(CanApplyFunction());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      // padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
      child: Obx(
        () => Column(
          children: [
            const DashboardItemWidget(
              title: Strings.updateProfile,
              icon: Icons.edit,
              color: Colors.teal,
              // value: "10 %",
              // routeIndex: 2,
              route: Routes.TUTOR_PROFILE_EDIT_VIEW,
              // widget: LinearProgressIndicator(
              //   backgroundColor: AppColors.doveGray.withOpacity(.5),
              //   valueColor: const AlwaysStoppedAnimation<Color>(
              //     AppColors.kPrimaryColor,
              //   ),
              //   value: 0.1,
              // ),
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            // DashboardItemWidget(
            //   title: Strings.profile,
            //   icon: Icons.person,
            //   color: Colors.blue,
            //   routeIndex: 1,
            //   widget: CustomTextWidget(
            //     text: Strings.view,
            //     isFullWidth: true,
            //     color: Colors.blue,
            //     fontWeight: FontWeight.bold,
            //     fontSize: Dimens.fontSize20,
            //   ),
            // ),
            // const CustomSpaceWidget(
            //   height: 10,
            // ),
            // DashboardItemWidget(
            //   title: Strings.updateMembership,
            //   // icon: Icons.attach_money,
            //   stringIcon: "৳",
            //   color: Colors.green,
            //   value:
            //       "৳ ${controller.teacherDashboard.value.teacher?.amount ?? 0}",
            // ),
            // const CustomSpaceWidget(
            //   height: 10,
            // ),
            const DashboardItemWidget(
              title: Strings.premiumTeacher,
              stringIcon: "৳",
              color: Colors.green,
              value: Strings.premium,
              route: Routes.MAKE_ME_PREMIUM,
            ),
            // const DashboardItemWidget(
            //   title: Strings.notification,
            //   icon: Icons.notifications,
            //   color: Colors.orange,
            //   value: "0",
            // ),
            const CustomSpaceWidget(
              height: 10,
            ),
            DashboardItemWidget(
              title: Strings.jobMatch,
              icon: Icons.business_center_rounded,
              color: Colors.blue,
              value: controller.matchJob.value.jobmatch?.toString() ?? "0",
            ),
            const CustomSpaceWidget(
              height: 10,
            ),

            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 4,
                    offset: const Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  Get.to(() => UpgradeApplyLimitScreen());
                },
                title: const Text(
                  "Upgrade Apply Limit",
                  style: TextStyle(color: Colors.orange),
                ),
                trailing: const Icon(
                  Icons.upgrade,
                  color: Colors.orange,
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       canApplyController.getJobMatchIdList();
            //     },
            //     child: const Text("Print job match list"))
          ],
        ),
      ),
    );
  }
}
