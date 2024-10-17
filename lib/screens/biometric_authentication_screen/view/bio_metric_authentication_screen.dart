import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:trade_app/utils/app_string.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/base_text_form_field.dart';
import '../../../../widgets/custom_animated_button.dart';
import '../../../widgets/OTPView/otp_field.dart';
import '../../../widgets/OTPView/otp_field_style.dart';
import '../../../widgets/OTPView/style.dart';
import '../controller/bio_metric_authentication_controller.dart';

class BioMetricAuthenticationScreen extends GetView<BioMetricAuthenticationController> {
  const BioMetricAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      resizeToAvoidBottomInset: false,
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
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImagePath.iknowaBlueLogo,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  AppString.enterIknowaPIN,
                  style: AppFonts.regular(17, AppColors.textDarkGray),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 46,
                    width: 284,
                    child: IgnorePointer(
                      child: OTPTextField(
                        keyboardType: TextInputType.none,
                        spaceBetween: 10,
                        width: MediaQuery.of(context).size.width,
                        length: 4,
                        isReadOnly: true,
                        fieldWidth: 60,
                        obscureText: true,
                        contentPadding: EdgeInsets.zero,
                        otpFieldStyle: OtpFieldStyle(
                          backgroundColor: AppColors.white,
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
                          if (code.length == 4) {
                            if (code == controller.savedPasscode.value) {
                              Get.toNamed(Routes.dashboard);
                            } else {
                              Dialogs.materialDialog(msg: 'Wrong passcode', title: "Alert", color: Colors.white, context: context, actions: [
                                IconsOutlineButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'Cancel',
                                  // iconData: Icons.cancel_outlined,
                                  textStyle: TextStyle(color: Colors.grey),
                                  iconColor: Colors.grey,
                                ),
                                IconsOutlineButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.otpValue.value = "";
                                    controller.otpFieldController.clear();
                                    // AppPreference.instance.setString(AppString.bioMetricPasscode, code);
                                    // Get.back();
                                    // Get.toNamed(Routes.dashboard);
                                  },
                                  text: 'Try again!',
                                  // iconData: Icons.cancel_outlined,
                                  textStyle: TextStyle(color: Colors.grey),
                                  iconColor: Colors.grey,
                                ),
                              ]);
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
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
                          text: "Forgot Password?",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, AppRoutes.);
                            },
                          style: const TextStyle(
                            color: AppColors.textDarkGray,
                            fontFamily: "Mulish",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("1");
                              // controller.otpValue.value += "1";
                              // controller.otpFieldController.setValue("1", controller.otpValue.value.length - 1);
                            },
                            number: "1",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("2");
                              // controller.otpValue.value += "2";
                              // controller.otpFieldController.setValue("2", controller.otpValue.value.length - 1);
                            },
                            number: "2",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("3");
                              // controller.otpValue.value += "3";
                              // controller.otpFieldController.setValue("3", controller.otpValue.value.length - 1);
                            },
                            number: "3",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("4");
                            },
                            number: "4",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("5");
                            },
                            number: "5",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("6");
                            },
                            number: "6",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("7");
                            },
                            number: "7",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("8");
                            },
                            number: "8",
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("9");
                            },
                            number: "9",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageButton(
                            onTap: () {
                              controller.bioMetricAuth();
                            },
                            child: SvgPicture.asset(
                              ImagePath.biometricFace,
                              width: 40.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          CustomNumberButton(
                            onTap: () {
                              controller.addPin("0");
                            },
                            number: "0",
                          ),
                          CustomImageButton(
                            onTap: () {
                              controller.removeLastValue();
                            },
                            child: SvgPicture.asset(
                              ImagePath.biometricBack,
                              width: 30.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onTap;

  const CustomNumberButton({
    Key? key,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.0, // Width of the circle
        height: 60.0, // Height of the circle (must be equal to width)
        decoration: BoxDecoration(
          color: AppColors.backgroundDarkGray.withOpacity(0.2), // Background color
          shape: BoxShape.circle, // Circle shape
        ),
        child: Center(
            child: Text(
          number,
          style: AppFonts.semiBold(22, AppColors.textDarkGray),
        )), // Center the text
      ),
    );
  }
}

class CustomImageButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const CustomImageButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.0, // Width of the circle
        height: 70.0, // Height of the circle (must be equal to width)
        decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.2), // Background color
          shape: BoxShape.circle, // Circle shape
        ),
        child: Center(child: child), // Center the text
      ),
    );
  }
}
