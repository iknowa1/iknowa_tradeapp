import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/login_option_screen/controller/login_option_controller.dart';
import 'package:trade_app/utils/app_string.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/imagepath.dart';
import '../../../widgets/custom_outline_button.dart';

class LoginOptionScreen extends GetView<LoginOptionController> {
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.textDarkGray, AppColors.white],
          begin: Alignment.topCenter,
          stops: [0.4, 0.7],
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      ImagePath.iknowalogo,
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0), // Top left corner radius
                      topRight: Radius.circular(10.0), // Top right corner radius
                    ),
                  ),
                  width: double.maxFinite,
                  // alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            AppString.joinIknowa,
                            textAlign: TextAlign.left,
                            style: AppFonts.regular(30, AppColors.textBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppString.itIsLongEstablishedFactThatReaderWillBeSistractedTheReadableContentPageWhenLookingItsLayout,
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomOutlineAnimatedButton(
                          isOutline: true,
                          imageAssest: ImagePath.google,
                          enabledTextColor: AppColors.textBlack,
                          outlineColor: AppColors.colorInputLightGrayBorder,
                          text: AppString.signInWithGoogle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlineAnimatedButton(
                          isOutline: true,
                          enabledTextColor: AppColors.textBlack,
                          outlineColor: AppColors.colorInputLightGrayBorder,
                          text: AppString.continueWithEmail,
                          onPressed: () {
                            Get.toNamed(Routes.emailRegistration);
                          },
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 16),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppString.byContinuingYouAgreeToOut,
                                  style: AppFonts.regular(15, AppColors.textBlack),
                                ),
                                const TextSpan(text: " "),
                                TextSpan(
                                  text: AppString.termsOfService,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.pushNamed(context, AppRoutes.);
                                    },
                                  style: const TextStyle(fontSize: 15, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 5),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppString.and,
                                  style: AppFonts.regular(15, AppColors.textBlack),
                                ),
                                const TextSpan(text: " "),
                                TextSpan(
                                  text: AppString.privacyPolicy,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.pushNamed(context, AppRoutes.);
                                    },
                                  style: const TextStyle(fontSize: 15, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 16),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppString.dontHaveAnAccount,
                            style: AppFonts.regular(15, AppColors.textBlack),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: AppString.register,
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
