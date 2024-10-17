import 'package:get/get.dart';

import '../controller/email_registration_controller.dart';

class EmailRegistrationBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(EmailRegistrationController());
  }
}
