import 'package:get/get.dart';

import '../controller/set_passcode_controller.dart';

class SetPasscodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SetPasscodeController());
  }
}
