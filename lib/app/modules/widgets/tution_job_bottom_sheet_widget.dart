import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_post_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_value_with_title_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/can_apply/can_apply_button.dart';
import 'package:ostadjee/changes/features/edit_job_post/edit_job_post_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_text_widget.dart';

class TutionJobBottomSheetWidget extends StatelessWidget
    with AllChangedControllers {
  final FrontendController controller = Get.put(FrontendController());

  final String jobId,
      title,
      category,
      tutionClass,
      salary,
      subjects,
      daysPerWeek,
      location,
      createdAt,
      studentGender,
      preferGender,
      latitude,
      longitude;
  final Postedjob? postedjobModel;

  TutionJobBottomSheetWidget({
    Key? key,
    this.jobId = "",
    this.title = "",
    this.category = "",
    this.tutionClass = "",
    this.salary = "",
    this.subjects = "",
    this.daysPerWeek = "",
    this.location = "",
    this.createdAt = "",
    this.studentGender = "",
    this.preferGender = "",
    this.latitude = "",
    this.longitude = "",
    this.postedjobModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.tutor.value == true) {
      jobMatchListController.getList();
      canApplyFunctionController.getJobMatchIdList();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: AppColors.orange,
          child: CustomTextWidget(
            text: title,
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
              if (category.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.category_outlined),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.category,
                        value: category,
                      ),
                    ),
                  ],
                ),
              if (studentGender.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.male),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.studentGender,
                        value: studentGender,
                      ),
                    ),
                  ],
                ),
              if (preferGender.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.female),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.preferGender,
                        value: preferGender,
                      ),
                    ),
                  ],
                ),
              if (daysPerWeek.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.tutoringDay,
                        value: daysPerWeek,
                      ),
                    ),
                  ],
                ),
              if (subjects.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.subject),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.subjects,
                        value: subjects,
                      ),
                    ),
                  ],
                ),
              if (tutionClass.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.class__outlined),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.tutionClass,
                        value: tutionClass,
                      ),
                    ),
                  ],
                ),
              if (salary.isNotEmpty)
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: CustomTextWidget(
                          text: "\u09F3",
                          color: AppColors.doveGray,
                          fontSize: Dimens.fontSize22,
                        ),
                      ),
                    ),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.salary,
                        value: salary,
                      ),
                    ),
                  ],
                ),
              if (location.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.location_city),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.location,
                        value: location,
                      ),
                    ),
                  ],
                ),
              if (createdAt.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.today),
                    const CustomSpaceWidget(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomValueWithTitleWidget(
                        title: Strings.publishedTime,
                        value: createdAt,
                      ),
                    ),
                  ],
                ),
              const CustomSpaceWidget(
                height: 20,
              ),
              if (latitude.isNotEmpty && longitude.isNotEmpty)
                CustomTextButton(
                  onPressed: () {
                    Get.back();
                    launchMap(lat: latitude, long: longitude);
                  },
                  title: Strings.viewOnMap,
                ),
              if (latitude.isNotEmpty && longitude.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              controller.tutor.value == true
                  ? CanApplyButton(jobId: int.parse(jobId))
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.to(() => EditJobPostScreen(
                                postedjobModel: postedjobModel ?? Postedjob(),
                              ));
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
              // CustomTextButton(
              //   onPressed: () {
              //     controller.postApplyJob(jobId);
              //   },
              //   title:
              //       controller.token.value.isNotEmpty && controller.tutor.value
              //           ? Strings.apply
              //           : Strings.login,
              // ),
            ],
          ),
        )
      ],
    );
  }

  launchMap({String lat = "23.7808875", String long = "90.2792409"}) async {
    var uri = Uri.parse("geo:q=$lat,$long");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
