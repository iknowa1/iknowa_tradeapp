import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/model/profile_option_model.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';

import '../../../../utils/imagepath.dart';
import '../screens/dashboard_module/profile_screen/view/profile_screen.dart';

class CustomHomeAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomHomeAppBar({required this.title, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: AppColors.backgroundDarkGray.withOpacity(0.2),
      color: AppColors.backgroundWhite,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // decoration: BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: AppColors.backgroundDarkGray.withOpacity(0.1), blurRadius: 15.0, offset: Offset(0.0, 0.75))], color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 0),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: AppFonts.semiBold(20, AppColors.textDarkGray),
                )
              ],
            ),
            Spacer(),
            Align(
              child: NotificationBellWidget(
                notificationCount: 2,
                onTap: () {
                  onTap;
                },
              ),
            )
            // Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
