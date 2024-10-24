import 'package:get/get.dart';
import '../controller/service_controller.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ServiceController());
  }
}
