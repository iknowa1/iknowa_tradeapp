import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/mobile_otp_verification_screen/controller/mobile_otp_verification_controller.dart';
import 'package:trade_app/utils/app_string.dart';
import 'package:trade_app/widgets/appbar.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/OTPView/otp_field.dart';
import '../../../../widgets/OTPView/otp_field_style.dart';
import '../../../../widgets/OTPView/style.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/custom_animated_button.dart';

class MobileOtpVerificationScreen extends GetView<MobileOtpVerificationController> {
  const MobileOtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: CustomAppBar(),
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
                          AppString.verifyAccountWithOTP,
                          textAlign: TextAlign.left,
                          style: AppFonts.regular(25, AppColors.textBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          AppString.wevesent4DigitCodeTo,
                          style: AppFonts.regular(15, AppColors.textDarkGray),
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
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppString.didntGetCode,
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(fontSize: 13, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
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
                                text: AppString.requestNewCodeIn + " 45s",
                                recognizer: TapGestureRecognizer()..onTap = () {},
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
                CustomAnimatedButton(
                  text: AppString.continues,
                  onPressed: () {
                    Get.toNamed(Routes.emailVerificationSuccess);
                  },
                ),
                // const SizedBox(height: 20),
                // Container(
                //   alignment: Alignment.center,
                //   margin: const EdgeInsets.only(top: 16),
                //   child: Text.rich(
                //     TextSpan(
                //       children: [
                //         TextSpan(
                //           text: "Already have an account?",
                //           style: AppFonts.regular(15, AppColors.textBlack),
                //         ),
                //         const TextSpan(text: " "),
                //         TextSpan(
                //           text: "Login",
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               // Navigator.pushNamed(context, AppRoutes.);
                //             },
                //           style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                //         ),
                //       ],
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
