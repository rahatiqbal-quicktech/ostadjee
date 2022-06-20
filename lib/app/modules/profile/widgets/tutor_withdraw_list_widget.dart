import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ostadjee/app/common/pojo_model/withdraw_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/withdraw_item_widget.dart';

class TutorWithdrawListWidget extends GetView<FrontendController> {
  const TutorWithdrawListWidget({
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
                height: 10,
              ),
              if (controller.withdrawList.value.withdraws?.isNotEmpty ?? false)
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.withdrawList.value.withdraws?.length ?? 0,
                      separatorBuilder: (_, index) {
                        return const CustomSpaceWidget(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Withdraws item =
                            controller.withdrawList.value.withdraws![index];
                        return WithdrawItemWidget(
                          sl: "${Strings.sl}: ${index + 1}",
                          amount: "${Strings.amount}: ${item.amount}",
                          paidDate:
                              "${Strings.paidDate}: ${DateFormat.yMd().format(DateTime.parse(item.createdAt!))}",
                          title: item.title,
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
