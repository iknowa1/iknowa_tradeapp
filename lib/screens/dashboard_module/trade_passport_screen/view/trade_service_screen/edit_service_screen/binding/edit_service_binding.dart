import 'package:get/get.dart';
import '../controller/EditServiceController.dart';

class EditServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditServiceController());
  }
}
