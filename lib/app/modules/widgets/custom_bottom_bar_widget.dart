import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class CustomBottomBarWidget extends GetView<FrontendController> {
  const CustomBottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 60,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: controller.tutor.value
              ? const SizedBox()
              : SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 10,
                    onPressed: () {
                      Get.toNamed(Routes.POST_JOB_VIEW);
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPrimaryColor,
                      ),
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              color: Colors.transparent,
              height: 60.0,
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HOME);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [FaIcon(FontAwesomeIcons.house)],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.BAG_VIEW);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [FaIcon(FontAwesomeIcons.briefcase)],
                        ),
                      ),
                    ),
                    if (!controller.tutor.value)
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.POST_JOB_VIEW);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.transparent,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.MATCH_VIEW);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.solidHandshake)
                            // Icon(
                            //   Icons.handshake_outlined,
                            //   color: AppColors.black,
                            //   size: 25,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (controller.token.isNotEmpty) {
                            Get.toNamed(Routes.PROFILE_VIEW);
                          } else {
                            Get.toNamed(Routes.TUTOR_LOGIN);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [FaIcon(FontAwesomeIcons.userLarge)],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
