import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/tutor_grid_item_widget.dart';

class PremiumTutorView extends GetView<FrontendController> {
  PremiumTutorView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          title: Strings.premiumTutors.capitalizeFirst,
        ),
        endDrawer: CustomDrawerWidget(),
        body: Obx(() => SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: [
                    if (controller.premiumTutor.value.tutors != null)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .7,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: controller
                                .premiumTutor.value.tutors?.data?.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          Data item = controller
                              .premiumTutor.value.tutors!.data![index];

                          return TutorGridItemWidget(
                            id: item.id ?? 0,
                            controller: controller,
                            leadingImage: item.image ?? "",
                            name: item.fullName ?? "",
                            university: item.teacherUniversity ?? "",
                            subject: item.teacherSubject ?? "",
                          );
                        },
                      ),
                  ],
                ),
              ),
            )));
  }
}
