import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';

import 'custom_text_widget.dart';

class TeacherItemWidget extends GetView<FrontendController> {
  final String? sl, phone, name, presentAddress, hireDate, status;

  final int id;

  const TeacherItemWidget({
    Key? key,
    required this.sl,
    required this.id,
    this.phone = "",
    this.name = "",
    this.presentAddress = "",
    this.hireDate = "",
    this.status = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.kPrimaryColor.withOpacity(.1),
      ),
      // padding: const EdgeInsets.all(10),
      child: CustomInkwellWidget(
        onTap: () {
          controller.getTutorDetails(id);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: sl!,
                  fontSize: Dimens.fontSize14,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 18,
                    ),
                    const CustomSpaceWidget(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: phone!,
                      fontSize: Dimens.fontSize14,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
            CustomTextWidget(
              text: name!,
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                ),
                const CustomSpaceWidget(
                  width: 5,
                ),
                Expanded(
                  child: CustomTextWidget(
                    text: presentAddress!,
                    isFullWidth: true,
                    fontSize: Dimens.fontSize16,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                    ),
                    const CustomSpaceWidget(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: hireDate!,
                      fontSize: Dimens.fontSize14,
                    ),
                  ],
                ),
                CustomTextWidget(
                  text: status!,
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
