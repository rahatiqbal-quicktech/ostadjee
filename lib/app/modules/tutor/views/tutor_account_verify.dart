import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/tutor/controllers/tutor_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:timer_button/timer_button.dart';

class TutorAccountVerify extends GetView<TutorController> {
  TutorAccountVerify({Key? key}) : super(key: key);

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
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomSpaceWidget(
                  height: 30,
                ),
                // const FractionallySizedBox(
                //   heightFactor: .1,
                //   widthFactor: .5,
                //   child: Image(
                //     image: AssetImage(AppImages.icLogo),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                const CustomSpaceWidget(
                  height: 30,
                ),
                CustomTextWidget(
                  text: Strings.otpVerify,
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
                    onChanged: (val) {
                      controller.token = val;
                    },
                    controller: controller.tokenController,
                    labelText: Strings.verifyToken,
                  ),
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                CustomTextButton(
                  onPressed: controller.onVerifyClick,
                  title: Strings.submit,
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TimerButton(
                    label: "Send OTP Again",
                    timeOutInSeconds: 45,
                    onPressed: () {
                      controller.onResendOTPClick;
                    },
                    disabledColor: Colors.grey,
                    color: AppColors.kPrimaryColor,
                    buttonType: ButtonType.ElevatedButton,
                  ),
                ),
                // CustomTextButton(
                //   onPressed: controller.onResendOTPClick,
                //   buttonColor: Colors.transparent,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: const [
                //       Icon(
                //         Icons.refresh,
                //         color: AppColors.kPrimaryColor,
                //       ),
                //       CustomSpaceWidget(
                //         width: 10,
                //       ),
                //       CustomTextWidget(
                //         text: Strings.resend,
                //         color: AppColors.kPrimaryColor,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
