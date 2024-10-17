import 'package:get/get.dart';
import '../controller/otp_registration_controller.dart';

class OtpRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpRegistrationController());
  }
}
