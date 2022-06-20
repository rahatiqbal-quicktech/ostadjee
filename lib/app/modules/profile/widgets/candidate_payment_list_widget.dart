import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_payment_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/paymet_item_widget.dart';

class CandidatePaymentListWidget extends GetView<FrontendController> {
  const CandidatePaymentListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.candidatePaymentList.value.paymentlist?.isEmpty ?? true
        ? Container()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  controller.candidatePaymentList.value.paymentlist?.length ??
                      0,
              separatorBuilder: (_, index) {
                return const CustomSpaceWidget(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                Paymentlist item =
                    controller.candidatePaymentList.value.paymentlist![index];

                return PaymentItemWidget(
                  sl: "${Strings.sl}: ${index + 1}",
                  phone:
                      "${Strings.phone}: ${item.payteacher?.phoneNumber ?? ""}",
                  paidDate: "${Strings.date}: ${item.date ?? ""}",
                  name: "${Strings.name}: ${item.title ?? ""}",
                  amount: "${Strings.amount}: ${item.amount ?? 0}",
                  status: "${Strings.status}: ${item.status ?? ""}",
                );
              },
            ),
          );
  }
}
