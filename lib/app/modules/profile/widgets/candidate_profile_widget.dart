import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_value_with_title_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class CandidateProfileWidget extends GetView<FrontendController> {
  const CandidateProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextButton(
            onPressed: () {
              controller.candidateProfilePhotoUrl(
                  controller.candidateDashboard.value.candidate?.image ?? "");
              controller.candidateFrontNidUrl(
                  controller.candidateDashboard.value.candidate?.nid ?? "");
              controller.candidateBackNidUrl(
                  controller.candidateDashboard.value.candidate?.nidBack ?? "");

              controller.candidateName.text =
                  controller.candidateDashboard.value.candidate?.fullName ?? "";
              controller.candidatePhone.text =
                  controller.candidateDashboard.value.candidate?.phoneNumber ??
                      "";
              controller.candidateEmail.text =
                  controller.candidateDashboard.value.candidate?.email ?? "";
              controller.candidatePresentAddress.text = controller
                      .candidateDashboard.value.candidate?.presentAddress ??
                  "";
              controller.candidatePermanentAddress.text = controller
                      .candidateDashboard.value.candidate?.parmanentAddress ??
                  "";

              Get.toNamed(Routes.CANDIDATE_PROFILE_EDIT_VIEW);
            },
            title: Strings.editProfile,
            buttonColor: Colors.transparent,
            addBorder: true,
          ),
          const CustomSpaceWidget(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: AppColors.orange,
            child: CustomTextWidget(
              text: Strings.personalInfo,
              fontSize: Dimens.fontSize18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              isFullWidth: true,
            ),
          ),
          const CustomSpaceWidget(
            height: 20,
          ),
          CustomValueWithTitleWidget(
            title: Strings.fullName,
            value:
                controller.candidateDashboard.value.candidate?.fullName ?? "",
          ),
          CustomValueWithTitleWidget(
            title: Strings.phoneNumber,
            value: controller.candidateDashboard.value.candidate?.phoneNumber ??
                "",
          ),
          CustomValueWithTitleWidget(
            title: Strings.emailAddress,
            value: controller.candidateDashboard.value.candidate?.email ?? "",
          ),
          CustomValueWithTitleWidget(
            title: Strings.presentAddress,
            value:
                controller.candidateDashboard.value.candidate?.presentAddress ??
                    "",
          ),
          CustomValueWithTitleWidget(
            title: Strings.permanentAddress,
            value: controller
                    .candidateDashboard.value.candidate?.parmanentAddress ??
                "",
          ),
          if (controller.candidateDashboard.value.candidate?.nid != null)
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                Strings.nidFront,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.doveGray,
                  fontSize: Dimens.fontSize15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          if (controller.candidateDashboard.value.candidate?.nid != null)
            AspectRatio(
              aspectRatio: 1.5,
              child: SizedBox(
                width: Get.width,
                child: CustomImageWidget(
                  imageUrl: controller.candidateDashboard.value.candidate?.nid,
                ),
              ),
            ),
          if (controller.candidateDashboard.value.candidate?.nidBack != null)
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                Strings.nidBack,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.doveGray,
                  fontSize: Dimens.fontSize15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          if (controller.candidateDashboard.value.candidate?.nidBack != null)
            AspectRatio(
              aspectRatio: 1.5,
              child: SizedBox(
                width: Get.width,
                child: CustomImageWidget(
                  imageUrl:
                      controller.candidateDashboard.value.candidate?.nidBack,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
