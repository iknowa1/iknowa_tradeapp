import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../../../widgets/OTPView/otp_field.dart';

class SetPasscodeController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();
  final OtpFieldController otpFieldController = OtpFieldController();
  RxString otpValue = RxString("");

  @override
  void onInit() async {
    super.onInit();
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
    if (canAuthenticateWithBiometrics) {
      try {
        final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(
            biometricOnly: false,
          ),
        );

        print("bio authe is ${didAuthenticate} ");
      } catch (e) {
        print(e);
      }
    }
  }
}
