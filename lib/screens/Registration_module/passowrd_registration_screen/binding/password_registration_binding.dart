import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/controller/password_registration_controller.dart';

class PasswordRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordRegistrationController());
  }
}
