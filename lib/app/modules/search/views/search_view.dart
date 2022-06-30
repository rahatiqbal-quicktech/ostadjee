import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/area_model.dart';
import 'package:ostadjee/app/common/pojo_model/department_model.dart';
import 'package:ostadjee/app/common/pojo_model/division_model.dart';
import 'package:ostadjee/app/common/pojo_model/gender_model.dart';
import 'package:ostadjee/app/common/pojo_model/medium_model.dart';
import 'package:ostadjee/app/common/pojo_model/subject_model.dart';
import 'package:ostadjee/app/common/pojo_model/university_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_dropdown_textfield.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/district_for_search/model/district_for_search_model.dart';

class SearchView extends GetView<FrontendController>
    with AllChangedControllers {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    districtsForSearchController.getDistricts();
    return Scaffold(
        bottomNavigationBar: const CustomBottomBarWidget(),
        appBar: CustomAppbarWidget(
          backgroundColor: AppColors.white,
          addBackButton: true,
          title: controller.tutor.value
              ? Strings.searchJobTitle
              : Strings.searchTeacherTitle,
        ),
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  if (controller.division.value.divisions?.isNotEmpty ?? false)
                    CustomDropdownTextField(
                      title: Strings.divisionsDropDown,
                      dataList: controller.division.value.divisions!,
                      item: (Divisions item) {
                        return item.text ?? "";
                      },
                      onChanged: (Divisions? value) {
                        controller.selectDivision(value!);
                      },
                    ),
                  const CustomSpaceWidget(
                    height: 20,
                  ),
                  CustomDropdownTextField(
                    title: "Select District / City",
                    dataList: districtsForSearchController.districtsList.value,
                    item: (District? item) {
                      return item?.text ?? "";
                    },
                    onChanged: (District? value) {
                      // controller.selectDivision(value!);
                      controller.selectDivisionAndgetArea(value);
                      print(value?.text);
                    },
                  ),
                  if (controller.area.value.areas?.isNotEmpty ?? false)
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                  if (controller.area.value.areas?.isNotEmpty ?? false)
                    CustomDropdownTextField(
                      title: Strings.areaDropDown,
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
                      height: 20,
                    ),
                  if (controller.mediums.value.mediums?.isNotEmpty ?? false)
                    CustomDropdownTextField(
                      title: Strings.mediumDropDown,
                      dataList: controller.mediums.value.mediums!,
                      item: (Mediums item) {
                        return item.text ?? "";
                      },
                      onChanged: (Mediums? value) {
                        controller.selectMedium(value!);
                      },
                    ),
                  if (controller.departments.value.departments?.isNotEmpty ??
                      false)
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                  if (controller.departments.value.departments?.isNotEmpty ??
                      false)
                    CustomDropdownTextField(
                      title: Strings.departmentDropDown,
                      dataList: controller.departments.value.departments!,
                      item: (Departments item) {
                        return item.text ?? "";
                      },
                      onChanged: (Departments? value) {
                        controller.selectDepartment(value!);
                      },
                    ),
                  if (controller.subjects.value.subjects?.isNotEmpty ?? false)
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                  if (controller.subjects.value.subjects?.isNotEmpty ?? false)
                    CustomDropdownTextField(
                      title: Strings.subjectDropDown,
                      dataList: controller.subjects.value.subjects!,
                      item: (Subjects item) {
                        return item.text ?? "";
                      },
                      onChanged: (Subjects? value) {
                        controller.selectSubject(value!);
                      },
                    ),
                  if (controller.genders.value.genders?.isNotEmpty ?? false)
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                  if (controller.genders.value.genders?.isNotEmpty ?? false)
                    CustomDropdownTextField(
                      title: Strings.genderDropDown,
                      dataList: controller.genders.value.genders!,
                      item: (Genders item) {
                        return item.text ?? "";
                      },
                      onChanged: (Genders? value) {
                        controller.selectGender(value!);
                      },
                    ),
                  if (controller.genders.value.genders?.isNotEmpty ?? false)
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                  if (controller.universities.value.universities?.isNotEmpty ??
                      false)
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
                  const CustomSpaceWidget(
                    height: 40,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      controller.searchData();
                    },
                    title: controller.tutor.value
                        ? Strings.jobSearchButtonText
                        : Strings.teacherSearchButtonText,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
