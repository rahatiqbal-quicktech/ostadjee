import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';

import 'custom_text_widget.dart';

class PaymentItemWidget extends StatelessWidget {
  final String? sl, amount, name, phone, paidDate, status;

  const PaymentItemWidget({
    Key? key,
    required this.sl,
    this.phone = "",
    this.name = "",
    this.amount = "",
    this.paidDate = "",
    this.status = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.kPrimaryColor.withOpacity(.1),
      ),
      padding: const EdgeInsets.all(10),
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
            color: AppColors.black,
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
    );
  }
}
