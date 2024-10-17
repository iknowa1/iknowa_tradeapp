import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/email_verification_success_screen/controller/email_verification_success_controller.dart';

class EmailVerificationSuccessBinding extends Bindings {

  @override
  void dependencies() {

    Get.put(EmailVerificationSuccessController());
  }
}
