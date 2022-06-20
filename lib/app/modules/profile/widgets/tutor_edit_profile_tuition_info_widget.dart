import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/area_model.dart';
import 'package:ostadjee/app/common/pojo_model/department_model.dart';
import 'package:ostadjee/app/common/pojo_model/division_model.dart';
import 'package:ostadjee/app/common/pojo_model/medium_model.dart';
import 'package:ostadjee/app/common/pojo_model/salary_model.dart';
import 'package:ostadjee/app/common/pojo_model/subject_model.dart';
import 'package:ostadjee/app/common/pojo_model/time_shift_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_days_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/tuition_information/widgets/tuition_information_container.dart';

class TutorEditProfileTutionInformationWidget
    extends GetView<FrontendController> with AllChangedControllers {
  TutorEditProfileTutionInformationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tuitionInformationController.getDivision();
    tuitionInformationController.getArea();
    tuitionInformationController.getSalary();
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              CustomTextWidget(
                text: Strings.tutionInfo,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                isFullWidth: true,
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              Obx(() {
                return TuitionInformationContainer(
                  value: tuitionInformationController.district.value,
                  string: "Current district",
                );
              }),
              if (controller.division.value.divisions?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectProvideTuitionDistricts,
                  dataList: controller.division.value.divisions!,
                  item: (Divisions item) {
                    return item.text ?? "";
                  },
                  onChanged: (Divisions? value) {
                    controller.selectDivision(value!);
                  },
                ),
              Obx(() {
                return TuitionInformationContainer(
                  value: tuitionInformationController.area.value,
                  string: "Current area",
                );
              }),
              if (controller.area.value.areas?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.area.value.areas?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.preferredAreaForTuition,
                  dataList: controller.area.value.areas!,
                  item: (Areas item) {
                    return item.text ?? "";
                  },
                  onChanged: (Areas? value) {
                    controller.selectArea(value!);
                  },
                ),
              if (controller.mediums.value.mediums?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.mediums.value.mediums?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.preferredMedium,
                  dataList: controller.mediums.value.mediums!,
                  item: (Mediums item) {
                    return item.text ?? "";
                  },
                  onChanged: (Mediums? value) {
                    controller.selectMedium(value!);
                  },
                ),
              if (controller.departments.value.departments?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.departments.value.departments?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.preferredClasses,
                  dataList: controller.departments.value.departments!,
                  item: (Departments item) {
                    return item.text ?? "";
                  },
                  onChanged: (Departments? value) {
                    controller.selectPreferredClassForTutionInformation(value!);
                  },
                ),
              if (controller.selectedPreferredClass.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.selectedPreferredClass.isNotEmpty)
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.black,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    children: controller.selectedPreferredClass
                        .map((Departments item) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.doveGray.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              text: item.text ?? "",
                              fontSize: Dimens.fontSize12,
                              color: AppColors.black,
                            ),
                            const CustomSpaceWidget(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .removePreferredClassForTutionInformation(
                                        item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (controller.subjects.value.subjects?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.subjects.value.subjects?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.preferredSubjects,
                  dataList: controller.subjects.value.subjects!,
                  item: (Subjects item) {
                    return item.text ?? "";
                  },
                  onChanged: (Subjects? value) {
                    controller
                        .selectPreferredSubjectForTutionInformation(value!);
                  },
                ),
              if (controller.selectedPreferredSubjects.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.selectedPreferredSubjects.isNotEmpty)
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.black,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    children: controller.selectedPreferredSubjects
                        .map((Subjects item) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.doveGray.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              text: item.text ?? "",
                              fontSize: Dimens.fontSize12,
                              color: AppColors.black,
                            ),
                            const CustomSpaceWidget(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .removePreferredSubjectForTutionInformation(
                                        item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (controller.tutionDays.value.tutiondays?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.tutionDays.value.tutiondays?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.daysPerWeek,
                  dataList: controller.tutionDays.value.tutiondays!,
                  item: (Tutiondays item) {
                    return item.text ?? "";
                  },
                  onChanged: (Tutiondays? value) {
                    controller.selectDaysPerWeekForTutionInformation(value!);
                  },
                ),
              if (controller.selectedDaysPerWeek.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.selectedDaysPerWeek.isNotEmpty)
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.black,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    children:
                        controller.selectedDaysPerWeek.map((Tutiondays item) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.doveGray.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              text: item.text ?? "",
                              fontSize: Dimens.fontSize12,
                              color: AppColors.black,
                            ),
                            const CustomSpaceWidget(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .removeDaysPerWeekForTutionInformation(
                                        item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (controller.timeShifts.value.timeshifts?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.timeShifts.value.timeshifts?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.timingShift,
                  dataList: controller.timeShifts.value.timeshifts!,
                  item: (Timeshifts item) {
                    return item.text ?? "";
                  },
                  onChanged: (Timeshifts? value) {
                    controller.selectTimeShiftsForTutionInformation(value!);
                  },
                ),
              if (controller.selectedTimeShift.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.selectedTimeShift.isNotEmpty)
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.black,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    children:
                        controller.selectedTimeShift.map((Timeshifts item) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.doveGray.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextWidget(
                              text: item.text ?? "",
                              fontSize: Dimens.fontSize12,
                              color: AppColors.black,
                            ),
                            const CustomSpaceWidget(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .removeTimeShiftsForTutionInformation(item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (controller.salary.value.salaries?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              Obx(() {
                return TuitionInformationContainer(
                  value: tuitionInformationController.salary.value,
                  string: "Current salary",
                );
              }),
              if (controller.salary.value.salaries?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.expectedSalary,
                  dataList: controller.salary.value.salaries!,
                  item: (Salaries item) {
                    return item.salary ?? "";
                  },
                  onChanged: (Salaries? value) {
                    controller.selectSalaryRange(value!);
                  },
                ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextFieldWidget(
                hintText: Strings.tuitionExperience,
                controller: controller.tuitionExperience,
              ),
              const CustomSpaceWidget(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextButton(
                      onPressed: controller.postTeacherTutionInformationUpdate,
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
                        controller.postTeacherTutionInformationUpdate(
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
        ));
  }
}
