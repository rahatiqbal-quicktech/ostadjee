import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_password_field.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class TutorChangePasswordWidget extends GetView<FrontendController> {
  const TutorChangePasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Column(
            children: [
              CustomTextWidget(
                text: Strings.changePassword,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                isFullWidth: true,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              CustomTextWidget(
                text: Strings.oldPassword,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              PasswordFieldWidget(
                controller: controller.oldPasswordController,
                obscureText: controller.oldPasswordObsecure.value,
                onObscureIconClick: controller.onOldObsecureClick,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.newPassword,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              PasswordFieldWidget(
                controller: controller.newPasswordController,
                obscureText: controller.newPasswordObsecure.value,
                onObscureIconClick: controller.onNewObsecureClick,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.confirmPassword,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              PasswordFieldWidget(
                controller: controller.confirmPasswordController,
                obscureText: controller.confirmPasswordObsecure.value,
                onObscureIconClick: controller.onConfirmObsecureClick,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              CustomTextButton(
                onPressed: controller.postTeacherPasswordChange,
                title: Strings.submit,
              )
            ],
          )),
    );
  }
}
