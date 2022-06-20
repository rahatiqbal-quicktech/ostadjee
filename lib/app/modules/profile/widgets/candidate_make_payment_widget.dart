import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_teacher_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class CandidateMakePaymentWidget extends GetView<FrontendController> {
  const CandidateMakePaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
        child: Obx(
          () => Column(
            children: [
              CustomTextWidget(
                text: Strings.selectTeacher,
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
                child: controller
                            .candidateTeacherList.value.teacherlist?.isEmpty ??
                        true
                    ? SizedBox(
                        width: Get.width,
                        height: 50,
                        child: Center(
                          child: CustomTextWidget(
                            text: Strings.noTeacherFound,
                            fontSize: Dimens.fontSize15,
                            color: AppColors.doveGray,
                          ),
                        ),
                      )
                    : CustomDropdownTextField(
                        title: Strings.selectTeacher,
                        dataList:
                            controller.candidateTeacherList.value.teacherlist!,
                        item: (Teacherlist item) {
                          return item.hireTeacher?.fullName ?? "";
                        },
                        onChanged: (Teacherlist? value) {
                          controller.selectTeacher(value!);
                        },
                      ),
                // child: const CustomTextFieldWidget(
                //     // hintText: Strings.phoneNumber,
                //     ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
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
              CustomTextWidget(
                text: Strings.date,
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
                child: CustomTextButton(
                  onPressed: () {
                    controller.selectPaymentDate();
                  },
                  buttonColor: AppColors.white,
                  child: CustomTextWidget(
                    text: "${controller.paymentDate.value.toLocal()}"
                        .split(' ')[0],
                    fontSize: Dimens.fontSize15,
                    color: AppColors.black,
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              CustomTextButton(
                onPressed: controller.postCandidateMakePayments,
                title: Strings.submit,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              CustomTextButton(
                onPressed: () {
                  Get.toNamed(Routes.CANDIDATE_PAYMENT_HISTORY_VIEW);
                },
                title: Strings.viewPaymentHistory,
                buttonColor: Colors.transparent,
                addBorder: true,
              )
            ],
          ),
        ));
  }
}
