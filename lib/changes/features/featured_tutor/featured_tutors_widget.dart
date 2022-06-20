import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/changes/features/featured_tutor/controller/featured_tutors_controller.dart';
import 'package:ostadjee/changes/features/verification/verify_tutor_widget.dart';

class TutorsListWidget extends StatelessWidget {
  const TutorsListWidget({
    Key? key,
    required this.featuresTutorsController,
  }) : super(key: key);

  final FeaturedTutorsController featuresTutorsController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 2,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: featuresTutorsController.featuredTutorsList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://ostadjee.com/" +
                      "${featuresTutorsController.featuredTutorsList[index].image}"),
                ),
                title: Text(
                    "${featuresTutorsController.featuredTutorsList[index].fullName}"),
                subtitle: Text(
                    "${featuresTutorsController.featuredTutorsList[index].teacherSubject}"),
                trailing: VerfyTutorWidget(
                    thisId:
                        "${featuresTutorsController.featuredTutorsList[index].id}"),
              ),
            );
          });
    });
  }
}
