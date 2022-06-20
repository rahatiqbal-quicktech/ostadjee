import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/changes/features/upgrade_post_limit/webview_screen.dart';

class UpgradePostLimitService {
  String fullUrl = "https://ostadjee.com/api/v1/candidate/post-limit-payment";

  Future post({required String quantity}) async {
    int quantityValue = int.parse(quantity);
    Map<String, dynamic> data = {'quantity': quantity};
    final response = await http.post(Uri.parse(fullUrl),
        headers: {
          'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
        },
        body: data);
    final responseData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseData);
      Get.to(() => WebviewScreen(url: responseData['data']));
    }
  }
}
