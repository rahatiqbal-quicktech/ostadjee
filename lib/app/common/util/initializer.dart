import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:ostadjee/app/data/api_helper.dart';
// import 'package:ostadjee/app/data/api_helper_impl.dart';
// import 'package:ostadjee/app/data/interface_controller/api_interface_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_error_widget.dart';

class Initializer {
  static const Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  const Initializer._internal();

  void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      Firebase.initializeApp();

      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      printInfo(info: 'runZonedGuarded: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();

      _initScreenPreference();
      // _initApis();
    } catch (err) {
      rethrow;
    }
  }

  // void _initApis() {
  //   Get.put<ApiHelper>(
  //     ApiHelperImpl(),
  //   );
  //
  //   Get.put<ApiInterfaceController>(
  //     ApiInterfaceController(),
  //   );
  // }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
