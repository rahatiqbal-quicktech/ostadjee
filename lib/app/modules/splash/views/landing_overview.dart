import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/division_tutor_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/leading_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class LandingOverview extends GetView<LeadingController> {
  const LandingOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        appBar: CustomAppbarWidget(
          backgroundColor: AppColors.lightGray,
          addBackButton: false,
          titleWidget: Image.asset(
            AppImages.icLogo,
            height: 40,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                      )),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: overviewItem(
                              AppImages.icTotalApply,
                              Strings.totalApplied,
                              controller.totalApply.value.toString(),
                            ),
                          ),
                          Expanded(
                            child: overviewItem(
                              AppImages.icLiveTuitionJobs,
                              Strings.liveTuitionJobs,
                              controller.totalTution.value.toString(),
                            ),
                          ),
                        ],
                      ),
                      const CustomSpaceWidget(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: overviewItem(
                              AppImages.icHappyStudents,
                              Strings.happyStudents,
                              controller.totalStudents.value.toString(),
                            ),
                          ),
                          Expanded(
                            child: overviewItem(
                              AppImages.icAverageTutorRating,
                              Strings.averageTutorRating,
                              controller.rating,
                            ),
                          ),
                        ],
                      ),
                      const CustomSpaceWidget(
                        height: 40,
                      ),
                      CustomTextWidget(
                        text: Strings.liveTuitionJobs,
                        color: AppColors.kPrimaryColor,
                        fontSize: Dimens.fontSize22,
                        fontWeight: FontWeight.bold,
                        isFullWidth: true,
                        align: TextAlign.center,
                      ),
                      if ((controller.divisionTutor.value.divisiontutors
                                  ?.isNotEmpty ??
                              false) &&
                          !controller.tutor.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                              children: controller
                                  .divisionTutor.value.divisiontutors!
                                  .map((Divisiontutors item) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                              margin: const EdgeInsets.fromLTRB(8, 15, 8, 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                              child: CustomTextWidget(
                                text:
                                    "${item.name ?? ""}  ${item.divisiontutorsCount}",
                                color: AppColors.doveGray,
                                fontSize: Dimens.fontSize16,
                                fontWeight: FontWeight.bold,
                              ),
                              // CustomRowTextWidget(
                              //                   title: item.name ?? "",
                              //                   subtitle: "${item.divisiontutorsCount}",
                              //                 ),
                            );
                          }).toList()),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget overviewItem(String iconPath, String title, String value) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: 60,
        ),
        const CustomSpaceWidget(
          width: 8,
        ),
        Expanded(
          child: Column(
            children: [
              CustomTextWidget(
                text: value,
                color: AppColors.kPrimaryColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.bold,
                isFullWidth: true,
              ),
              CustomTextWidget(
                text: title,
                color: AppColors.doveGray,
                fontSize: Dimens.fontSize10,
                fontWeight: FontWeight.w400,
                align: TextAlign.left,
                isFullWidth: true,
                maxLine: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
