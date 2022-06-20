import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_payment_withdraw_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';

class TutorPaymentWithdrawView extends GetView<FrontendController> {
  TutorPaymentWithdrawView({Key? key}) : super(key: key);

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
        title: Strings.paymentWithdraw,
      ),
      endDrawer: CustomDrawerWidget(),
      body: const SafeArea(
        child: TutorPaymentWithdrawWidget(),
      ),
    );
  }
}
