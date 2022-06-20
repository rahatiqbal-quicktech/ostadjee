import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_value_with_title_widget.dart';
import 'package:ostadjee/app/modules/widgets/education_item_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class TutorProfileWidget extends GetView<FrontendController> {
  const TutorProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextButton(
              onPressed: () {
                controller.selectedProfileEditTab(0);
                Get.toNamed(Routes.TUTOR_PROFILE_EDIT_VIEW);
              },
              title: Strings.editProfile,
              buttonColor: Colors.transparent,
              addBorder: true,
            ),
            const CustomSpaceWidget(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: AppColors.orange,
              child: CustomTextWidget(
                text: Strings.personalInfo,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                isFullWidth: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.tutorId,
                      value:
                          "TS-${controller.teacherDashboard.value.teacher?.id ?? ""}",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.fullName,
                      value:
                          controller.teacherDashboard.value.teacher?.fullName ??
                              "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.phoneNumber,
                      value: controller
                              .teacherDashboard.value.teacher?.phoneNumber ??
                          "",
                    ),
                  // const CustomValueWithTitleWidget(
                  //   title: Strings.alternativeNumber,
                  //   value: "",
                  // ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.emailAddress,
                      value: controller.teacherDashboard.value.teacher?.email ??
                          "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.institution,
                      value: controller.teacherDashboard.value.teacher
                              ?.teacherUniversity ??
                          "",
                    ),
                  // const CustomValueWithTitleWidget(
                  //   title: Strings.backgroundMedium,
                  //   value: "",
                  // ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.subject,
                      value: controller
                              .teacherDashboard.value.teacher?.teacherSubject ??
                          "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.qualificationDegree,
                      value: controller
                              .teacherDashboard.value.teacher?.teacherDegree ??
                          "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.presentAddress,
                      value: controller.teacherDashboard.value.teacher
                              ?.teacherPresentAddress ??
                          "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    CustomValueWithTitleWidget(
                      title: Strings.permanentAddress,
                      value: controller.teacherDashboard.value.teacher
                              ?.teacherPermanentAddress ??
                          "",
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: AppColors.orange,
              child: CustomTextWidget(
                text: Strings.tutionInfo,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                isFullWidth: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (controller
                          .teacherDashboard.value.teacher?.tuitionSalary !=
                      null)
                    CustomValueWithTitleWidget(
                      title: Strings.expectedMinimumSalary,
                      value: controller
                              .teacherDashboard.value.teacher?.tuitionSalary ??
                          "",
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: AppColors.orange,
              child: CustomTextWidget(
                text: Strings.educationalQualification,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                isFullWidth: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  if (controller.teacherDashboard.value.teacher != null)
                    EducationItemWidget(
                      examName: "SSC",
                      year:
                          controller.teacherDashboard.value.teacher?.sscYear ??
                              "",
                      institute:
                          controller.teacherDashboard.value.teacher?.sscGroup ??
                              "",
                      group: controller
                              .teacherDashboard.value.teacher?.sscInstitute ??
                          "",
                      result:
                          controller.teacherDashboard.value.teacher?.sscGpa ??
                              "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    const Divider(
                      thickness: 1.5,
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    EducationItemWidget(
                      examName: "HSC",
                      year:
                          controller.teacherDashboard.value.teacher?.hscYear ??
                              "",
                      institute:
                          controller.teacherDashboard.value.teacher?.hscGroup ??
                              "",
                      group: controller
                              .teacherDashboard.value.teacher?.hscInstitute ??
                          "",
                      result:
                          controller.teacherDashboard.value.teacher?.hscGpa ??
                              "",
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    const Divider(
                      thickness: 1.5,
                    ),
                  if (controller.teacherDashboard.value.teacher != null)
                    EducationItemWidget(
                      examName: "Honours",
                      year: controller
                              .teacherDashboard.value.teacher?.honoursYear ??
                          "",
                      institute: controller
                              .teacherDashboard.value.teacher?.honoursSubject ??
                          "",
                      group: controller.teacherDashboard.value.teacher
                              ?.honoursInstitute ??
                          "",
                      result: controller
                              .teacherDashboard.value.teacher?.honoursGpa ??
                          "",
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
