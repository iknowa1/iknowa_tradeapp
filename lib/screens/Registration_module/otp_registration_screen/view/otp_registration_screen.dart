import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/controller/otp_registration_controller.dart';
import '../../../../core/common/app_preferences.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/validation_string.dart';
import '../../../../widgets/OTPView/otp_field.dart';
import '../../../../widgets/OTPView/otp_field_style.dart';
import '../../../../widgets/OTPView/style.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/custom_animated_button.dart';
import '../../../../widgets/custom_toastification.dart';
import '../../../login_screen/model/login_model.dart';
import '../model/email_verificartion_model.dart';

class OtpRegistrationScreen extends GetView<OtpRegistrationController> {
  const OtpRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.white, AppColors.gradientGrayBottomColor], begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [0.0, 0.7]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Time to check your emails. Please enter the code we have just sent to you.",
                          textAlign: TextAlign.left,
                          style: AppFonts.regular(25, AppColors.textBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Iknowa has just sent a code validation email to",
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          controller.email,
                          style: AppFonts.bold(15, AppColors.textDarkGray),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: 46,
                          width: 284,
                          child: OTPTextField(
                            spaceBetween: 10,
                            width: MediaQuery.of(context).size.width,
                            length: 4,
                            fieldWidth: 60,
                            contentPadding: EdgeInsets.zero,
                            otpFieldStyle: OtpFieldStyle(
                              backgroundColor: AppColors.colorInputBackground,
                              focusBorderColor: AppColors.colorInputBorder,
                              enabledBorderColor: AppColors.colorInputBorder,
                              borderColor: AppColors.colorInputBorder,
                            ),
                            style: AppFonts.bold(17.0, AppColors.textBlack),
                            outlineBorderRadius: 8,
                            fieldStyle: FieldStyle.box,
                            controller: controller.otpFieldController,
                            onCompleted: (String code) {
                              controller.otpValue = RxString(code);
                            },
                            onChanged: (code) {
                              controller.otpValue = RxString(code);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Resend Email",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    dynamic response = await controller.resendEmailOTP();
                                    if (response != null) {
                                      CustomToastification().showToast(ValidationString.validationResendMailSuccessfully, type: ToastificationType.success);
                                    }
                                  },
                                style: const TextStyle(fontSize: 13, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )),
                Obx(() {
                  return CustomAnimatedButton(
                    isLoading: controller.isLoading.value,
                    text: "Verify Email & Continue",
                    onPressed: () async {
                      if (controller.validation()) {
                        EmailVerifyModel response = await controller.authEmailVerify();
                        if (response.id != null) {
                          Future.delayed(Duration(milliseconds: 100), () async {
                            LoginModel loginResponse = await controller.authLoginUser(response.email ?? "");

                            if (loginResponse.user?.id != null) {
                              print("Login response is ${loginResponse.toJson()}");

                              await AppPreference.instance.setString(AppString.prefKeyUserLoginData, json.encode(loginResponse.toJson()));

                              Get.toNamed(Routes.emailVerificationSuccess, parameters: {'userId': controller.userId, 'isFromLogin': controller.isFromLogin.toString()});
                            }
                            // Do something
                          });
                        }
                      }
                      // Get.toNamed(Routes.emailVerificationSuccess);
                    },
                  );
                }),
                const SizedBox(height: 20),
                Container(
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, AppRoutes.);
                            },
                          style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
