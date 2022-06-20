import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/tution_job_bottom_sheet_widget.dart';

import 'custom_text_widget.dart';

class JobPostItemWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String? sl, postId, name, date, status;
  final int? apply;

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

  const JobPostItemWidget({
    Key? key,
    required this.sl,
    required this.controller,
    this.postId = "",
    this.name = "",
    this.apply = 0,
    this.date = "",
    this.status = "",
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.kPrimaryColor.withOpacity(.1),
      ),
      padding: EdgeInsets.fromLTRB(8, 8, 8, apply! > 0 ? 4 : 8),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.tag,
                      color: AppColors.doveGray,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: "$sl",
                      fontSize: Dimens.fontSize14,
                    ),
                  ],
                ),
                CustomTextWidget(
                  text: "${Strings.postId}: $postId",
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
                ),
              ],
            ),
            CustomTextWidget(
              text: "$name",
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            CustomTextWidget(
              text: "${Strings.apply}: $apply",
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              color: AppColors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: AppColors.doveGray,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: "$date",
                      fontSize: Dimens.fontSize14,
                    ),
                  ],
                ),
                CustomTextWidget(
                  text: "${Strings.status}: $status",
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
                ),
              ],
            ),
            Row(
              children: [
                if (apply! > 0)
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        controller.getJobApplyList(postId);
                      },
                      title: Strings.viewApplyList,
                    ),
                  ),
                if (apply! > 0)
                  const CustomSpaceWidget(
                    width: 10,
                  ),
                Expanded(
                  child: CustomTextButton(
                    onPressed: () {
                      controller.getJobMatchList(postId);
                    },
                    title: Strings.viewMatchList,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
