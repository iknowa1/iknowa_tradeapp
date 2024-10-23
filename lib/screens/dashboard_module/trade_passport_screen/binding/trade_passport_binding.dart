import 'package:get/get.dart';
import '../controller/trade_passport_controller.dart';

class TradePassportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TradePassportController());
  }
}
