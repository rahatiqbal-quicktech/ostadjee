import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/area_model.dart';
import 'package:ostadjee/app/common/pojo_model/department_model.dart';
import 'package:ostadjee/app/common/pojo_model/division_model.dart';
import 'package:ostadjee/app/common/pojo_model/gender_model.dart';
import 'package:ostadjee/app/common/pojo_model/medium_model.dart';
import 'package:ostadjee/app/common/pojo_model/salary_model.dart';
import 'package:ostadjee/app/common/pojo_model/subject_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_days_model.dart';
import 'package:ostadjee/app/common/pojo_model/university_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/job_post_count/job_post_count_widget.dart';
import 'package:ostadjee/changes/features/tutor_department/model/tutor_department_model.dart';

class CandidatePostJobWidget extends GetView<FrontendController>
    with AllChangedControllers {
  CandidatePostJobWidget({
    Key? key,
  }) : super(key: key);

  // final jobPostCountController = Get.put(JobPostCountController());
  @override
  Widget build(BuildContext context) {
    tutorDepartmentsController.getList();
    selectTutorDepartmentController.selectedTutorDepartmentsList.clear();
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              JobPostCountWidget(),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Student's Information",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey.shade800),
              ),
              const Divider(
                color: Colors.black,
              ),
              CustomTextFieldWidget(
                hintText: Strings.title,
                controller: controller.titleController,
                prefixIcon: const Icon(
                  Icons.title,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextFieldWidget(
                hintText: Strings.name,
                controller: controller.nameController,
                prefixIcon: const Icon(
                  Icons.badge_outlined,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.genders.value.genders?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectStudentGender,
                  dataList: controller.genders.value.genders!,
                  item: (Genders item) {
                    return item.text ?? "";
                  },
                  onChanged: (Genders? value) {
                    controller.selectGender(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.male,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.genders.value.genders?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              CustomTextFieldWidget(
                hintText: Strings.institute,
                controller: controller.instituteController,
                prefixIcon: const Icon(
                  Icons.history_edu_outlined,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.mediums.value.mediums?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectYourMedium,
                  dataList: controller.mediums.value.mediums!,
                  item: (Mediums item) {
                    return item.text ?? "";
                  },
                  onChanged: (Mediums? value) {
                    controller.selectMedium(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.category_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.mediums.value.mediums?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.departments.value.departments?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectStudentClass,
                  dataList: controller.departments.value.departments!,
                  item: (Departments item) {
                    return item.text ?? "";
                  },
                  onChanged: (Departments? value) {
                    controller.selectDepartment(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.merge_type_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.subjects.value.subjects?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: "Select subject",
                  dataList: controller.subjects.value.subjects!,
                  item: (Subjects item) {
                    return item.text ?? "";
                  },
                  onChanged: (Subjects? value) {
                    controller.selectSubjectForJobPost(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.subject,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.selectedSubjects.isNotEmpty)
                const CustomSpaceWidget(
                  height: 10,
                ),
              if (controller.selectedSubjects.isNotEmpty)
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
                    children: controller.selectedSubjects.map((Subjects item) {
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
                                controller.removeSubjectForJobPost(item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              if (controller.departments.value.departments?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              CustomTextFieldWidget(
                hintText: Strings.phoneNumber,
                controller: controller.phoneNumberController,
                prefixIcon: const Icon(
                  Icons.phone,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextFieldWidget(
                hintText: Strings.emailAddress,
                controller: controller.emailController,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Tutor's Requirments",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey.shade800),
              ),
              const Divider(
                color: Colors.black,
              ),
              if (controller.division.value.divisions?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: "Select Division",
                  dataList: controller.division.value.divisions!,
                  item: (Divisions item) {
                    return item.text ?? "";
                  },
                  onChanged: (Divisions? value) {
                    controller.selectDivision(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.location_city_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.division.value.divisions?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectCityName,
                  dataList: controller.division.value.divisions!,
                  item: (Divisions item) {
                    return item.text ?? "";
                  },
                  onChanged: (Divisions? value) {
                    controller.selectDivision(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.location_city_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.area.value.areas?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectAreaName,
                  dataList: controller.area.value.areas!,
                  item: (Areas item) {
                    return item.text ?? "";
                  },
                  onChanged: (Areas? value) {
                    controller.selectArea(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.map,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.area.value.areas?.isNotEmpty ?? false)
                const CustomSpaceWidget(
                  height: 10,
                ),
              CustomTextFieldWidget(
                hintText: Strings.locationDetails,
                controller: controller.locationDetailsController,
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.genders.value.genders?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.selectTeacherGender,
                  dataList: controller.genders.value.genders!,
                  item: (Genders item) {
                    return item.text ?? "";
                  },
                  onChanged: (Genders? value) {
                    controller.selectGender(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.male,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.genders.value.genders?.isNotEmpty ?? false)
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
                    // controller.selectedTutionDays(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.schedule_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              const CustomSpaceWidget(
                height: 10,
              ),

              // Doesn't work, depreciated

              // if (controller.subjects.value.subjects?.isEmpty ?? true)
              //   CustomDropdownTextField(
              //     title: "Select Subject abc",
              //     dataList: const [""],
              //     item: (String item) {
              //       return item;
              //     },
              //     onChanged: (String? value) {},
              //     prefixIcon: const Icon(
              //       Icons.subject,
              //       color: AppColors.doveGray,
              //     ),
              //   ),
              // if (controller.subjects.value.subjects?.isNotEmpty ?? false)
              const CustomSpaceWidget(
                height: 10,
              ),
              if (controller.universities.value.universities?.isNotEmpty ??
                  false)
                CustomDropdownTextField(
                  title: Strings.selectUniversity,
                  dataList: controller.universities.value.universities!,
                  item: (Universities item) {
                    return item.text ?? "";
                  },
                  onChanged: (Universities? value) {
                    controller.selectUniversitiesForJobPost(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.school_outlined,
                    color: AppColors.doveGray,
                  ),
                ),
              if (controller.selectUniversities.isNotEmpty)
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
                        controller.selectUniversities.map((Universities item) {
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
                                controller.removeUniversitiesForJobPost(item);
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

              // department feature. added later
              if (tutorDepartmentsController
                      .model.value.tutordepartments?.isNotEmpty ??
                  false)
                CustomDropdownTextField<Tutordepartment?>(
                  title: "Select Department",
                  dataList:
                      tutorDepartmentsController.model.value.tutordepartments,
                  item: (Tutordepartment? item) {
                    return item?.text ?? "";
                  },
                  onChanged: (Tutordepartment? value) {
                    // controller.selectUniversity(value!);
                    selectTutorDepartmentController.add(value!);
                  },
                  prefixIcon: const Icon(
                    Icons.bubble_chart,
                    color: AppColors.doveGray,
                  ),
                ),
              if (selectTutorDepartmentController
                  .selectedTutorDepartmentsList.isNotEmpty)
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
                    children: selectTutorDepartmentController
                        .selectedTutorDepartmentsList
                        .map((Tutordepartment item) {
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
                                selectTutorDepartmentController.remove(item);
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
              if (controller.salary.value.salaries?.isNotEmpty ?? false)
                CustomDropdownTextField(
                  title: Strings.salaryRange,
                  dataList: controller.salary.value.salaries!,
                  item: (Salaries item) {
                    return item.salary ?? "";
                  },
                  onChanged: (Salaries? value) {
                    controller.selectSalaryRange(value!);
                  },
                  prefixIcon: Center(
                    child: CustomTextWidget(
                      text: "\u09F3",
                      color: AppColors.doveGray,
                      fontSize: Dimens.fontSize22,
                    ),
                  ),
                  // prefixIcon: const Icon(
                  //   Icons.attach_money,
                  //   color: AppColors.doveGray,
                  // ),
                ),
              const CustomSpaceWidget(
                height: 10,
              ),
              CustomTextFieldWidget(
                hintText: Strings.otherRequirements,
                controller: controller.otherRequirementsController,
                keyboardType: TextInputType.multiline,
                prefixIcon: const Icon(
                  Icons.read_more,
                  color: AppColors.doveGray,
                ),
              ),
              const CustomSpaceWidget(
                height: 30,
              ),
              CustomTextButton(
                onPressed: controller.postCandidateJobPost,
                title: Strings.submit,
              )
            ],
          ),
        ));
  }
}
