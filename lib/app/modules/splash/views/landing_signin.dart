// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/leading_controller.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class LandingSignin extends GetView<LeadingController> {
  LandingSignin({Key? key}) : super(key: key);

  final CarouselController _controller = CarouselController();

  List<String> icons = [AppImages.icGurdian, AppImages.icTeacher];
  List<String> routes = [Routes.CANDIDATE_LOGIN, Routes.TUTOR_LOGIN];
  List<String> titles = [Strings.gurardianTitle, Strings.tutorTitle];
  List<String> subtitles = [Strings.gurardianSubtitle, Strings.tutorSubtitle];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Column(
              children: [
                Text(
                  Strings.chooseYourself,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Dimens.fontSize28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Center(
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        aspectRatio: .8,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: .5,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          controller.updateCurrentIndex(index);
                        },
                      ),
                      items: icons.map((String item) {
                        return SizedBox(
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(500)),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(routes[icons.indexOf(item)]);
                                },
                                child: Container(
                                  color: AppColors.white,
                                  padding: EdgeInsets.all(15.w),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        item,
                                        height: 120,
                                      ),
                                      const Spacer(),
                                      Text(
                                        titles[icons.indexOf(item)],
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: Dimens.fontSize20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Spacer(),
                                      Text(
                                        subtitles[icons.indexOf(item)],
                                        style: TextStyle(
                                          color: AppColors.doveGray,
                                          fontSize: Dimens.fontSize22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Spacer(),
                                      const Spacer(),
                                      const Icon(
                                        Icons.check_circle_outline,
                                        size: 40,
                                        color: AppColors.kPrimaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: icons.asMap().entries.map((entry) {
                      return Container(
                        width: controller.currentSlide.value == entry.key
                            ? 60
                            : 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(50),
                          color: (AppColors.kPrimaryColor.withOpacity(
                              controller.currentSlide.value == entry.key
                                  ? 0.9
                                  : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
