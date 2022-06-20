import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/social_icons_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CustomDrawerSocialIcons extends StatelessWidget {
  SocialIconsModel socialIconsModel;

  CustomDrawerSocialIcons({
    Key? key,
    required this.socialIconsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialIconsModel.socialicons!.map((Socialicons icon) {
          Widget iconData;

          switch (icon.icon) {
            case "fas fa-rss":
              iconData = const FaIcon(FontAwesomeIcons.rss);
              break;
            case "fab fa-youtube":
              iconData = const FaIcon(FontAwesomeIcons.youtube);
              break;
            case "fab fa-instagram":
              iconData = const FaIcon(FontAwesomeIcons.instagram);
              break;
            case "fab fa-twitter":
              iconData = const FaIcon(FontAwesomeIcons.twitter);
              break;
            case "fab fa-facebook-f":
              iconData = const FaIcon(FontAwesomeIcons.facebookF);
              break;
            default:
              iconData = const FaIcon(FontAwesomeIcons.house);
              break;
          }

          return IconButton(
              icon: iconData,
              iconSize: 20,
              onPressed: () {
                _launchURL(icon.link!);
              });
        }).toList(),
      ),
    );
  }

  void _launchURL(String url) async {
    if (url == "#") {
      Get.snackbar(
        "Sorry",
        "URL not exists",
        backgroundColor: AppColors.black,
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColors.white,
      );
    } else if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }
}
