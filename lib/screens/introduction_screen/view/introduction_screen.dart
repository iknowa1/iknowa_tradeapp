import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trade_app/screens/introduction_screen/controller/introduction_controller.dart';
import 'package:trade_app/utils/app_string.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../widgets/custom_animated_button.dart';

class IntroductionScreen extends GetView<IntroductionController> {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(
          () {
            return SafeArea(
              top: false,
              child: Stack(
                children: [
                  SizedBox(
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.pages.length,
                      itemBuilder: (_, index) {
                        return controller.pages[index % controller.pages.length];
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 370, // Adjust this value to position the text above the bottom container
                      left: 30, // Horizontal alignment
                      right: 20, // Horizontal alignment
                      child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            width: 32,
                            height: 10,
                            color: AppColors.backgroundYellow,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          dotDecoration: DotDecoration(
                            width: 10,
                            height: 10,
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            verticalOffset: 0,
                          ),
                          spacing: 6.0,
                        ),
                      )),
                  Positioned(
                    bottom: 343, // Adjust this value to position the text above the bottom container
                    left: 20, // Horizontal alignment
                    right: 20, // Horizontal alignment
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0), // Top left corner radius
                          topRight: Radius.circular(10.0), // Top right corner radius
                        ),
                      ),
                      width: double.maxFinite,
                      // alignment: Alignment.center,
                      child: const SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 343,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0), // Top left corner radius
                          topRight: Radius.circular(15.0), // Top right corner radius
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: controller.titlesYellow[controller.currentPage.value],
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to desired route
                                      },
                                    style: AppFonts.medium(25, AppColors.backgroundYellow),
                                  ),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: AppString.orDownloadIknowa,
                                    style: AppFonts.regular(25, AppColors.textBlack),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            controller.descriptions[controller.currentPage.value],
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: AppColors.textDarkGray, fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          CustomAnimatedButton(
                            text: AppString.continues,
                            onPressed: () {
                              Get.offAllNamed(Routes.login);
                            },
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppString.orDownloadIknowa,
                                    style: AppFonts.regular(15, AppColors.textBlack),
                                  ),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: AppString.propertyApp,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to desired route
                                      },
                                    style: AppFonts.medium(15, AppColors.backgroundYellow),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
