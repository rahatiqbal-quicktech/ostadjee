import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';

import 'custom_text_widget.dart';

class JobMatchItemWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String? teacherName, phoneNumber, date;
  final int? teacherId;

  const JobMatchItemWidget({
    Key? key,
    required this.controller,
    this.teacherName = "",
    this.phoneNumber = "",
    this.date = "",
    this.teacherId = 0,
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
                      Icons.phone,
                      color: AppColors.doveGray,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: "$phoneNumber",
                      fontSize: Dimens.fontSize14,
                      color: AppColors.black,
                    ),
                  ],
                ),
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
                      text: "${Strings.date}: $date",
                      fontSize: Dimens.fontSize14,
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
