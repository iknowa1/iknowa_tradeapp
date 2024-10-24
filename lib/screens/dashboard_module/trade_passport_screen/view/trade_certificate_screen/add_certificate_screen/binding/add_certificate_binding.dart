import 'package:get/get.dart';

import '../controller/add_certificate_controller.dart';

class AddCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddCertificateController());
  }
}
