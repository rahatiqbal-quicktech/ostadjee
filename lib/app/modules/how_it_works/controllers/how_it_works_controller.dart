import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/how_it_works_model.dart';
import 'package:ostadjee/app/common/values/strings.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';

class HowItWorksController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var howItWorks = HowItWorksModel().obs;

  final List<Tab> tabs = const <Tab>[
    Tab(text: Strings.tutors),
    Tab(text: Strings.parentsStudents),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onReady() {
    super.onReady();

    getFaqs();
  }

  @override
  void onClose() {
    tabController.dispose();

    super.onClose();
  }

  void getFaqs() async {
    // _apiHelper.getFaqs().futureValue(
    //       (dynamic value) => howItWorks(HowItWorksModel.fromJson(value)),
    //       retryFunction: getFaqs,
    //     );

    final _response = await FrontEndRepository().getFaq();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      howItWorks(
          HowItWorksModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }
}
