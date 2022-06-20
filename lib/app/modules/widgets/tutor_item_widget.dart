import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/contact_tutor_bottom_sheet_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';

import 'custom_text_widget.dart';

class TutorItemWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final int id;
  final String? leadingImage,
      name,
      university,
      subject,
      location,
      area,
      teaching,
      experience,
      joinedOn,
      qualification;
  final bool? isFeatureList, isSearchList;
  // final Function() onTap;

  const TutorItemWidget({
    Key? key,
    required this.id,
    required this.controller,
    this.leadingImage,
    this.name = "",
    this.university = "",
    this.subject = "",
    this.location = "",
    this.area = "",
    this.teaching = "",
    this.experience = "",
    this.joinedOn = "",
    this.qualification = "",
    this.isFeatureList = false,
    this.isSearchList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kPrimaryColor.withOpacity(.05),
      ),
      child: CustomInkwellWidget(
        onTap: () {
          controller.getTutorDetails(id);
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CustomImageWidget(
                      imageUrl: leadingImage!,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: name!,
                        isFullWidth: true,
                        // fontSize: Dimens.fontSize20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      if (isFeatureList!)
                        CustomTextWidget(
                          text: university!,
                          isFullWidth: true,
                        ),
                      if (isFeatureList!)
                        CustomTextWidget(
                          text: subject!,
                          isFullWidth: true,
                          color: AppColors.black,
                        ),
                      if (isFeatureList!)
                        CustomTextWidget(
                          text: location!,
                          isFullWidth: true,
                        ),
                      if (isSearchList!)
                        CustomTextWidget(
                          text: "${Strings.area}: ${area!}",
                          isFullWidth: true,
                        ),
                      if (isSearchList!)
                        CustomTextWidget(
                          text: "${Strings.teaching}: ${teaching!}",
                          isFullWidth: true,
                        ),
                      if (isSearchList!)
                        CustomTextWidget(
                          text: "${Strings.experience}: ${experience!}",
                          isFullWidth: true,
                        ),
                      if (isSearchList!)
                        CustomTextWidget(
                          text: "${Strings.joinedOn}: ${joinedOn!}",
                          isFullWidth: true,
                        ),
                      if (isSearchList!)
                        CustomTextWidget(
                          text: "${Strings.qualification}: ${qualification!}",
                          isFullWidth: true,
                        ),
                    ],
                  ),
                )
              ],
            ),
            if (isSearchList!)
              const CustomSpaceWidget(
                height: 10,
              ),
            if (isSearchList!)
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        controller.getTutorDetails(id);
                      },
                      title: Strings.details,
                      height: 35,
                      buttonColor: AppColors.white,
                      addBorder: true,
                    ),
                  ),
                  const CustomSpaceWidget(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        Get.bottomSheet(
                          const ContactTutorBottomSheetWidget(),
                          backgroundColor: AppColors.white,
                          isScrollControlled: true,
                        );
                      },
                      title: Strings.contact,
                      height: 35,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
