import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class TutorPaymentWithdrawWidget extends GetView<FrontendController> {
  const TutorPaymentWithdrawWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
          child: Column(
            children: [
              if (controller.teacherDashboard.value.teacher != null)
                CustomTextWidget(
                  text:
                      "${Strings.balanceAmount} ${controller.teacherDashboard.value.teacher?.amount ?? ""} ৳",
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  isFullWidth: true,
                ),
              const CustomSpaceWidget(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: Strings.title,
                        fontSize: Dimens.fontSize15,
                        color: AppColors.doveGray,
                        isFullWidth: true,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        child: CustomTextFieldWidget(
                          controller: controller.paymentTitleController,
                          // hintText: Strings.phoneNumber,
                        ),
                      ),
                      const CustomSpaceWidget(
                        height: 10,
                      ),
                      CustomTextWidget(
                        text: Strings.amount,
                        fontSize: Dimens.fontSize15,
                        color: AppColors.doveGray,
                        isFullWidth: true,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        child: CustomTextFieldWidget(
                          controller: controller.paymentAmountController,
                        ),
                      ),
                      const CustomSpaceWidget(
                        height: 20,
                      ),
                      CustomTextButton(
                        onPressed: controller.postPaymentWithdraw,
                        title: Strings.submit,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
