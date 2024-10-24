import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/chat_screen/view/chat_screen.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/view/home_screen.dart';
import 'package:trade_app/screens/dashboard_module/jobs_screen/view/jobs_screen.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/view/profile_screen.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_passport_screen.dart';
import 'package:trade_app/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:trade_app/screens/dashboard_screen/view/tabbar_item.dart';
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
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        bottom: false,
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                switch (controller.currentIndex.value) {
                  case 0:
                    return HomeScreen(); // Your Home Screen widget
                  case 1:
                    return TradePassportScreen(); // Your Search Screen widget
                  case 2:
                    return JobsScreen(); // Your Notifications Screen widget
                  case 3:
                    return ChatScreen(); // Your Messages Screen widget
                  case 4:
                    return ProfileScreen(); // Your Profile Screen widget
                  default:
                    return HomeScreen(); // Default case
                }
              }),
            ),
            Container(
              color: const Color.fromRGBO(12, 15, 74, 1),
              height: 90 + MediaQuery.of(context).padding.bottom,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                child: Obx(() {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.bottomBarModelList
                          .map((e) => GestureDetector(
                                onTap: () => controller.onItemTapped(controller.bottomBarModelList.indexOf(e)),
                                child: TabbarItem(menuItem: e, isSelected: e.index == controller.currentIndex.value),
                              ))
                          .toList());
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
