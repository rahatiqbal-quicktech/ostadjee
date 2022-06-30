import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/features/all_tutors/controller/all_tutors_controller.dart';
import 'package:ostadjee/changes/features/featured_tutor/controller/featured_tutors_controller.dart';
import 'package:ostadjee/changes/features/verification/verify_tutor_widget.dart';

class TutorsListWidget extends StatefulWidget {
  const TutorsListWidget({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  @override
  State<TutorsListWidget> createState() => _TutorsListWidgetState();
}

class _TutorsListWidgetState extends State<TutorsListWidget>
    with AllChangedControllers {
  // final AllTutorsController controller;
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        print("abcde");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final frontendController = Get.put(FrontendController());
    // allTutorsController.getAllTutor();
    return Obx(() {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 2,
            );
          },
          shrinkWrap: true,
          primary: false,
          itemCount: (allTutorsController.list.length / 45).round() + 1,
          // (allTutorsController.list.length / 45).round() + 1,
          itemBuilder: (context, index) {
            if (index < (allTutorsController.list.length / 45).round()) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  onTap: () {
                    frontendController.getTutorDetails(
                        allTutorsController.list[index].id!.toInt());
                  },
                  leading: const Icon(
                      Icons.account_circle), // leading: CachedNetworkImage(
                  //   imageUrl:
                  //       "https://ostadjee.com/" "${controller.list[index].image}",
                  //   placeholder: (context, url) =>
                  //       const CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) =>
                  //       const Icon(Icons.image_not_supported),
                  // ),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage("https://ostadjee.com/" +
                  //       "${controller.list[index].image}"),
                  // ),
                  title: Text("${allTutorsController.list[index].fullName}"),
                  subtitle: Text(
                      allTutorsController.list[index].teacherSubject ?? ""),
                  // trailing: VerfyTutorWidget(
                  //     thisId: "${allTutorsController.list[index].id}"),
                ),
              );
            } else {
              return Align(
                alignment: Alignment.bottomLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Get.bottomSheet(allTutorsBottomSheet(frontendController));
                  },
                  icon: const Icon(Icons.list),
                  label: const Text("Show all tutors"),
                  style: TextButton.styleFrom(
                    primary: AppColors.kPrimaryColor,
                  ),
                ),
              );
            }
          });
    });
  }

  Container allTutorsBottomSheet(FrontendController frontendController) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.white70,
              height: 2,
            );
          },
          itemCount: (allTutorsController.list.length).round(),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                frontendController.getTutorDetails(
                    allTutorsController.list[index].id!.toInt());
              },
              leading: const Icon(Icons.account_circle),
              // leading: CachedNetworkImage(
              //   imageUrl:
              //       "https://ostadjee.com/" "${controller.list[index].image}",
              //   placeholder: (context, url) =>
              //       const CircularProgressIndicator(),
              //   errorWidget: (context, url, error) =>
              //       const Icon(Icons.image_not_supported),
              // ),
              // CircleAvatar(
              //   backgroundImage: NetworkImage("https://ostadjee.com/" +
              //       "${controller.list[index].image}"),
              // ),
              title: Text("${allTutorsController.list[index].fullName}"),
              subtitle:
                  Text(allTutorsController.list[index].teacherSubject ?? ""),
              // trailing:
              //     VerfyTutorWidget(thisId: "${controller.list[index].id}"),
            );
          }),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ostadjee/app/common/constants.dart';
// import 'package:ostadjee/app/controllers/frontend_controller.dart';
// import 'package:ostadjee/app/repository/frontend_repository.dart';
// import 'package:ostadjee/app/routes/app_pages.dart';
// import 'package:ostadjee/changes/features/all_tutors/controller/all_tutors_controller.dart';
// import 'package:ostadjee/changes/features/featured_tutor/controller/featured_tutors_controller.dart';
// import 'package:ostadjee/changes/features/verification/verify_tutor_widget.dart';

// class TutorsListWidget extends StatelessWidget {
//   const TutorsListWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final AllTutorsController controller;
//   // final String name

//   @override
//   Widget build(BuildContext context) {
//     final frontendController = Get.put(FrontendController());
//     return Obx(() {
//       return ListView.separated(
//           separatorBuilder: (context, index) {
//             return const SizedBox(
//               height: 2,
//             );
//           },
//           shrinkWrap: true,
//           primary: false,
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return Container(
//               decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(8)),
//               child: ListTile(
//                 onTap: () {
//                   frontendController
//                       .getTutorDetails(controller.list[index].id!.toInt());
//                 },
//                 // leading: CircleAvatar(
//                 //   backgroundImage: NetworkImage("https://ostadjee.com/" +
//                 //       "${controller.list[index].image}"),
//                 // ),
//                 title: Text("${controller.list[index].fullName}"),
//                 subtitle: Text("${controller.list[index].teacherSubject}"),
//                 // trailing:
//                 //     VerfyTutorWidget(thisId: "${controller.list[index].id}"),
//               ),
//             );
//           });
//     });
//   }
// }
