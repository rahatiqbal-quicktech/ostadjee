import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tution_jobs_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/leading_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/tution_jobs_item_widget.dart';

class TutionJobsView extends GetView<LeadingController> {
  const TutionJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        title: Strings.tutionList,
      ),
      body: Obx(
        () => SafeArea(
          child: controller.tutionJobs.value.jobs?.data?.isEmpty ?? true
              ? Center(
                child: CustomTextWidget(
                  text: Strings.comingSoon,
                  maxLine: 5,
                  color: AppColors.doveGray,
                  fontSize: Dimens.fontSize15,
                  align: TextAlign.center,
                  isFullWidth: true,
                ),
              )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: [
                      if (controller.tutionJobs.value.jobs != null)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.tutionJobs.value.jobs?.data?.length ??
                                  0,
                          separatorBuilder: (_, index) {
                            return const CustomSpaceWidget(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            Data item =
                                controller.tutionJobs.value.jobs!.data![index];
                            return TutionJobsItemWidget(
                              jobId: item.id.toString(),
                              title: item.title ?? "",
                              category: item.jmedium?.name ?? "",
                              tutionClass:
                                  item.jdepartment?.departmentName ?? "",
                              salary: item.jsalary?.salary ?? "",
                              subjects: item.jsubject?.subjectName ?? "",
                              daysPerWeek: item.jdays?.dayweek ?? "",
                              location: item.address ?? "",
                              createdAt: item.createdAt ?? "",
                              studentGender: item.sGender ?? "",
                              preferGender: item.sGender ?? "",
                              latitude: item.latitude ?? "",
                              longitude: item.longitude ?? "",
                            );
                          },
                        )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
