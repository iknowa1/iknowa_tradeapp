import 'package:get/get.dart';
import 'package:trade_app/screens/forgot_password_screen/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordController());
  }
}
