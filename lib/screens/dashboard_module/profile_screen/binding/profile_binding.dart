import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
