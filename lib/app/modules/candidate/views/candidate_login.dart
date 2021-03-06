import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/candidate/controllers/candidate_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_back_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_password_field.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class CandidateLogin extends GetView<CandidateController> {
  const CandidateLogin({Key? key}) : super(key: key);

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
                      text: Strings.candidateLogin,
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
                      text: Strings.signInToContinue,
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
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: CustomTextFieldWidget(
                              onChanged: (val) {
                                controller.phone = val;
                              },
                              controller: controller.phoneController,
                              keyboardType: TextInputType.phone,
                              labelText: Strings.phoneNumber,
                              isDense: true,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lightGray,
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: PasswordFieldWidget(
                                onChanged: (val) {
                                  controller.password = val;
                                },
                                controller: controller.passwordController,
                                obscureText: controller.passwordObsecure.value,
                                onObscureIconClick: controller.onObsecureClick,
                                labelText: Strings.password,
                                isDense: true,
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.lightGray,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const CustomSpaceWidget(
                            height: 30,
                          ),
                          Row(
                            children: [
                              CustomTextWidget(
                                text: Strings.signIn,
                                color: AppColors.black,
                                fontSize: Dimens.fontSize26,
                                fontWeight: FontWeight.bold,
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {
                                    controller.onLoginClick(false);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.kPrimaryColor
                                              .withOpacity(.8),
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
                          //     controller.onLoginClick(false);
                          //   },
                          //   title: Strings.login,
                          // ),
                          const CustomSpaceWidget(
                            height: 10,
                          ),
                          // CustomTextButton(
                          //   onPressed: () {
                          //     controller.signInWithGoogle();
                          //   },
                          //   buttonColor: Colors.redAccent,
                          //   child: Container(
                          //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children: const [
                          //         FaIcon(
                          //           FontAwesomeIcons.google,
                          //           color: AppColors.white,
                          //         ),
                          //         SizedBox(
                          //           width: 20,
                          //         ),
                          //         Text(
                          //           "Sign In with Google",
                          //           style: TextStyle(
                          //             color: AppColors.white,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const CustomSpaceWidget(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInkwellWidget(
                                onTap: () {
                                  Get.toNamed(Routes.CANDIDATE_REGISTRATION);
                                },
                                child: CustomTextWidget(
                                  text: Strings.signUp,
                                  fontSize: Dimens.fontSize16,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                              CustomInkwellWidget(
                                onTap: () {
                                  Get.toNamed(Routes.CANDIDATE_FORGET_PASSWORD);
                                },
                                child: CustomTextWidget(
                                  text: Strings.forgetPassword,
                                  fontSize: Dimens.fontSize16,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
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
        ));
  }
}
