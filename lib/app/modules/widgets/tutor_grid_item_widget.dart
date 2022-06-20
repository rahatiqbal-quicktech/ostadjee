import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';

import 'custom_text_widget.dart';

class TutorGridItemWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final int id;
  final String? leadingImage, name, university, subject;

  const TutorGridItemWidget({
    Key? key,
    required this.id,
    required this.controller,
    this.leadingImage,
    this.name = "",
    this.university = "",
    this.subject = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kPrimaryColor.withOpacity(.05),
      ),
      child: InkWell(
        onTap: () {
          controller.getTutorDetails(id);
        },
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CustomImageWidget(
                    imageUrl: leadingImage!,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CustomTextWidget(
                    text: name!,
                    isFullWidth: true,
                    fontSize: Dimens.fontSize15,
                    // fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  CustomTextWidget(
                    text: subject!,
                    isFullWidth: true,
                    fontSize: Dimens.fontSize13,
                  ),
                  CustomTextWidget(
                    text: university!,
                    isFullWidth: true,
                    fontSize: Dimens.fontSize13,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
