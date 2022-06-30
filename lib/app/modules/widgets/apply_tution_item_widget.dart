import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';

import 'custom_text_widget.dart';

class ApplyTutionItemWidget extends StatelessWidget {
  final String? jobId, name, status, date;

  final String title,
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

  const ApplyTutionItemWidget({
    Key? key,
    this.jobId = "",
    this.name = "",
    this.status = "",
    this.date = "",
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
      child: CustomInkwellWidget(
        onTap: () {
          // Get.bottomSheet(
          //   TutionJobBottomSheetWidget(
          //     jobId: jobId!,
          //     title: title,
          //     category: category,
          //     tutionClass: tutionClass,
          //     salary: salary,
          //     subjects: subjects,
          //     daysPerWeek: daysPerWeek,
          //     location: location,
          //     createdAt: createdAt,
          //     studentGender: studentGender,
          //     preferGender: preferGender,
          //     latitude: latitude,
          //     longitude: longitude,
          //   ),
          //   backgroundColor: AppColors.white,
          //   isScrollControlled: true,
          // );
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: jobId!,
                  fontSize: Dimens.fontSize14,
                ),
                CustomTextWidget(
                  text: status!,
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
                ),
              ],
            ),
            CustomTextWidget(
              text: name ?? "Not available",
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              color: AppColors.black,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextWidget(
                text: date!,
                fontSize: Dimens.fontSize14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
