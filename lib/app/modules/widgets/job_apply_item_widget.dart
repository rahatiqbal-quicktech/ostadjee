import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';

import 'custom_text_widget.dart';

class JobApplyItemWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String? teacherName, date, status;
  final int? jobId, teacherId, applyId;

  const JobApplyItemWidget({
    Key? key,
    required this.controller,
    this.teacherName = "",
    this.date = "",
    this.status = "",
    this.jobId = 0,
    this.teacherId = 0,
    this.applyId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getTutorDetails(teacherId);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.kPrimaryColor.withOpacity(.1),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Column(
          children: [
            CustomTextWidget(
              text: "$teacherName",
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              fontWeight: FontWeight.w500,
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
                  text: "${Strings.status}: ${status!}",
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextButton(
                    height: 30,
                    onPressed: () {
                      controller.postJobApplyStatus(
                          jobId!, applyId!, 'selected');
                    },
                    title: Strings.selected,
                  ),
                ),
                const CustomSpaceWidget(
                  width: 20,
                ),
                Expanded(
                  child: CustomTextButton(
                    height: 30,
                    buttonColor: Colors.redAccent,
                    onPressed: () {
                      controller.postJobApplyStatus(
                          jobId!, applyId!, 'rejected');
                    },
                    title: Strings.rejected,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
