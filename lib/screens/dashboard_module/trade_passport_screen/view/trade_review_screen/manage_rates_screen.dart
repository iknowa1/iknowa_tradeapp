import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/imagepath.dart';
import '../../../../../widgets/HeaderTextField.dart';
import '../../../../../widgets/base_text_form_field.dart';
import '../../../../../widgets/custom_animated_button.dart';

class ManageRatesScreen extends StatelessWidget {
  const ManageRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLightBlue,
        appBar: AppBar(
          backgroundColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.letsConformYourInsurances, style: AppFonts.bold(24, AppColors.textDarkGray)),
                      SizedBox(height: 10),
                      Text(AppString.inOrderToRegisterYurSelfAsASoloTrade, style: AppFonts.regular(14, AppColors.textDarkGray)),
                      SizedBox(height: 26),
                      Form(
                        child: Column(
                          children: [
                            HeaderTextFormField(
                              headerText: AppString.hourlyRate,
                              hintText: AppString.demoRate,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              headerText: AppString.dateRate,
                              hintText: AppString.demoRate,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              isHeaderSuffixItem: true,
                              headerSuffixIcon: ImagePath.infoImage,
                              height: 44,
                              headerText: AppString.emergencyCallOutFee,
                              hintText: AppString.demoRate,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                              // prefixIcon: ImagePath.calender,
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              headerText: AppString.emergencyCallOutRatePerHour,
                              hintText: AppString.demoRate,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              isHeaderSuffixItem: true,
                              headerSuffixIcon: ImagePath.infoImage,
                              height: 44,
                              headerText: AppString.videoConsultationFeePerHour,
                              hintText: AppString.demoRate,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomAnimatedButton(
                onPressed: () {},
                text: AppString.save,
                height: 45,
              ),
            ],
          ),
        ));
  }
}
