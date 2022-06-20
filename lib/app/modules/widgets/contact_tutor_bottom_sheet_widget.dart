import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';

import 'custom_text_widget.dart';

class ContactTutorBottomSheetWidget extends StatelessWidget {
  // final VoidCallback onPressed;
  // final String? title;
  // final double height;
  // final double? buttonWidth, textFontSize;
  // final Widget? child;
  // final Color buttonColor;
  // final bool addBorder;

  const ContactTutorBottomSheetWidget({
    Key? key,
    // required this.onPressed,
    // this.title,
    // this.height = 40,
    // this.child,
    // this.buttonColor = AppColors.kPrimaryColor,
    // this.buttonWidth,
    // this.textFontSize,
    // this.addBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: AppColors.orange,
          child: CustomTextWidget(
            text: Strings.contactWithThisTutor,
            fontSize: Dimens.fontSize18,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
            isFullWidth: true,
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          child: Column(
            children: [
              CustomTextWidget(
                text: Strings.name,
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
                child: const CustomTextFieldWidget(
                  hintText: Strings.nameFieldText,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.emailAddress,
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
                child: const CustomTextFieldWidget(
                  hintText: Strings.emailAddress,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.phoneNumber,
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
                child: const CustomTextFieldWidget(
                  hintText: Strings.phoneNumber,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.detailsInformation,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                child: const CustomTextFieldWidget(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              CustomTextButton(
                onPressed: () {},
                title: Strings.submit,
              )
            ],
          ),
        )
      ],
    );
  }
}
