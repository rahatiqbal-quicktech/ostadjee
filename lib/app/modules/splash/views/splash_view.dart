import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/splash/views/landing_signin.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_login.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/all_changed_controllers.dart';
import 'package:ostadjee/changes/dummy_screen.dart';
import 'package:ostadjee/changes/features/landing/login_page.dart';

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
        Get.to(() => LoginPage());

        // Get.offAndToNamed(Routes.LANDING);
        // Get.to(() => LandingSignin());
        // Get.to(() => const DummyScreen());
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
