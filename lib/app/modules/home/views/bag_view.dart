import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_teacher_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_apply_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/apply_tution_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/teacher_item_widget.dart';

class BagView extends GetView<FrontendController> {
  BagView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: const CustomBottomBarWidget(),
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        title:
            controller.tutor.value ? Strings.applyTution : Strings.hiredTeacher,
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                controller.tutor.value
                    ? controller.tutionApplyList.value.tutionapply?.isEmpty ??
                            true
                        ? Container()
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.tutionApplyList.value
                                    .tutionapply?.length ??
                                0,
                            separatorBuilder: (_, index) {
                              return const CustomSpaceWidget(
                                height: 10,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              Tutionapply item = controller
                                  .tutionApplyList.value.tutionapply![index];
                              return ApplyTutionItemWidget(
                                jobId: "${Strings.jobId}: ${item.jobId}",
                                name: item.tapplyjob?.title,
                                date:
                                    "${Strings.date}: ${item.createdAt ?? ""}",
                                status: "${Strings.status}: ${item.status}",
                              );
                            },
                          )
                    : controller.candidateTeacherList.value.teacherlist
                                ?.isEmpty ??
                            true
                        ? Container()
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.candidateTeacherList.value
                                    .teacherlist?.length ??
                                0,
                            separatorBuilder: (_, index) {
                              return const CustomSpaceWidget(
                                height: 10,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              Teacherlist item = controller.candidateTeacherList
                                  .value.teacherlist![index];

                              return TeacherItemWidget(
                                sl: "# ${index + 1}",
                                id: item.id!,
                                phone: item.hireTeacher?.phoneNumber ?? "",
                                hireDate: item.createdAt,
                                name: item.hireTeacher?.fullName ?? "",
                                presentAddress:
                                    item.hireTeacher?.teacherPresentAddress ??
                                        "",
                                status: "${Strings.status}: ${item.status}",
                              );
                            },
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
