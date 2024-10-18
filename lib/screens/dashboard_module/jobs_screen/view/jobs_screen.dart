import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/chat_screen/controller/chat_controller.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/controller/home_controller.dart';
import 'package:trade_app/screens/dashboard_module/jobs_screen/controller/jobs_controller.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';
import 'package:trade_app/widgets/base_screen.dart';

class JobsScreen extends GetView<JobsController> {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(
      children: [Text("Job screen")],
    ));
  }
}
