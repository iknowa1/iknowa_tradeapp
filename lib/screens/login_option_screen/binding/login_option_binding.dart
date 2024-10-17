import 'package:get/get.dart';
import 'package:trade_app/screens/login_option_screen/controller/login_option_controller.dart';

class LoginOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginOptionController());
  }
}
