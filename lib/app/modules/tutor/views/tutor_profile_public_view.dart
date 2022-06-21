import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_details_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/contact_tutor_bottom_sheet_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_value_with_title_widget.dart';
import 'package:ostadjee/app/modules/widgets/education_item_widget.dart';

class TutorProfilePublicView extends GetView<FrontendController> {
  TutorProfilePublicView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: const CustomBottomBarWidget(),
        appBar: CustomAppbarWidget(
          backgroundColor: AppColors.white,
          addBackButton: true,
          title: Strings.tutorDetails,
          actions: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        endDrawer: CustomDrawerWidget(),
        body: Obx(() => SafeArea(
              child: controller.tutorDetails.value.tutordetails == null
                  ? Container()
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      width: double.infinity,
                                      child: CustomImageWidget(
                                        imageUrl: controller.tutorDetails.value
                                            .tutordetails?.image,
                                      ),
                                    ),
                                    // Positioned(
                                    //   bottom: 0,
                                    //   right: 0,
                                    //   child: Container(
                                    //     padding: const EdgeInsets.fromLTRB(
                                    //         20, 5, 20, 5),
                                    //     color: AppColors.orange,
                                    //     child: CustomTextWidget(
                                    //       text: Strings.premiumTutor,
                                    //       fontSize: Dimens.fontSize20,
                                    //       color: AppColors.white,
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      CustomValueWithTitleWidget(
                                        title: Strings.name,
                                        value: controller.tutorDetails.value
                                                .tutordetails?.fullName ??
                                            "",
                                        icon: Icons.badge_outlined,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.id,
                                        value:
                                            "TS-${controller.tutorDetails.value.tutordetails?.id ?? ""}",
                                        icon: Icons.tag,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.gender,
                                        value: controller.tutorDetails.value
                                                .tutordetails?.gender ??
                                            "",
                                        icon: Icons.male,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.qualification,
                                        value: controller.tutorDetails.value
                                                .tutordetails?.teacherDegree ??
                                            "",
                                        icon: Icons.equalizer,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.areaCovered,
                                        value: getAreasString(controller
                                            .tutorDetails
                                            .value
                                            .tutordetails!
                                            .tareas!),
                                        icon: Icons.map,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.teaching,
                                        value: getSubjectsString(controller
                                            .tutorDetails
                                            .value
                                            .tutordetails!
                                            .tsubjects!),
                                        icon: Icons.subject,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.presentLocation,
                                        value: controller
                                                .tutorDetails
                                                .value
                                                .tutordetails
                                                ?.teacherPresentAddress ??
                                            "",
                                        icon: Icons.location_on_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                      CustomValueWithTitleWidget(
                                        title: Strings.expectedMinimumSalary,
                                        value: controller.tutorDetails.value
                                                    .tutordetails!.tsalary ==
                                                null
                                            ? ""
                                            : controller
                                                    .tutorDetails
                                                    .value
                                                    .tutordetails
                                                    ?.tsalary
                                                    ?.salary ??
                                                "",
                                        widget: SizedBox(
                                          width: 24,
                                          child: Center(
                                            child: CustomTextWidget(
                                              text: "\u09F3",
                                              color: AppColors.doveGray,
                                              fontSize: Dimens.fontSize22,
                                            ),
                                          ),
                                        ),
                                      ),

                                      CustomValueWithTitleWidget(
                                        title: Strings.daysPerWeek,
                                        value: tutionDaysString(controller
                                                .tutorDetails
                                                .value
                                                .tutordetails!
                                                .tdays!) ??
                                            "",
                                        icon: Icons.schedule,
                                      ),
                                      // const CustomValueWithTitleWidget(
                                      //   title: Strings.prefferedTutionStyle,
                                      //   value: "Private Tuition",
                                      // ),
                                      // const CustomValueWithTitleWidget(
                                      //   title: Strings.placeOfLearning,
                                      //   value: "Home Visit",
                                      // ),
                                      // const CustomValueWithTitleWidget(
                                      //   title: Strings.extraFacilities,
                                      //   value: "Phone help",
                                      // ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.prefferedMediumOfVersion,
                                        value: controller.tutorDetails.value
                                                    .tutordetails!.tmedium ==
                                                null
                                            ? ""
                                            : controller
                                                    .tutorDetails
                                                    .value
                                                    .tutordetails
                                                    ?.tmedium
                                                    ?.name ??
                                                "",
                                        icon: Icons.category_outlined,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.prefferedClass,
                                        value: tutionDepartmentsString(
                                                controller
                                                    .tutorDetails
                                                    .value
                                                    .tutordetails!
                                                    .tdepartments!) ??
                                            "",
                                        icon: Icons.merge_type_outlined,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.prefferedSubjects,
                                        value: getSubjectsString(controller
                                            .tutorDetails
                                            .value
                                            .tutordetails!
                                            .tsubjects!),
                                        icon: Icons.subject,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.preferredTime,
                                        value: getShiftsString(controller
                                            .tutorDetails
                                            .value
                                            .tutordetails!
                                            .tshifts!),
                                        icon: Icons.schedule,
                                      ),
                                      CustomValueWithTitleWidget(
                                        title: Strings.prefferedAreaToTeach,
                                        value: getAreasString(controller
                                            .tutorDetails
                                            .value
                                            .tutordetails!
                                            .tareas!),
                                        icon: Icons.map_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: Column(
                                    children: [
                                      EducationItemWidget(
                                        examName: "SSC",
                                        year: controller.tutorDetails.value
                                                .tutordetails?.sscYear ??
                                            "",
                                        institute: controller.tutorDetails.value
                                                .tutordetails?.sscGroup ??
                                            "",
                                        group: controller.tutorDetails.value
                                                .tutordetails?.sscInstitute ??
                                            "",
                                        result: controller.tutorDetails.value
                                                .tutordetails?.sscGpa ??
                                            "",
                                      ),
                                      const Divider(
                                        thickness: 1.5,
                                      ),
                                      EducationItemWidget(
                                        examName: "SSC",
                                        year: controller.tutorDetails.value
                                                .tutordetails?.hscYear ??
                                            "",
                                        institute: controller.tutorDetails.value
                                                .tutordetails?.hscGroup ??
                                            "",
                                        group: controller.tutorDetails.value
                                                .tutordetails?.hscInstitute ??
                                            "",
                                        result: controller.tutorDetails.value
                                                .tutordetails?.hscGpa ??
                                            "",
                                      ),
                                      const Divider(
                                        thickness: 1.5,
                                      ),
                                      EducationItemWidget(
                                        examName: "Honours",
                                        year: controller.tutorDetails.value
                                                .tutordetails?.honoursYear ??
                                            "",
                                        institute: controller.tutorDetails.value
                                                .tutordetails?.honoursSubject ??
                                            "",
                                        group: controller
                                                .tutorDetails
                                                .value
                                                .tutordetails
                                                ?.honoursInstitute ??
                                            "",
                                        result: controller.tutorDetails.value
                                                .tutordetails?.honoursGpa ??
                                            "",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const CustomSpaceWidget(
                          height: 10,
                        ),
                        CustomTextButton(
                          onPressed: () {
                            Get.bottomSheet(
                              const ContactTutorBottomSheetWidget(),
                              backgroundColor: AppColors.white,
                              isScrollControlled: true,
                            );
                          },
                          title: Strings.contactWithThisTutor,
                        )
                      ],
                    ),
            )));
  }

  getAreasString(List<Tareas> tareas) {
    String text = "";

    for (int i = 0; i < tareas.length; i++) {
      if (i != 0) {
        text = text + ", ";
      }
      text = text + tareas[i].area!;
    }

    return text;
  }

  getSubjectsString(List<Tsubjects> list) {
    String text = "";

    for (int i = 0; i < list.length; i++) {
      if (i != 0) {
        text = text + ", ";
      }
      text = text + list[i].subjectName!;
    }

    return text;
  }

  tutionDaysString(List<Tdays> tdays) {
    String text = "";

    for (int i = 0; i < tdays.length; i++) {
      if (i != 0) {
        text = text + ", ";
      }
      text = text + tdays[i].dayweek!;
    }

    return text;
  }

  tutionDepartmentsString(List<Tdepartments> list) {
    String text = "";

    for (int i = 0; i < list.length; i++) {
      if (i != 0) {
        text = text + ", ";
      }
      text = text + list[i].departmentName!;
    }

    return text;
  }

  getShiftsString(List<Tshifts> list) {
    String text = "";

    for (int i = 0; i < list.length; i++) {
      if (i != 0) {
        text = text + ", ";
      }
      text = text + list[i].shiftname!;
    }

    return text;
  }
}
