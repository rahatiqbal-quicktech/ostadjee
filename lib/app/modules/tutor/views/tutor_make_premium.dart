import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class TutorMakePremium extends GetView<FrontendController> {
  TutorMakePremium({Key? key}) : super(key: key);

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
          title: Strings.makeMePremium,
        ),
        endDrawer: CustomDrawerWidget(),
        body: Obx(() => SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                  children: [
                    CustomTextWidget(
                      text:
                          controller.premiumContent.value.contents?[0].title ??
                              "",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.fontSize18,
                      isFullWidth: true,
                    ),
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                    CustomTextWidget(
                      text: (controller
                              .premiumContent.value.contents?[0].description
                              ?.replaceAll('<br>', '\n')) ??
                          "",
                      color: AppColors.black,
                      fontSize: Dimens.fontSize15,
                      maxLine: 10,
                      isFullWidth: true,
                    ),
                    const CustomSpaceWidget(
                      height: 20,
                    ),
                    CustomTextButton(
                      onPressed: controller.postPremiumTutorRequest,
                      title: Strings.wantToBePremiumTeacher,
                    )
                  ],
                ),
              ),
            )));
  }
}
