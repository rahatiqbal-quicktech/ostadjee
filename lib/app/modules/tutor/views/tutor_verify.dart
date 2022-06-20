import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/tutor/controllers/tutor_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_row_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class TutorVerify extends GetView<TutorController> {
  TutorVerify({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppbarWidget(
          backgroundColor: AppColors.white,
          addBackButton: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FractionallySizedBox(
                  widthFactor: .5,
                  child: Image(
                    image: AssetImage(AppImages.icLogo),
                    fit: BoxFit.fill,
                  ),
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                CustomTextWidget(
                  text: Strings.tutorVerify,
                  color: AppColors.black,
                  fontSize: Dimens.fontSize22,
                  fontWeight: FontWeight.bold,
                  isFullWidth: true,
                ),
                const CustomSpaceWidget(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: CustomTextFieldWidget(
                    controller: controller.nameController,
                    labelText: Strings.name,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: CustomTextFieldWidget(
                    controller: controller.phoneController,
                    labelText: Strings.phoneNumber,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: CustomTextFieldWidget(
                    controller: controller.emailController,
                    labelText: Strings.emailAddress,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: CustomTextFieldWidget(
                    controller: controller.passwordController,
                    labelText: Strings.password,
                  ),
                ),
                // Obx(
                //   () => Container(
                //     margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                //     child: PasswordFieldWidget(
                //       obscureText: controller.passwordObsecure.value,
                //       onObscureIconClick: controller.onObsecureClick,
                //     ),
                //   ),
                // ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                CustomTextButton(
                  onPressed: () {
                    controller.onRegisterClick(false);
                  },
                  title: Strings.register,
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                CustomInkwellWidget(
                  onTap: () {
                    Get.toNamed(Routes.TUTOR_LOGIN);
                  },
                  child: const CustomRowTextWidget(
                    mainAxisAlignment: MainAxisAlignment.center,
                    title: Strings.alreadyHaveAccount,
                    subtitle: Strings.loginNow,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
