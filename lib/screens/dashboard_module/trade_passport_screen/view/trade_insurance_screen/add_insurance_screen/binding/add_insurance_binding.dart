import 'package:get/get.dart';

import '../controller/add_insurance_controller.dart';

class AddInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddInsuranceController());
  }
}
