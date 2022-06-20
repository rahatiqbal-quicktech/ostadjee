import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/university_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class TutorEditProfileEducationalInformationWidget
    extends GetView<FrontendController> {
  const TutorEditProfileEducationalInformationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: Strings.educationalInformation,
              fontSize: Dimens.fontSize18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              isFullWidth: true,
            ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.sscLabel,
              fontSize: Dimens.fontSize14,
              color: AppColors.doveGray,
              isFullWidth: true,
              align: TextAlign.center,
            ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.year,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.sscYear,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.institute,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.sscInstitute,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.group,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.sscGroup,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.gpa,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.sscGpa,
            ),
            CustomTextButton(
              onPressed: () {
                Utils.showImagePicker(
                    onGetImage: controller.onGetSscCertificate);
              },
              title: Strings.chooseFile,
            ),
            if (controller.sscCertificate.value.isNotEmpty)
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 100,
                  child: CustomImageWidget(
                    imageUrl: controller.sscCertificate.value,
                  ),
                ),
              ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.hscLabel,
              fontSize: Dimens.fontSize14,
              color: AppColors.doveGray,
              isFullWidth: true,
              align: TextAlign.center,
            ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.year,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.hscYear,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.institute,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.hscInstitute,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.group,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.hscGroup,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.gpa,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.hscGpa,
            ),
            CustomTextButton(
              onPressed: () {
                Utils.showImagePicker(
                    onGetImage: controller.onGetHscCertificate);
              },
              title: Strings.chooseFile,
            ),
            if (controller.hscCertificate.value.isNotEmpty)
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 100,
                  child: CustomImageWidget(
                    imageUrl: controller.hscCertificate.value,
                  ),
                ),
              ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.graduationLabel,
              fontSize: Dimens.fontSize14,
              color: AppColors.doveGray,
              isFullWidth: true,
              align: TextAlign.center,
            ),
            const CustomSpaceWidget(
              height: 20,
            ),
            CustomTextWidget(
              text: Strings.year,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.graduationYear,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.institute,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.graduationInstitute,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.department,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.graduationDepartment,
            ),
            const CustomSpaceWidget(
              height: 10,
            ),
            CustomTextWidget(
              text: Strings.cgpa,
              fontSize: Dimens.fontSize15,
              color: AppColors.doveGray,
              isFullWidth: true,
            ),
            CustomTextFieldWidget(
              controller: controller.graduationCgpa,
            ),
            CustomTextButton(
              onPressed: () {
                Utils.showImagePicker(
                    onGetImage: controller.onGetHonorsCertificate);
              },
              title: Strings.chooseFile,
            ),
            if (controller.graduationCertificate.value.isNotEmpty)
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 100,
                  child: CustomImageWidget(
                    imageUrl: controller.graduationCertificate.value,
                  ),
                ),
              ),
            if (controller.universities.value.universities?.isNotEmpty ?? false)
              const CustomSpaceWidget(
                height: 20,
              ),
            if (controller.universities.value.universities?.isNotEmpty ?? false)
              CustomDropdownTextField(
                title: Strings.university,
                dataList: controller.universities.value.universities!,
                item: (Universities item) {
                  return item.text ?? "";
                },
                onChanged: (Universities? value) {
                  controller.selectUniversity(value!);
                },
              ),
            if (controller.universities.value.universities?.isNotEmpty ?? false)
              CustomDropdownTextField(
                title: Strings.universityHall,
                dataList: const ['Hall A', 'Hall B'],
                item: (String? item) {
                  return item ?? "";
                },
                onChanged: (String? value) {
                  // controller.selectUniversity(value!);
                },
              ),
            const CustomSpaceWidget(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextButton(
                    onPressed:
                        controller.postTeacherEducationalInformationUpdate,
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
                      controller.postTeacherEducationalInformationUpdate(
                        isNext: true,
                      );
                    },
                    title: Strings.next,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
