import 'package:get/get.dart';
import 'package:trade_app/screens/introduction_screen/controller/introduction_controller.dart';

class IntroductionBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroductionController());
  }
}
