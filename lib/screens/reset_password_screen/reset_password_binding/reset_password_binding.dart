import 'package:get/get.dart';
import '../reset_password_controller/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController());
  }
}
