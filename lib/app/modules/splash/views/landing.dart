import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/leading_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends GetView<LeadingController> {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  padding: EdgeInsets.all(50.w),
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      image: AssetImage(AppImages.icIcon),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                const FractionallySizedBox(
                  widthFactor: .5,
                  child: Image(
                    image: AssetImage(AppImages.icLogo),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const CustomSpaceWidget(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: Strings.leadingTitle,
                        color: AppColors.black,
                        fontSize: Dimens.fontSize22,
                        fontWeight: FontWeight.w400,
                      ),
                      const CustomSpaceWidget(
                        height: 5,
                      ),
                      CustomTextWidget(
                        text: Strings.leadingBody,
                        maxLine: 2,
                        color: AppColors.doveGray,
                        fontSize: Dimens.fontSize15,
                        align: TextAlign.center,
                      ),
                      const CustomSpaceWidget(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              height: 35,
                              buttonColor: AppColors.white,
                              addBorder: true,
                              radius: 50,
                              onPressed: () {
                                Get.toNamed(Routes.CANDIDATE_REGISTRATION);
                              },
                              title: Strings.hireAtutor,
                              textFontSize: Dimens.fontSize12,
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 4,
                            color: AppColors.lightGray,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Expanded(
                            child: CustomTextButton(
                              height: 35,
                              buttonColor: AppColors.white,
                              addBorder: true,
                              radius: 50,
                              onPressed: () {
                                Get.toNamed(Routes.TUTOR_REGISTRATION);
                              },
                              title: Strings.becomeAtutor,
                              textFontSize: Dimens.fontSize12,
                            ),
                          ),
                        ],
                      ),
                      const CustomSpaceWidget(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width / 2.5,
                        child: CustomTextButton(
                          height: 35,
                          addBorder: true,
                          radius: 50,
                          onPressed: () {
                            Get.toNamed(Routes.LANDING_SIGNIN);
                          },
                          title: Strings.signIn,
                        ),
                      ),
                      const CustomSpaceWidget(
                        height: 30,
                      ),
                      CustomTextWidget(
                        text: Strings.orYouCanCheckThose,
                        color: AppColors.doveGray,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.w400,
                        isFullWidth: true,
                      ),
                      const CustomSpaceWidget(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: controller.onTutionJobsClick,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: const Icon(
                                      Icons.assignment_outlined,
                                      color: AppColors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const CustomSpaceWidget(
                                    width: 8,
                                  ),
                                  CustomTextWidget(
                                    text: Strings.jobBoard,
                                    color: AppColors.black,
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.LANDING_OVERVIEW);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: const Icon(
                                      Icons.info_outline,
                                      color: AppColors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const CustomSpaceWidget(
                                    width: 8,
                                  ),
                                  CustomTextWidget(
                                    text: Strings.overview,
                                    color: AppColors.black,
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const CustomSpaceWidget(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                launch("tel://01700112233");
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: const Icon(
                                      Icons.phone,
                                      color: AppColors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const CustomSpaceWidget(
                                    width: 8,
                                  ),
                                  CustomTextWidget(
                                    text: Strings.callForInfo,
                                    color: AppColors.black,
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ostadjee/app/common/util/exports.dart';
// import 'package:ostadjee/app/controllers/leading_controller.dart';
// import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
// import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
// import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';
// import 'package:ostadjee/app/routes/app_pages.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Landing extends GetView<LeadingController> {
//   const Landing({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.lightGray,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             // padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: Get.width / 2,
//                   decoration: const BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(200),
//                       bottomRight: Radius.circular(200),
//                     ),
//                   ),
//                   // padding: EdgeInsets.all(50.w),
//                   child: const AspectRatio(
//                     aspectRatio: 1,
//                     child: Image(
//                       height: 100,
//                       image: AssetImage(AppImages.icIcon),
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                 ),
//                 const CustomSpaceWidget(
//                   height: 20,
//                 ),
//                 const FractionallySizedBox(
//                   widthFactor: .5,
//                   child: Image(
//                     height: 100,
//                     image: AssetImage(AppImages.icLogo),
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 const CustomSpaceWidget(
//                   height: 20,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   // padding: EdgeInsets.all(20.w),
//                   child: Column(
//                     children: [
//                       CustomTextWidget(
//                         text: Strings.leadingTitle,
//                         color: AppColors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       const CustomSpaceWidget(
//                         height: 5,
//                       ),
//                       CustomTextWidget(
//                         text: Strings.leadingBody,
//                         maxLine: 2,
//                         color: AppColors.doveGray,
//                         fontSize: Dimens.fontSize15,
//                         align: TextAlign.center,
//                       ),
//                       // const CustomSpaceWidget(
//                       //   height: 10,
//                       // ),
//                       SizedBox(
//                         height: 100,
//                         child: Container(
//                           color: Colors.red,
//                           child: Row(
//                             children: [
//                               Container(
//                                 color: Colors.blue,
//                                 height: 50,
//                                 child: CustomTextButton(
//                                   height: 35,
//                                   buttonColor: AppColors.white,
//                                   addBorder: true,
//                                   radius: 50,
//                                   onPressed: () {
//                                     Get.toNamed(Routes.CANDIDATE_REGISTRATION);
//                                   },
//                                   title: Strings.hireAtutor,
//                                   textFontSize: 20,
//                                 ),
//                               ),
//                               const Text(
//                                 "abcde",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               Container(
//                                 height: 35,
//                                 width: 4,
//                                 color: AppColors.lightGray,
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                               ),
//                               CustomTextButton(
//                                 height: 35,
//                                 buttonColor: AppColors.white,
//                                 addBorder: true,
//                                 radius: 50,
//                                 onPressed: () {
//                                   Get.toNamed(Routes.TUTOR_REGISTRATION);
//                                 },
//                                 title: Strings.becomeAtutor,
//                                 textFontSize: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const CustomSpaceWidget(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         width: Get.width / 2.5,
//                         child: CustomTextButton(
//                           height: 35,
//                           addBorder: true,
//                           radius: 50,
//                           onPressed: () {
//                             Get.toNamed(Routes.LANDING_SIGNIN);
//                           },
//                           title: Strings.signIn,
//                         ),
//                       ),
//                       const CustomSpaceWidget(
//                         height: 30,
//                       ),
//                       CustomTextWidget(
//                         text: Strings.orYouCanCheckThose,
//                         color: AppColors.doveGray,
//                         fontSize: Dimens.fontSize16,
//                         fontWeight: FontWeight.w400,
//                         isFullWidth: true,
//                       ),
//                       const CustomSpaceWidget(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: controller.onTutionJobsClick,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: AppColors.kPrimaryColor,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   padding: const EdgeInsets.all(6),
//                                   child: const Icon(
//                                     Icons.assignment_outlined,
//                                     color: AppColors.white,
//                                     size: 15,
//                                   ),
//                                 ),
//                                 const CustomSpaceWidget(
//                                   width: 8,
//                                 ),
//                                 CustomTextWidget(
//                                   text: Strings.jobBoard,
//                                   color: AppColors.black,
//                                   fontSize: Dimens.fontSize14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Get.toNamed(Routes.LANDING_OVERVIEW);
//                             },
//                             child: Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: AppColors.kPrimaryColor,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   padding: const EdgeInsets.all(6),
//                                   child: const Icon(
//                                     Icons.info_outline,
//                                     color: AppColors.white,
//                                     size: 15,
//                                   ),
//                                 ),
//                                 const CustomSpaceWidget(
//                                   width: 8,
//                                 ),
//                                 CustomTextWidget(
//                                   text: Strings.overview,
//                                   color: AppColors.black,
//                                   fontSize: Dimens.fontSize14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const CustomSpaceWidget(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               launch("tel://01700112233");
//                             },
//                             child: Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: AppColors.kPrimaryColor,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   padding: const EdgeInsets.all(6),
//                                   child: const Icon(
//                                     Icons.phone,
//                                     color: AppColors.white,
//                                     size: 15,
//                                   ),
//                                 ),
//                                 const CustomSpaceWidget(
//                                   width: 8,
//                                 ),
//                                 CustomTextWidget(
//                                   text: Strings.callForInfo,
//                                   color: AppColors.black,
//                                   fontSize: Dimens.fontSize14,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(),
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

