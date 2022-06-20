import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_post_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_match_job_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/job_post_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/tution_jobs_item_widget.dart';

class MatchView extends GetView<FrontendController> {
  MatchView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      bottomNavigationBar: const CustomBottomBarWidget(),
      appBar: CustomAppbarWidget(
        backgroundColor: AppColors.white,
        addBackButton: true,
        title: controller.tutor.value
            ? Strings.matchedJob
            : Strings.matchedTeacher,
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                // Text("asdhashdiashd"),
                if ((controller.candidatePostList.value.postedjob?.isEmpty ??
                        true) &&
                    !controller.tutor.value)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.candidatePostList.value.postedjob?.length ??
                            0,
                    separatorBuilder: (_, index) {
                      return const CustomSpaceWidget(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Postedjob item =
                          controller.candidatePostList.value.postedjob![index];

                      return JobPostItemWidget(
                        sl: "${index + 1}",
                        controller: controller,
                        postId: "${item.id}",
                        date: "${item.createdAt}",
                        name: "${item.title}",
                        apply: item.totalapplyCount,
                        status: "${item.status}",
                        jobId: item.id.toString(),
                        title: item.title ?? "",
                        location: item.address ?? "",
                        createdAt: item.createdAt ?? "",
                        studentGender: item.sGender ?? "",
                        preferGender: item.sGender ?? "",
                      );
                    },
                  ),
                if ((controller.featureJobs.value.jobmatch?.isNotEmpty ??
                        true) &&
                    controller.tutor.value)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.featureJobs.value.jobmatch?.length ?? 0,
                    separatorBuilder: (_, index) {
                      return const CustomSpaceWidget(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Jobmatch item =
                          controller.featureJobs.value.jobmatch![index];
                      return TutionJobsItemWidget(
                        jobId: item.id.toString(),
                        title: item.title ?? "",
                        location: item.address ?? "",
                        createdAt: item.createdAt ?? "",
                        studentGender: item.sGender ?? "",
                        preferGender: item.sGender ?? "",
                        latitude: item.latitude ?? "",
                        longitude: item.longitude ?? "",
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
