import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/controller/add_profile_picture_controller.dart';

class AddProfilePictureBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(AddProfilePictureController());
  }
}
