import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/common/app_preferences.dart';
import 'package:trade_app/screens/Registration_module/email_verification_success_screen/controller/email_verification_success_controller.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/imagepath.dart';
import '../../../../widgets/custom_animated_button.dart';
import '../../../login_screen/view/login_screen.dart';

class EmailVerificationSuccessScreen extends GetView<EmailVerificationSuccessController> {
  const EmailVerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      // color: Colors.red,
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
                      // width: MediaQuery.of(context).size.width * 0.3,
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
                          height: 40,
                        ),
                        Center(
                          child: SvgPicture.asset(
                            ImagePath.emailverificationsuccess,
                            width: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Success!",
                            textAlign: TextAlign.left,
                            style: AppFonts.regular(30, AppColors.textBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Your email has been verified successfully. Please login.",
                            style: AppFonts.regular(15, AppColors.textDarkGray),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                child: CustomAnimatedButton(
                  text: "Continue",
                  onPressed: () {
                    if (controller.isFromLogin) {
                      AppPreference.instance.clearPreference();
                      Get.to(LoginScreen());
                    } else {
                      Get.toNamed(Routes.addProfilePictureRegistration, parameters: {
                        'userId': controller.userId,
                      });
                    }

                    // Get.toNamed(Routes.addPhoneNumberRegistration);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
