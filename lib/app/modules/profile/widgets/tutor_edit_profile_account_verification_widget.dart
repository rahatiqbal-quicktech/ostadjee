import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class TutorEditProfileAccountVerificationWidget
    extends GetView<FrontendController> {
  const TutorEditProfileAccountVerificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                text: Strings.accountVerification,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                isFullWidth: true,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: InkWell(
                  onTap: () {
                    Utils.showImagePicker(onGetImage: controller.onGetFrontNid);
                  },
                  child: SizedBox(
                    height: 200,
                    child: CustomImageWidget(
                      imageUrl: controller.nidFrontFile.value,
                    ),
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextWidget(
                text: Strings.clickHereToUploadNIDFront,
                fontSize: Dimens.fontSize12,
                color: AppColors.doveGray,
                isFullWidth: true,
                align: TextAlign.center,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: InkWell(
                  onTap: () {
                    Utils.showImagePicker(onGetImage: controller.onGetBackNid);
                  },
                  child: SizedBox(
                    height: 200,
                    child: CustomImageWidget(
                      imageUrl: controller.nidBackFile.value,
                    ),
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextWidget(
                text: Strings.clickHereToUploadNIDBack,
                fontSize: Dimens.fontSize12,
                color: AppColors.doveGray,
                isFullWidth: true,
                align: TextAlign.center,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: InkWell(
                  onTap: () {
                    Utils.showImagePicker(
                        onGetImage: controller.onGetStudentIdFront);
                  },
                  child: SizedBox(
                    height: 200,
                    child: CustomImageWidget(
                      imageUrl: controller.studentIdFrontFile.value,
                    ),
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextWidget(
                text: Strings.clickHereToUploadSIDfront,
                fontSize: Dimens.fontSize12,
                color: AppColors.doveGray,
                isFullWidth: true,
                align: TextAlign.center,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: InkWell(
                  onTap: () {
                    Utils.showImagePicker(
                        onGetImage: controller.onGetStudentIdBack);
                  },
                  child: SizedBox(
                    height: 200,
                    child: CustomImageWidget(
                      imageUrl: controller.studentIdBackFile.value,
                    ),
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextWidget(
                text: Strings.clickHereToUploadSIDback,
                fontSize: Dimens.fontSize12,
                color: AppColors.doveGray,
                isFullWidth: true,
                align: TextAlign.center,
              ),
              const CustomSpaceWidget(
                height: 30,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 2,
              //       child: CustomTextButton(
              //         onPressed:
              //             controller.postTeacherTutionInformationUpdate,
              //         title: Strings.saveAndNext,
              //       ),
              //     ),
              //     const CustomSpaceWidget(
              //       width: 10,
              //     ),
              //     Expanded(
              //       flex: 1,
              //       child: CustomTextButton(
              //         onPressed: () {
              //           controller.postTeacherTutionInformationUpdate(
              //             isNext: true,
              //           );
              //         },
              //         title: Strings.next,
              //       ),
              //     ),
              //   ],
              // ),
              CustomTextButton(
                onPressed: controller.postTeacherVerifyUpdate,
                title: Strings.submit,
              )
            ],
          )),
    );
  }
}
