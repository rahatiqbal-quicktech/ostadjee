import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/job_post_count/controller/job_post_count_controller.dart';
import 'package:ostadjee/changes/features/upgrade_post_limit/upgrade_post_limit_screen.dart';

class JobPostCountWidget extends StatelessWidget with AllChangedControllers {
  JobPostCountWidget({
    Key? key,
    // required this.jobPostCountController,
  }) : super(key: key);

  // final JobPostCountController jobPostCountController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          // JobPostCountService().fetchJobPostCount();
          jobPostCountController.getJobPostCount();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                "Job Post (Available Post Limit : ${jobPostCountController.postLimit})",
                style: TextStyle(
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            jobPostCountController.postLimit.value == 0
                ? GestureDetector(
                    onTap: () {
                      Get.to(() => UpgradePostLimitScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: Colors.blue),
                        color: Colors.yellow,
                      ),
                      child: const Text(
                        "Your post limit is over. Click here to upgrade.",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    });
  }
}
