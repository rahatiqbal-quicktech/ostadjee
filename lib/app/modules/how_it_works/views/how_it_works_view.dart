import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/how_it_works/controllers/how_it_works_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_faq_tab_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';

class HowItWorksView extends GetView<HowItWorksController> {
  HowItWorksView({Key? key}) : super(key: key);

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
          title: Strings.howItWorks,
        ),
        endDrawer: CustomDrawerWidget(),
        body: Obx(
          () => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  controller: controller.tabController,
                  tabs: controller.tabs,
                  isScrollable: true,
                  indicatorColor: AppColors.kPrimaryColor,
                  labelColor: AppColors.doveGray,
                  labelStyle: TextStyle(
                    fontSize: Dimens.fontSize16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: Dimens.fontSize15,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: TabBarView(
                      controller: controller.tabController,
                      children: controller.tabs.map((Tab tab) {
                        final String label = tab.text!.toLowerCase();

                        return Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Text(
                                "Here's how it works for $label",
                                style: TextStyle(fontSize: Dimens.fontSize18),
                              ),
                            ),
                            const CustomSpaceWidget(
                              height: 30,
                            ),
                            if (controller
                                    .howItWorks.value.teacherfaq?.isNotEmpty ??
                                false)
                              CustomFaqTabWidget(
                                faqs: controller.tabs.indexOf(tab) == 0
                                    ? controller.howItWorks.value.teacherfaq!
                                    : controller.howItWorks.value.candidatefaq!,
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
