import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TradePassportController extends GetxController {
  late TabController tabController;
  RxInt selectedTab = RxInt(0);

  @override
  void onInit() async {
    super.onInit();
  }
}
