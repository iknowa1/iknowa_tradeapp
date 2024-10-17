import 'package:get/get.dart';
import '../controller/bio_metric_authentication_controller.dart';

class BioMetricAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BioMetricAuthenticationController());
  }
}
