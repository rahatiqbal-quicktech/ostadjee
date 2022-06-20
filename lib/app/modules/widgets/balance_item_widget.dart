import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

import 'custom_text_widget.dart';

class BalanceItemWidget extends StatelessWidget {
  final String? sl, amount, paidDate, name, phone, status;

  const BalanceItemWidget({
    Key? key,
    required this.sl,
    this.amount = "",
    this.paidDate = "",
    this.name = "",
    this.phone = "",
    this.status = "",
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
          Get.toNamed(Routes.TUTOR_PROFILE_PUBLIC_VIEW);
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
                CustomTextWidget(
                  text: amount!,
                  fontSize: Dimens.fontSize14,
                  color: AppColors.black,
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
            CustomTextWidget(
              text: phone!,
              isFullWidth: true,
              fontSize: Dimens.fontSize16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: paidDate!,
                  fontSize: Dimens.fontSize14,
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
