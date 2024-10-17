import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/add_phone_number_screen/controller/add_phone_number_controller.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/base_text_form_field.dart';
import '../../../../widgets/custom_animated_button.dart';

class AddPhoneNumberView extends GetView<AddPhoneNumberController> {
  const AddPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CustomAppBar(),
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
                        "Add Your \nPhone Number",
                        textAlign: TextAlign.left,
                        style: AppFonts.regular(30, AppColors.textBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Be the first to receive special offers & benefits from iknowa",
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Phone Number",
                        textAlign: TextAlign.left,
                        style: AppFonts.medium(15.0, AppColors.textBlack),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 50,
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: Dimen.margin2, color: AppColors.colorInputGrayBorder),
                              borderRadius: BorderRadius.circular(Dimen.cardRadius8),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                          child: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  controller.countryCode.value = "+" + country.phoneCode;
                                  print('Select country: ${country.displayName}');
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Spacer(),
                                Obx(() {
                                  return SizedBox(
                                    child: Text(
                                      controller.countryCode.value,
                                      style: AppFonts.medium(16.0, AppColors.textBlack),
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  ImagePath.dropdown,
                                  width: 12,
                                ),
                                const Spacer(),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: Dimen.margin24),
                            child: const BaseTextFormField(
                              headerText: "",
                              // controller: controller.emailController,
                              hintText: "Enter Phone",
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              maxLine: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomAnimatedButton(
                      text: "Complete Onboarding",
                      onPressed: () {
                        Get.toNamed(Routes.addProfilePictureRegistration);
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
