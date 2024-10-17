import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:trade_app/utils/app_string.dart';
import '../../../core/common/app_preferences.dart';
import '../../../route/app_pages.dart';
import '../../../widgets/OTPView/otp_field.dart';

class BioMetricAuthenticationController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();
  final OtpFieldController otpFieldController = OtpFieldController();
  RxString otpValue = RxString("");
  RxString savedPasscode = RxString("");

  @override
  void onInit() async {
    super.onInit();
    savedPasscode.value = AppPreference.instance.getString(AppString.bioMetricPasscode);
    print("passcode is ${savedPasscode.value}");
  }

  void addPin(String value) {
    if (otpValue.value.length < 4) {
      otpValue.value += value;
      otpFieldController.setValue(value, otpValue.value.length - 1);
    }
  }

  void removeLastValue() {
    if (otpValue.value.isNotEmpty) {
      otpFieldController.setValue("", otpValue.value.length - 1);
      otpValue.value = otpValue.value.substring(0, otpValue.value.length);
      print("otp value is ${otpValue.value}");
    }
  }

  Future<void> bioMetricAuth() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;

    final availableBiometrics = await _auth.getAvailableBiometrics();
    // print("avialable bio ${s}");

    // if(availableBiometrics.length > 0) {
    if (canAuthenticateWithBiometrics) {
      try {
        final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(biometricOnly: false, useErrorDialogs: true),
        );

        if (didAuthenticate) {
          Get.toNamed(Routes.dashboard);
        }

        print("bio authe is ${didAuthenticate} ");
      } catch (e) {
        print(e.hashCode);
        print("catch $e");
      }
    } else {
      print("can't biometric");
    }
    // } else {
    //
    // }
  }
}
