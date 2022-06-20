import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_slider_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/modules/widgets/tution_jobs_item_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/can_apply/controller/can_apply_function.dart';
import 'package:ostadjee/changes/features/featured_tutor/featured_tutors_widget.dart';
import 'package:ostadjee/changes/shared/controllers/all_price_controller.dart';
import 'package:ostadjee/changes/shared/controllers/all_price_controller.dart';

import '../../../common/pojo_model/tution_jobs_model.dart';

class HomeView extends GetView<FrontendController> with AllChangedControllers {
  HomeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (controller.tutor.value == false) {
      featuresTutorsController.getFeaturedTutors();
    }
    print("controller.tutor.value ${controller.tutor.value}");
    canApplyFunctionController.jobMatchIdList.clear();

    // canApplyFunctionController.getJobMatchIdList();
    // if (controller.tutor.value) {
    //   canApplyFunctionController.ifShouldUpgrade();
    //   print(
    //       "This will show if should upgrade true/false - ${canApplyFunctionController.shouldUpgrade.value}");
    //   // print(canApplyFunctionController.shouldUpgrade.value);
    // }
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: false,
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
        // title: Strings.home,
        titleWidget: Image.asset(
          AppImages.icLogo,
          height: 40,
        ),
      ),
      endDrawer: CustomDrawerWidget(),
      bottomNavigationBar: const CustomBottomBarWidget(),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                if (controller.slider.value.sliders?.isNotEmpty ?? false)
                  CustomSliderWidget(slider: controller.slider.value.sliders),
                ListTile(
                  onTap: () {
                    controller.onSearchIconClick();
                  },
                  contentPadding: EdgeInsets.zero,
                  title: CustomTextWidget(
                    text: controller.tutor.value
                        ? Strings.searchJobTitle
                        : Strings.searchTeacherTitle,
                    fontSize: Dimens.fontSize16,
                    color: AppColors.black,
                  ),
                  subtitle: CustomTextWidget(
                    text: controller.tutor.value
                        ? Strings.searchJobTag
                        : Strings.searchTeacherTag,
                    fontSize: Dimens.fontSize15,
                    color: AppColors.doveGray,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),

                CustomTextWidget(
                  text:
                      controller.tutor.value ? Strings.jobList : "Tutors' List",
                  isFullWidth: true,
                  fontSize: Dimens.fontSize20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                if (!controller.tutor.value)
                  TutorsListWidget(
                      featuresTutorsController: featuresTutorsController),

                // if ((controller.candidateTeacherList.value.teacherlist
                //             ?.isNotEmpty ??
                //         false) &&
                //     !controller.tutor.value)
                //   ListView.separated(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: controller
                //             .candidateTeacherList.value.teacherlist?.length ??
                //         0,
                //     separatorBuilder: (_, index) {
                //       return const CustomSpaceWidget(
                //         height: 10,
                //       );
                //     },
                //     itemBuilder: (BuildContext context, int index) {
                //       Teacherlist item = controller
                //           .candidateTeacherList.value.teacherlist![index];

                //       return TeacherItemWidget(
                //         sl: "# ${index + 1}",
                //         id: item.id!,
                //         phone: item.hireTeacher?.phoneNumber ?? "",
                //         hireDate: item.createdAt,
                //         name: item.hireTeacher?.fullName ?? "",
                //         presentAddress:
                //             item.hireTeacher?.teacherPresentAddress ?? "",
                //         status: "${Strings.status}: ${item.status}",
                //       );
                //     },
                //   ),
                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate:
                //       const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: .7,
                //     crossAxisSpacing: 15,
                //     mainAxisSpacing: 15,
                //   ),
                //   itemCount:
                //       controller.featureTutor.value.featuretutors?.length ??
                //           0,
                //   itemBuilder: (BuildContext context, int index) {
                //     Featuretutors item =
                //         controller.featureTutor.value.featuretutors![index];

                //     return TutorGridItemWidget(
                //       id: item.id ?? 0,
                //       controller: controller,
                //       leadingImage: item.image ?? "",
                //       name: item.fullName ?? "",
                //       university: item.teacherUniversity ?? "",
                //       subject: item.teacherSubject ?? "",
                //     );
                //   },
                // ),
                if ((controller.tutionJobs.value.jobs?.data?.isNotEmpty ??
                        true) &&
                    controller.tutor.value)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.tutionJobs.value.jobs?.data?.length ?? 0,
                    separatorBuilder: (_, index) {
                      return const CustomSpaceWidget(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Data item =
                          controller.tutionJobs.value.jobs!.data![index];
                      return TutionJobsItemWidget(
                        jobId: item.id.toString(),
                        title: item.title ?? "",
                        category: item.jmedium?.name ?? "",
                        tutionClass: item.jdepartment?.departmentName ?? "",
                        salary: item.jsalary?.salary ?? "",
                        subjects: item.jsubject?.subjectName ?? "",
                        daysPerWeek: item.jdays?.dayweek ?? "",
                        location: item.address ?? "",
                        createdAt: item.createdAt ?? "",
                        studentGender: item.sGender ?? "",
                        preferGender: item.sGender ?? "",
                        latitude: item.latitude ?? "",
                        longitude: item.longitude ?? "",
                      );
                    },
                  ),
                // ListView.separated(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount:
                //       controller.featureJobs.value.jobmatch?.length ?? 0,
                //   separatorBuilder: (_, index) {
                //     return const CustomSpaceWidget(
                //       height: 10,
                //     );
                //   },
                //   itemBuilder: (BuildContext context, int index) {
                //     Jobmatch item =
                //         controller.featureJobs.value.jobmatch![index];
                //     return TutionJobsItemWidget(
                //       jobId: item.id.toString(),
                //       title: item.title ?? "",
                //       location: item.address ?? "",
                //       createdAt: item.createdAt ?? "",
                //       studentGender: item.sGender ?? "",
                //       preferGender: item.sGender ?? "",
                //       latitude: item.latitude ?? "",
                //       longitude: item.longitude ?? "",
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
