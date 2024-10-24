import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/controller/profile_controller.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/view/profil_option_widget.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';
import 'package:trade_app/widgets/appbar.dart';
import 'package:trade_app/widgets/base_screen.dart';

import '../../../../utils/imagepath.dart';
import '../../../../widgets/custom_home_appbar.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.backgroundLightBlue,
        child: Column(
          children: [
            CustomHomeAppBar(title: "Profile", onTap: () {}),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 130,
                        child: Obx(() {
                          return Row(
                            children: [
                              const SizedBox(width: 20),
                              ClipOval(
                                child: controller.profilUrl.value.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: controller.profilUrl.value,
                                        width: 95,
                                        height: 95,
                                        fit: BoxFit.fill,
                                      )
                                    : SvgPicture.asset(
                                        ImagePath.profilePlaceholder,
                                        width: 95,
                                        height: 95,
                                        fit: BoxFit.fitWidth,
                                      ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Johndoe",
                                        style: AppFonts.semiBold(20, AppColors.textDarkGray),
                                        textAlign: TextAlign.left,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "My Account",
                                                recognizer: TapGestureRecognizer()..onTap = () {},
                                                style: const TextStyle(
                                                  color: AppColors.textBlue,
                                                  fontFamily: "Mulish",
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "4.3",
                                            style: AppFonts.semiBold(22, AppColors.textDarkGray),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "/5",
                                            style: AppFonts.semiBold(17, AppColors.textDarkGray),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          RatingBar.readOnly(
                                            size: 30,
                                            filledIcon: Icons.star_rounded,
                                            emptyIcon: Icons.star_rounded,
                                            initialRating: 3.5,
                                            filledColor: AppColors.backgroundYellow,
                                            emptyColor: AppColors.backgroundDarkGray.withOpacity(0.24),
                                            maxRating: 5,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 600,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.items.length,
                          itemBuilder: (context, index) {
                            return ProfileOptionItem(
                              item: controller.items[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class NotificationBellWidget extends StatelessWidget {
  final int notificationCount; // Parameter for notification count
  final VoidCallback onTap; // Callback for tap event

  const NotificationBellWidget({
    Key? key,
    this.notificationCount = 0, // Default value is 0
    required this.onTap, // Make the onTap parameter required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white, // Changed to default color for testing
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.black.withOpacity(0.1), // Changed to black for testing
          width: 2,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap:
          onTap;
        },
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/notification_bell.svg', // Make sure this path is correct
                width: 25,
                height: 25,
                fit: BoxFit.fitWidth,
              ),
            ),
            if (notificationCount > 0)
              Positioned(
                  left: 18,
                  top: 4,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundRed, // Changed to default color for testing
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: AppFonts.medium(10, AppColors.textWhite),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
