import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/tution_job_bottom_sheet_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/job_match_list/controller/job_match_list_controller.dart';

import 'custom_text_widget.dart';

class TutionJobsItemWidget extends StatelessWidget with AllChangedControllers {
  final String jobId,
      title,
      category,
      tutionClass,
      salary,
      subjects,
      daysPerWeek,
      location,
      createdAt,
      studentGender,
      preferGender,
      latitude,
      longitude;

  TutionJobsItemWidget({
    Key? key,
    this.jobId = "",
    this.title = "",
    this.category = "",
    this.tutionClass = "",
    this.salary = "",
    this.subjects = "",
    this.daysPerWeek = "",
    this.location = "",
    this.createdAt = "",
    this.studentGender = "",
    this.preferGender = "",
    this.latitude = "",
    this.longitude = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // canApplyFunctionController.getApplyLimit();
    // canApplyFunctionController.getTotalApply();
    // canApplyFunctionController.ifShouldUpgrade();
    // final jobMatchListController = Get.put(JobMatchListController());
    // jobMatchListController.getList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kPrimaryColor.withOpacity(.05),
      ),
      child: CustomInkwellWidget(
        onTap: () {
          Get.bottomSheet(
            TutionJobBottomSheetWidget(
              jobId: jobId,
              title: title,
              category: category,
              tutionClass: tutionClass,
              salary: salary,
              subjects: subjects,
              daysPerWeek: daysPerWeek,
              location: location,
              createdAt: createdAt,
              studentGender: studentGender,
              preferGender: preferGender,
              latitude: latitude,
              longitude: longitude,
            ),
            backgroundColor: AppColors.white,
            isScrollControlled: true,
          );
        },
        child: Column(
          children: [
            CustomTextWidget(
              text: "${Strings.jobId}- $jobId",
              isFullWidth: true,
              fontSize: Dimens.fontSize12,
              color: AppColors.doveGray,
            ),
            CustomTextWidget(
              text: title,
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              // fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 16,
                    ),
                    const CustomSpaceWidget(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: daysPerWeek,
                      fontSize: Dimens.fontSize14,
                      // fontWeight: FontWeight.w500,
                      color: AppColors.doveGray,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                    ),
                    const CustomSpaceWidget(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: location,
                      fontSize: Dimens.fontSize14,
                      // fontWeight: FontWeight.w500,
                      color: AppColors.doveGray,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
