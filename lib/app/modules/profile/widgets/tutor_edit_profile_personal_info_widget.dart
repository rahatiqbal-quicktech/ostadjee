import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/division_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_radio_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/changes/features/verification/verify_tutor_widget.dart';
import 'package:video_player/video_player.dart';

class TutorEditProfilePersonalInformationWidget
    extends GetView<FrontendController> {
  const TutorEditProfilePersonalInformationWidget({
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
                text: Strings.personalInfo,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                isFullWidth: true,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Utils.showImagePicker(
                      onGetImage: controller.onGetProfilePicture);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CustomImageWidget(
                      imageUrl: controller.profilePhotoUrl.value,
                    ),
                  ),
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              const VerfyTutorWidget(thisId: "1"),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextWidget(
                text: Strings.clickHereToUploadImage,
                fontSize: Dimens.fontSize12,
                color: AppColors.doveGray,
                isFullWidth: true,
                align: TextAlign.center,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.haveVideo.value)
                const CustomSpaceWidget(
                  height: 10,
                ),
              controller.haveVideo.value
                  ? AspectRatio(
                      aspectRatio: controller.videoController.value.aspectRatio,
                      child: VideoPlayer(controller.videoController),
                    )
                  : Container(),
              const CustomSpaceWidget(
                height: 5,
              ),
              CustomTextButton(
                onPressed: controller.onGetProfileVideo,
                title: controller.haveVideo.value
                    ? Strings.changeCoverVideo
                    : Strings.uploadCoverVideo,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.fullName,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.nameController,
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
              CustomTextFieldWidget(
                controller: controller.phoneNumberController,
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
              CustomTextFieldWidget(
                controller: controller.emailController,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.gender,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomRadioWidget(
                      value: Strings.male,
                      groupValue: controller.gender.value,
                      title: Strings.male,
                      onChange: (val) {
                        controller.gender(val);
                      },
                    ),
                  ),
                  const CustomSpaceWidget(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomRadioWidget(
                      value: Strings.female,
                      groupValue: controller.gender.value,
                      title: Strings.female,
                      onChange: (val) {
                        controller.gender(val);
                      },
                    ),
                  ),
                ],
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.currentInstitute,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.currentInstituteController,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.subject,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.subjectNameController,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.yourHighestDegree,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.heigestQualificationController,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.currentDistrict,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              if (controller.division.value.divisions?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: "",
                  dataList: controller.division.value.divisions!,
                  item: (Divisions item) {
                    return item.text ?? "";
                  },
                  value: controller.selectedDivision,
                  onChanged: (Divisions? value) {
                    controller.selectDivision(value!);
                  },
                ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.presentAddress,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.presentAddress,
                minLines: 5,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.permanentAddress,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.permanentAddress,
                minLines: 5,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextWidget(
                text: Strings.aboutYourself,
                fontSize: Dimens.fontSize15,
                color: AppColors.doveGray,
                isFullWidth: true,
              ),
              CustomTextFieldWidget(
                controller: controller.aboutYourself,
                minLines: 5,
              ),
              const CustomSpaceWidget(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextButton(
                      onPressed:
                          controller.postTeacherPersonalInformationUpdate,
                      title: Strings.saveAndNext,
                    ),
                  ),
                  const CustomSpaceWidget(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomTextButton(
                      onPressed: () {
                        controller.postTeacherPersonalInformationUpdate(
                          isNext: true,
                        );
                      },
                      title: Strings.next,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
