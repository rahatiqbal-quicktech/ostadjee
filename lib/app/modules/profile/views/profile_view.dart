import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';

class ProfileView extends GetView<FrontendController> {
  ProfileView({Key? key}) : super(key: key);

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
        titleWidget: Image.asset(
          AppImages.icLogo,
          height: 40,
        ),
      ),
      endDrawer: CustomDrawerWidget(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.profileTabs.isNotEmpty)
              Container(
                color: AppColors.white,
                child: TabBar(
                  controller: controller.tabController,
                  tabs: controller.profileTabs,
                  isScrollable: true,
                  indicatorColor: AppColors.kPrimaryColor,
                  labelColor: AppColors.kPrimaryColor,
                  unselectedLabelColor: AppColors.doveGray,
                  labelStyle: TextStyle(
                    fontSize: Dimens.fontSize16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: Dimens.fontSize15,
                  ),
                ),
              ),
            if (controller.profileTabs.isNotEmpty)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TabBarView(
                    controller: controller.tabController,
                    children: controller.profileTabs.map((Tab tab) {
                      final int selectedTabIndex =
                          controller.profileTabs.indexOf(tab);

                      return controller.profileWidget[selectedTabIndex];
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
