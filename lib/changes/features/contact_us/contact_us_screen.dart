import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 5,
          ),
          ListTile(
            leading: const Icon(
              Icons.call,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text("Call 01911-122436"),
            onTap: () {
              launchUrl(Uri.parse('tel://01911-122436'));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.mail,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text("contacts@ostadjee.com"),
            onTap: () async {
              var result = await OpenMailApp.openMailApp();
              if (!result.didOpen && result.canOpen) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return MailAppPickerDialog(
                      mailApps: result.options,
                    );
                  },
                );
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.location_history,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text("181 Hatirpool, Dhaka"),
            onTap: () {
              MapsLauncher.launchQuery('Hatirpool, Dhaka');
            },
          )
        ],
      ),
    );
  }
}
