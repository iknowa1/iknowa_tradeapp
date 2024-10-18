import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/controller/trade_passport_controller.dart';
import 'package:trade_app/widgets/base_screen.dart';

class TradePassportScreen extends GetView<TradePassportController> {
  const TradePassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(
      children: [Text("Trade passport screen")],
    ));
  }
}
