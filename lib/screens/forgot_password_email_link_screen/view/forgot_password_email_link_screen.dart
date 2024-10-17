import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/forgot_password_email_link_screen/controller/forgot_password_email_link_controller.dart';
import 'package:trade_app/utils/app_string.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/validation_string.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/custom_animated_button.dart';
import '../../../widgets/custom_toastification.dart';

class ForgotPasswordEmailLinkScreen extends GetView<ForgotPasswordEmailLinkController> {
  const ForgotPasswordEmailLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CustomAppBar(),
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
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        AppString.forgotPassword,
                        textAlign: TextAlign.left,
                        style: AppFonts.regular(30, AppColors.textBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppString.ifTheEmailAddressHasAnAccountSentWithLinkToResetYourPassword,
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 16),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppString.emailSentTo,
                              style: AppFonts.regular(15, AppColors.textBlack),
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: controller.email.value,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: const TextStyle(fontSize: 15, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        AppString.didnReceiveEmailRequestResendBelow,
                        textAlign: TextAlign.left,
                        style: AppFonts.regular(15, AppColors.textDarkGray),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() {
                      return CustomAnimatedButton(
                        isLoading: controller.isLoading.value,
                        text: AppString.reSendEmail,
                        onPressed: () async {
                          dynamic response = await controller.authEmailVerify();
                          if (response != null) {
                            CustomToastification().showToast(ValidationString.validationResendMailSuccessfully, type: ToastificationType.success);
                          }
                        },
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 16),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Back to Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.close(2);
                                },
                              style: const TextStyle(
                                color: AppColors.textYellow,
                                fontFamily: "Mulish",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
