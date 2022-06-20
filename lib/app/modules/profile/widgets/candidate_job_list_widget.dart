import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_post_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/job_post_item_widget.dart';

class CandidateJobListWidget extends GetView<FrontendController> {
  const CandidateJobListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.candidatePostList.value.postedjob?.isEmpty ?? true
        ? Container()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  controller.candidatePostList.value.postedjob?.length ?? 0,
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
          );
  }
}
