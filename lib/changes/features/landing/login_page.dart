import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/features/landing/widgets/ktext.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  var kPrimaryColor = const Color(0xFF0F2182);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FrontendController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 244, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 170,
                    width: Get.width / 2,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/icon_o.png',
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo.png',
                  // scale: 5,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: KText(
                            text: 'Hire the right tutor today',
                            fontSize: 20,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: KText(
                            text:
                                'Book one-on-one lessons with verified tutors in your area',
                            textAlign: TextAlign.center,
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CANDIDATE_REGISTRATION);
                                },
                                child: _customOutlineButton(
                                  fontSize: 14,
                                  buttonText: 'Hire a tutor',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 40,
                              width: 2,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.TUTOR_REGISTRATION);
                                },
                                child: _customOutlineButton(
                                  fontSize: 14,
                                  buttonText: 'Become a tutor',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LANDING_SIGNIN);
                            // Get.toNamed(Routes.CANDIDATE_LOGIN);
                          },
                          child: _customOutlineButton(
                            buttonText: 'Sign In',
                            textColor: Colors.white,
                            buttonColor: kPrimaryColor,
                            fontSize: 16,
                            width: Get.width / 2.2,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: KText(
                            text: 'Or you can check those',
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: controller.onTutionJobsClick,
                              child: customTextWithCirle(
                                buttonText: 'Job board',
                                icons: Icons.list_alt,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.LANDING_OVERVIEW);
                              },
                              child: customTextWithCirle(
                                buttonText: 'Overview',
                                icons: Icons.info_outline,
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse("tel://01700112233"));
                          },
                          child: customTextWithCirle(
                            buttonText: 'Call for info',
                            icons: Icons.call,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  customTextWithCirle({
    required buttonText,
    required IconData icons,
  }) =>
      Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: kPrimaryColor,
            child: Icon(
              icons,
              size: 15,
            ),
          ),
          const SizedBox(width: 10),
          KText(
            text: buttonText,
            color: kPrimaryColor,
            fontSize: 14,
          ),
        ],
      );

  _customOutlineButton({
    required buttonText,
    Color? textColor,
    double? fontSize,
    double? width,
    Color? buttonColor,
  }) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: buttonColor,
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: Center(
        child: KText(
          text: buttonText,
          color: textColor == null ? kPrimaryColor : textColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
