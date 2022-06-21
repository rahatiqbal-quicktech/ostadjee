import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/features/all_tutors/controller/all_tutors_controller.dart';
import 'package:ostadjee/changes/features/featured_tutor/controller/featured_tutors_controller.dart';
import 'package:ostadjee/changes/features/verification/verify_tutor_widget.dart';

class TutorsListWidget extends StatelessWidget {
  const TutorsListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AllTutorsController controller;
  // final String name

  @override
  Widget build(BuildContext context) {
    final frontendController = Get.put(FrontendController());
    return Obx(() {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 2,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                onTap: () {
                  frontendController
                      .getTutorDetails(controller.list[index].id!.toInt());
                },
                // leading: CircleAvatar(
                //   backgroundImage: NetworkImage("https://ostadjee.com/" +
                //       "${controller.list[index].image}"),
                // ),
                title: Text("${controller.list[index].fullName}"),
                subtitle: Text("${controller.list[index].teacherSubject}"),
                // trailing:
                //     VerfyTutorWidget(thisId: "${controller.list[index].id}"),
              ),
            );
          });
    });
  }
}
