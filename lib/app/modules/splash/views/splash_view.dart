import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with AllChangedControllers {
  late String token;

  @override
  void initState() {
    super.initState();

    // jobPostCountController.getJobPostCount();
    // featuresTutorsController.getFeaturedTutors();
    allPriceController.getAllPrice();

    token = Storage.getValue(Constants.token) ?? "";

    Future.delayed(const Duration(seconds: 3), () async {
      if (token.isEmpty) {
        Get.offAndToNamed(Routes.LANDING);
      } else {
        Get.offAndToNamed(Routes.HOME);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: .5,
          child: SizedBox(
            width: Get.width,
            child: const Image(
              image: AssetImage(AppImages.icLogo),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
