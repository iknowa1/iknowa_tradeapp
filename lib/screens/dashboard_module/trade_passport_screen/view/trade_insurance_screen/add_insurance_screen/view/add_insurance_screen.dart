import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_insurance_screen/add_insurance_screen/controller/add_insurance_controller.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../utils/app_string.dart';
import '../../../../../../../utils/imagepath.dart';
import '../../../../../../../widgets/HeaderTextField.dart';
import '../../../../../../../widgets/appbar.dart';
import '../../../../../../../widgets/base_screen.dart';
import '../../../../../../../widgets/custom_animated_button.dart';

class AddInsuranceScreen extends GetView<AddInsuranceController> {
  const AddInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: AppColors.backgroundLightBlue,
        appBar: const CustomAppBar(
          centerTitle: true,
          elevation: 2,
          titleText: "Add Insurance",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                              headerText: AppString.insuranceType,
                              hintText: AppString.egPlumbingHeating,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                              suffixIcon: ImagePath.addInsuranceDownArrow,
                              suffixIconColor: AppColors.backgroundDarkGray,
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              headerText: AppString.coverageHeader,
                              hintText: AppString.coveragePlaceHolder,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              readOnly: true,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));

                                if (picked != null) {
                                  print(DateFormat('dd/MM/yyyy').format(picked));
                                }
                              },

                              height: 44,
                              headerText: AppString.expiryDate,
                              hintText: "10/03/2024",
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                              // prefixIcon: ImagePath.calender,
                              suffixIcon: ImagePath.addInsuranceCalendar,
                              suffixIconColor: AppColors.backgroundDarkGray,
                            ),
                            SizedBox(height: 16),
                            HeaderTextFormField(
                              onTap: () async {
                                print("thinksmcnk");

                                // FilePickerResult? result = await FilePicker.platform.pickFiles(
                                //   // allowMultiple: true,
                                //   type: FileType.custom,
                                //   allowedExtensions: ['pdf'],
                                // );
                                //
                                //
                                // if (result != null) {
                                //   File file = File(result.files.single.path!);
                                // } else {
                                //   // User canceled the picker
                                // }
                              },
                              readOnly: true,
                              height: 44,
                              headerText: AppString.document,
                              hintText: AppString.upload,
                              isRequired: true,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                              starColor: AppColors.textDarkGray,
                              prefixIcon: ImagePath.addInsuranceUpload,
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
                text: AppString.addInsurance,
                height: 45,
              ),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}
