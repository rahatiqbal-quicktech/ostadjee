import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/job_apply_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/job_apply_item_widget.dart';

class CandidateJobApplyListWidget extends GetView<FrontendController> {
  CandidateJobApplyListWidget({
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: AppColors.black,
            ),
          ),
        ],
        titleWidget: Image.asset(
          AppImages.icLogo,
          height: 40,
        ),
      ),
      endDrawer: CustomDrawerWidget(),
      body: SafeArea(
        child: Obx(
          () => controller.jobApplyList.value.applylist?.isEmpty ?? true
              ? Container()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.jobApplyList.value.applylist?.length ?? 0,
                    separatorBuilder: (_, index) {
                      return const CustomSpaceWidget(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Applylist item =
                          controller.jobApplyList.value.applylist![index];

                      return JobApplyItemWidget(
                        controller: controller,
                        teacherName: item.applyteacher?.fullName ?? "",
                        date: "${item.createdAt}",
                        status: "${item.status}",
                        jobId: item.jobId,
                        teacherId: item.teacherId,
                        applyId: item.id,
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
