import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/email_registration_screen/controller/email_registration_controller.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/base_text_form_field.dart';
import '../../../../widgets/custom_animated_button.dart';

class EmailRegistrationScreen extends GetView<EmailRegistrationController> {
  const EmailRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.gradientGrayBottomColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                      "Get set up in less than 2 minutes",
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
                      "Let’s get you started.",
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please enter your email address to create your account.",
                    style: AppFonts.regular(15, AppColors.textDarkGray),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: Dimen.margin24),
                    child: BaseTextFormField(
                      headerText: "Email address",
                      controller: controller.emailController,
                      hintText: "Enter Email Address",
                      keyboardType: TextInputType.emailAddress,
                      maxLine: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomAnimatedButton(
                    text: "Continue",
                    onPressed: () {
                      if (controller.loginValidation()) {
                        Get.toNamed(Routes.passwordRegistration, parameters: {'email': controller.emailController.text});
                        // LoginModel response = await controller.authLoginUser();
                        // if (response.user?.id != null) {
                        //   await AppPreference.instance.setString(AppString.prefKeyUserLoginData, json.encode(response.toJson()));
                        //   CustomToastification().showToast("Login success", type: ToastificationType.success);
                        //   Get.toNamed(Routes.setbiometricPascode);
                        // }
                      }
                    },
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 16),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: AppFonts.regular(15, AppColors.textBlack),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
