import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tution_jobs_model.dart' as job;
import 'package:ostadjee/app/common/pojo_model/tutor_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/tution_jobs_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/tutor_item_widget.dart';

class SearchResult extends GetView<FrontendController> {
  SearchResult({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("This is what i am looking for");
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: const CustomBottomBarWidget(),
        appBar: CustomAppbarWidget(
          backgroundColor: AppColors.white,
          addBackButton: true,
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
          title:
              controller.tutor.value ? Strings.studentList : Strings.tutorList,
        ),
        endDrawer: CustomDrawerWidget(),
        body: Obx(() => SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: [
                    if (controller.tutor.value &&
                        controller.searchTutionJobs.value.jobs != null)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller
                                .searchTutionJobs.value.jobs?.data?.length ??
                            0,
                        separatorBuilder: (_, index) {
                          return const CustomSpaceWidget(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          job.Data item = controller
                              .searchTutionJobs.value.jobs!.data![index];

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
                    if (!controller.tutor.value &&
                        controller.tutors.value.tutors != null)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.tutors.value.tutors?.data?.length ?? 0,
                        separatorBuilder: (_, index) {
                          return const CustomSpaceWidget(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          Data item =
                              controller.tutors.value.tutors!.data![index];

                          return TutorItemWidget(
                            id: item.id ?? 0,
                            controller: controller,
                            leadingImage: item.image ?? "",
                            name: item.fullName ?? "",
                            area: getAreaByList(item.tareas),
                            teaching: item.teacherSubject ?? "",
                            experience: item.tuitionExperience ?? "",
                            joinedOn: item.createdAt ?? "",
                            qualification: item.teacherDegree ?? "",
                            isSearchList: true,
                          );
                        },
                      )
                  ],
                ),
              ),
            )));
  }

  String getAreaByList(List<Tareas>? tAreas) {
    String areas = "";

    if (tAreas != null) {
      for (int i = 0; i < tAreas.length; i++) {
        if (areas.isEmpty) {
          areas = tAreas[i].area!;
        } else {
          areas = "$areas, ${tAreas[i].area!}";
        }
      }
    }
    return areas;
  }
}
