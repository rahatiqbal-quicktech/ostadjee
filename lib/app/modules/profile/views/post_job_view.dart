import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_post_job_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/job_post_count/job_post_count_widget.dart';

class PostJobView extends GetView<FrontendController>
    with AllChangedControllers {
  PostJobView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    jobPostCountController.getJobPostCount();
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
        title: Strings.postJob,
      ),
      endDrawer: CustomDrawerWidget(),
      body: Obx(() {
        return SafeArea(
          child: jobPostCountController.postLimit.value == 0
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: JobPostCountWidget(),
                )
              : CandidatePostJobWidget(),
        );
      }),
    );
  }
}
