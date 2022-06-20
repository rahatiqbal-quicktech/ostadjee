import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/job_match_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/job_match_item_widget.dart';

class CandidateJobMatchListWidget extends GetView<FrontendController> {
  CandidateJobMatchListWidget({
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FrontendController().candidatePostList();
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
          () => controller.jobMatchList.value.teachermatch == null
              ? Container()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.jobMatchList.value.teachermatch
                            ?.teachermatch2?.length ??
                        0,
                    separatorBuilder: (_, index) {
                      return const CustomSpaceWidget(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Teachermatch2 item = controller.jobMatchList.value
                          .teachermatch!.teachermatch2![index];

                      return JobMatchItemWidget(
                        controller: controller,
                        teacherName: item.fullName,
                        phoneNumber: item.phoneNumber,
                        date: "${item.createdAt}",
                        teacherId: item.id,
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
