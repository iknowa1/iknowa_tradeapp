import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:trade_app/screens/forgot_password_email_link_screen/controller/forgot_password_email_link_controller.dart';
import 'package:trade_app/utils/app_string.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/custom_animated_button.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CustomAppBar(
        titleText: "Dashboard",
      ),
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.white, AppColors.gradientGrayBottomColor], begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [0.3, 0.6]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
