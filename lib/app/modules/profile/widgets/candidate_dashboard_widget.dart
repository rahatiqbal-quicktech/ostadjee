import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/values/strings.dart';
import 'package:ostadjee/app/common/values/styles/dimens.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/profile/widgets/dashboard_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class CandidateDashboardWidget extends GetView<FrontendController> {
  const CandidateDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      // padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
      child: Obx(
        () => Column(
          children: [
            DashboardItemWidget(
              title: Strings.totalJob,
              icon: Icons.work,
              color: Colors.blue,
              value: controller.candidateOverview.value.totalpost.toString(),
              routeIndex: 3,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            DashboardItemWidget(
              title: Strings.totalTeacher,
              icon: Icons.person,
              color: Colors.teal,
              value: controller.candidateOverview.value.totaltutor.toString(),
              routeIndex: 4,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            DashboardItemWidget(
              title: Strings.totalPayment,
              icon: Icons.attach_money,
              color: Colors.orange,
              value: controller.candidateOverview.value.totalpayment.toString(),
              routeIndex: 6,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            DashboardItemWidget(
              title: Strings.profile,
              icon: Icons.person,
              color: Colors.blue,
              routeIndex: 1,
              widget: CustomTextWidget(
                text: Strings.view,
                isFullWidth: true,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: Dimens.fontSize20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
