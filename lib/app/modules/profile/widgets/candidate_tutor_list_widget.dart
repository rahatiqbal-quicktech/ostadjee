import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_teacher_list_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/teacher_item_widget.dart';

class CandidateTutorListWidget extends GetView<FrontendController> {
  const CandidateTutorListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.candidateTeacherList.value.teacherlist?.isEmpty ?? true
        ? Container()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 5.w),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  controller.candidateTeacherList.value.teacherlist?.length ??
                      0,
              separatorBuilder: (_, index) {
                return const CustomSpaceWidget(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                Teacherlist item =
                    controller.candidateTeacherList.value.teacherlist![index];

                return TeacherItemWidget(
                  sl: "# ${index + 1}",
                  id: item.id!,
                  phone: item.hireTeacher?.phoneNumber ?? "",
                  hireDate: item.createdAt,
                  name: item.hireTeacher?.fullName ?? "",
                  presentAddress: item.hireTeacher?.teacherPresentAddress ?? "",
                  status: "${Strings.status}: ${item.status}",
                );
              },
            ),
          );
  }
}
