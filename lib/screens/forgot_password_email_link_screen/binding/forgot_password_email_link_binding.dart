import 'package:get/get.dart';
import 'package:trade_app/screens/forgot_password_email_link_screen/controller/forgot_password_email_link_controller.dart';

class ForgotPasswordEmailLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordEmailLinkController());
  }
}
