import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_payments_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/balance_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class TutorBalanceWidget extends GetView<FrontendController> {
  const TutorBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
          child: Column(
            children: [
              Row(
                children: [
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomTextWidget(
                      text:
                          "${Strings.balanceAmount} ${controller.teacherDashboard.value.teacher?.amount ?? ""} ৳",
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    const CustomSpaceWidget(
                      width: 20,
                    ),
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        Get.toNamed(Routes.TUTOR_PAYMENT_WITHDRAW_VIEW);
                      },
                      title: Strings.paymentWithdraw,
                    ),
                  ),
                ],
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.payments.value.payments?.isNotEmpty ?? false)
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.payments.value.payments?.length ?? 0,
                      separatorBuilder: (_, index) {
                        return const CustomSpaceWidget(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Payments item =
                            controller.payments.value.payments![index];
                        return BalanceItemWidget(
                          sl: "${Strings.sl}: ${index + 1}",
                          amount: "${Strings.amount}: ${item.amount}",
                          paidDate: "${Strings.paidDate}: ${item.date}",
                          name:
                              "${Strings.name}: ${item.paycandidate?.fullName ?? ""}",
                          phone:
                              "${Strings.phone}: ${item.paycandidate?.phoneNumber ?? ""}",
                          status: "${Strings.status}: ${item.status}",
                        );
                      },
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
