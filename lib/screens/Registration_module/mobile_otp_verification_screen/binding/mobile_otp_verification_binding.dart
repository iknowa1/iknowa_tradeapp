import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/mobile_otp_verification_screen/controller/mobile_otp_verification_controller.dart';

class MobileOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MobileOtpVerificationController());
  }
}
