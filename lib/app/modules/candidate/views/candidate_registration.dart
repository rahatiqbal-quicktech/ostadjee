import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/candidate/controllers/candidate_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_back_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_password_field.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class CandidateRegistration extends GetView<CandidateController> {
  const CandidateRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width / 2,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                    padding: EdgeInsets.all(30.w),
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: Image(
                        image: AssetImage(AppImages.icGurdian),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const CustomSpaceWidget(
                    height: 20,
                  ),
                  CustomTextWidget(
                    text: Strings.candidateRegistration,
                    color: AppColors.black,
                    fontSize: Dimens.fontSize26,
                    fontWeight: FontWeight.bold,
                    isFullWidth: true,
                    align: TextAlign.center,
                    maxLine: 3,
                  ),
                  const CustomSpaceWidget(
                    height: 5,
                  ),
                  CustomTextWidget(
                    text: Strings.signUpToContinue,
                    color: AppColors.doveGray,
                    fontSize: Dimens.fontSize14,
                    isFullWidth: true,
                    align: TextAlign.center,
                    maxLine: 3,
                  ),
                  const CustomSpaceWidget(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: Strings.name,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CustomTextFieldWidget(
                            onChanged: (val) {
                              controller.name = val;
                            },
                            controller: controller.nameController,
                            hintText: "John Doe",
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGray,
                              ),
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          text: Strings.phone,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CustomTextFieldWidget(
                            onChanged: (val) {
                              controller.phone = val;
                            },
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            hintText: "01234567890",
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGray,
                              ),
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          text: Strings.candidateType,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CustomDropdownTextField(
                            title: Strings.candidateType,
                            dataList: controller.candidateType,
                            item: (String item) {
                              return item;
                            },
                            onChanged: (String? value) {
                              debugPrint(value);
                            },
                          ),
                        ),
                        CustomTextWidget(
                          text: Strings.emailAddress,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CustomTextFieldWidget(
                            onChanged: (val) {
                              controller.email = val;
                            },
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "info@ostadjee.com",
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGray,
                              ),
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          text: Strings.password,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: PasswordFieldWidget(
                              onChanged: (val) {
                                controller.password = val;
                              },
                              controller: controller.passwordController,
                              obscureText: controller.passwordObsecure.value,
                              onObscureIconClick: controller.onObsecureClick,
                              hintText: "********",
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lightGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          text: Strings.confirmPassword,
                          color: AppColors.kPrimaryColor,
                          fontSize: Dimens.fontSize12,
                          isFullWidth: true,
                          maxLine: 3,
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: PasswordFieldWidget(
                              onChanged: (val) {
                                controller.confirmPassword = val;
                              },
                              controller: controller.confirmPasswordController,
                              obscureText:
                                  controller.confirmPasswordObsecure.value,
                              onObscureIconClick:
                                  controller.onConfirmObsecureClick,
                              hintText: "********",
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lightGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const CustomSpaceWidget(
                          height: 10,
                        ),
                        Obx(
                          () => CheckboxListTile(
                            value: controller.agreeTerms.value,
                            dense: true,
                            onChanged: controller.onTermsChange,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            title: Wrap(children: [
                              CustomTextWidget(
                                text: Strings.iAgreeToThe,
                                fontSize: Dimens.fontSize12,
                              ),
                              InkWell(
                                onTap: controller.launchTermsOfUsePage,
                                child: CustomTextWidget(
                                  text: Strings.termsOfUse,
                                  fontSize: Dimens.fontSize12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextWidget(
                                text: Strings.and,
                                fontSize: Dimens.fontSize12,
                              ),
                              InkWell(
                                onTap: controller.launchPrivacyPolicyPage,
                                child: CustomTextWidget(
                                  text: Strings.privacyPolicy,
                                  fontSize: Dimens.fontSize12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const CustomSpaceWidget(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomTextWidget(
                              text: Strings.signUp,
                              color: AppColors.black,
                              fontSize: Dimens.fontSize26,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                onTap: () {
                                  if (controller.passwordController.text ==
                                      controller
                                          .confirmPasswordController.text) {
                                    controller.onRegisterClick(false);
                                  } else {
                                    showErrorToast(
                                        "Confirm password not match");
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.kPrimaryColor.withOpacity(.8),
                                        AppColors.kPrimaryColor
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(0.7, 0.0),
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.w,
                                    vertical: 10.h,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        // CustomTextButton(
                        //   onPressed: () {
                        //     if (controller.passwordController.text ==
                        //         controller.confirmPasswordController.text) {
                        //       controller.onRegisterClick(false);
                        //     } else {
                        //       showErrorToast("Confirm password not match");
                        //     }
                        //   },
                        //   title: Strings.register,
                        // ),
                        // const CustomSpaceWidget(
                        //   height: 20,
                        // ),
                        // CustomInkwellWidget(
                        //   onTap: () {
                        //     Get.toNamed(Routes.TUTOR_LOGIN);
                        //   },
                        //   child: const CustomRowTextWidget(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     title: Strings.alreadyHaveAccount,
                        //     subtitle: Strings.loginNow,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: CustomIconButton(
                leading: const Icon(Icons.arrow_back),
                onTap: () {
                  Get.back();
                },
                buttonColor: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
