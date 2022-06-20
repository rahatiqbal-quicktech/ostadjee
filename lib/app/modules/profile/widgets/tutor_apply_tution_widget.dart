import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tution_apply_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/apply_tution_item_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';

class TutorApplyTutionWidget extends GetView<FrontendController> {
  const TutorApplyTutionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
          child: controller.tutionApplyList.value.tutionapply?.isEmpty ?? true
              ? Container()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.tutionApplyList.value.tutionapply?.length ?? 0,
                  separatorBuilder: (_, index) {
                    return const CustomSpaceWidget(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Tutionapply item =
                        controller.tutionApplyList.value.tutionapply![index];
                    return ApplyTutionItemWidget(
                      jobId: "${Strings.jobId}: ${item.jobId}",
                      name: item.tapplyjob?.title,
                      date: "${Strings.date}: ${item.createdAt}",
                      status: "${Strings.status}: ${item.status}",
                    );
                  },
                ),
        ));
  }
}
