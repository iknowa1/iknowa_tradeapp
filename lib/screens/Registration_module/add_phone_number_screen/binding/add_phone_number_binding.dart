import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/add_phone_number_screen/controller/add_phone_number_controller.dart';

class AddPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddPhoneNumberController());
  }
}
