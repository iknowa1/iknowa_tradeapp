import 'package:flutter/material.dart';
import 'package:trade_app/widgets/base_screen.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../utils/app_string.dart';
import '../../../../../../../utils/imagepath.dart';
import '../../../../../../../widgets/HeaderTextField.dart';
import '../../../../../../../widgets/appbar.dart';
import '../../../../../../../widgets/custom_animated_button.dart';

class AddCertificateScreen extends StatelessWidget {
  const AddCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: AppColors.backgroundLightBlue,
        appBar: const CustomAppBar(
          centerTitle: true,
          elevation: 2,
          titleText: "Add Certification",
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
                      Text(AppString.doYouHaveAnyCertifications, style: AppFonts.bold(24, AppColors.textDarkGray)),
                      const SizedBox(height: 10),
                      Text(AppString.pleaseEnterYourQualificationDetails, style: AppFonts.regular(14, AppColors.textDarkGray)),
                      const SizedBox(height: 10),
                      Text(AppString.placeNoteWeWillRequireProofBefore, style: AppFonts.regular(14, AppColors.textDarkGray.withOpacity(.6))),
                      const SizedBox(height: 26),
                      Form(
                        child: Column(
                          children: [
                            HeaderTextFormField(
                              headerText: AppString.title,
                              hintText: AppString.gasSafeRegister,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            const SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              isOptional: true,
                              headerText: AppString.membershipNumberOptional,
                              hintText: AppString.demoNumber,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            const SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              isOptional: true,
                              headerText: AppString.url,
                              hintText: AppString.demoUrl,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                              // prefixIcon: ImagePath.calender,
                            ),
                            const SizedBox(height: 16),
                            HeaderTextFormField(
                              height: 44,
                              headerText: AppString.evidence,
                              hintText: AppString.upload,
                              isRequired: true,
                              starColor: AppColors.textDarkGray,
                              prefixIcon: ImagePath.addInsuranceUpload,
                              hintStyle: AppFonts.semiBold(16, AppColors.textDarkGray.withOpacity(0.5)),
                              headerTextStyle: AppFonts.bold(16, AppColors.textDarkGray),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomAnimatedButton(
                onPressed: () {},
                text: AppString.save,
                height: 45,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
