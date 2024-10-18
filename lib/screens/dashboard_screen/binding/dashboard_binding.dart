import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/chat_screen/controller/chat_controller.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/controller/home_controller.dart';
import 'package:trade_app/screens/dashboard_module/jobs_screen/controller/jobs_controller.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/controller/trade_passport_controller.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_passport_screen.dart';
import '../controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(TradePassportController());
    Get.put(JobsController());
    Get.put(ChatController());
    Get.put(ProfileController());
  }
}
