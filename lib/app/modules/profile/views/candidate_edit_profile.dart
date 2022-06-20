import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_appbar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_bottom_bar_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_drawer_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_button.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_field_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class CandidateEditProfile extends GetView<FrontendController> {
  CandidateEditProfile({
    Key? key,
  }) : super(key: key);

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
        title: Strings.editProfile,
      ),
      endDrawer: CustomDrawerWidget(),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Utils.showImagePicker(
                        onGetImage: controller.onGetCandidateProfilePicture);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CustomImageWidget(
                        imageUrl: controller.candidateProfilePhotoUrl.value,
                      ),
                    ),
                  ),
                ),
                const CustomSpaceWidget(
                  height: 5,
                ),
                CustomTextWidget(
                  text: Strings.clickHereToUploadImage,
                  fontSize: Dimens.fontSize12,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                  align: TextAlign.center,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                CustomTextWidget(
                  text: Strings.fullName,
                  fontSize: Dimens.fontSize15,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                ),
                CustomTextFieldWidget(
                  controller: controller.candidateName,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                CustomTextWidget(
                  text: Strings.phoneNumber,
                  fontSize: Dimens.fontSize15,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                ),
                CustomTextFieldWidget(
                  controller: controller.candidatePhone,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                CustomTextWidget(
                  text: Strings.emailAddress,
                  fontSize: Dimens.fontSize15,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                ),
                CustomTextFieldWidget(
                  controller: controller.candidateEmail,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                CustomTextWidget(
                  text: Strings.presentAddress,
                  fontSize: Dimens.fontSize15,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                ),
                CustomTextFieldWidget(
                  controller: controller.candidatePresentAddress,
                  minLines: 5,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                CustomTextWidget(
                  text: Strings.permanentAddress,
                  fontSize: Dimens.fontSize15,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                ),
                CustomTextFieldWidget(
                  controller: controller.candidatePermanentAddress,
                  minLines: 5,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Utils.showImagePicker(
                            onGetImage: controller.onGetCandidateFrontNid);
                      },
                      child: CustomImageWidget(
                        imageUrl: controller.candidateFrontNidUrl.value,
                      ),
                    ),
                  ),
                ),
                const CustomSpaceWidget(
                  height: 5,
                ),
                CustomTextWidget(
                  text: Strings.clickHereToUploadNIDFront,
                  fontSize: Dimens.fontSize12,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                  align: TextAlign.center,
                ),
                const CustomSpaceWidget(
                  height: 10,
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Utils.showImagePicker(
                            onGetImage: controller.onGetCandidateBackNid);
                      },
                      child: CustomImageWidget(
                        imageUrl: controller.candidateBackNidUrl.value,
                      ),
                    ),
                  ),
                ),
                const CustomSpaceWidget(
                  height: 5,
                ),
                CustomTextWidget(
                  text: Strings.clickHereToUploadNIDBack,
                  fontSize: Dimens.fontSize12,
                  color: AppColors.doveGray,
                  isFullWidth: true,
                  align: TextAlign.center,
                ),
                const CustomSpaceWidget(
                  height: 30,
                ),
                CustomTextButton(
                  onPressed: controller.postCandidateProfileEdit,
                  title: Strings.submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
