import 'dart:async';
import 'package:get/get.dart';
import 'package:trade_app/screens/login_screen/model/login_model.dart';

import '../../../core/common/app_preferences.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_string.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    splashTimer();
    super.onInit();
  }

  /// Initializes a timer to delay the splash screen logic.
  /// The timer waits for one second before checking the login session.
  void splashTimer() async {
    var response = await AppPreference.instance.getString(AppString.prefKeyUserLoginData);

    // print("splash passcode null is ${response == null}");
    // print("splash passcode is ${response.isEmpty}");
    print("splash passcode is ${response}");

    Timer(const Duration(seconds: 3), () async {
      if (response.isNotEmpty) {
        Get.offAllNamed(Routes.biometricAuthentication);
      } else {
        Get.offAllNamed(Routes.introduction);
      }
    });
  }
}
