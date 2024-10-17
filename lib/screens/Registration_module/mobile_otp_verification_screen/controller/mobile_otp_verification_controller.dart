import 'package:get/get.dart';
import '../../../../widgets/OTPView/otp_field.dart';

class MobileOtpVerificationController extends GetxController {
  final OtpFieldController otpFieldController = OtpFieldController();
  RxString otpValue = RxString("");

  @override
  void onInit() async {
    super.onInit();
  }
}
