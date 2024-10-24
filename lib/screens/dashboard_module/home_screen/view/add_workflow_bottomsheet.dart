import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';
import 'package:trade_app/widgets/custom_animated_button.dart';

import '../../../../utils/app_diamentions.dart';
import '../../../../utils/imagepath.dart';

class AddWorkflowBottomsheet extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String buttonTitle;
  final VoidCallback onTap;
  final bool showCancelBtn;

  AddWorkflowBottomsheet({Key? key, required this.imageUrl, required this.title, required this.description, required this.buttonTitle, required this.onTap, this.showCancelBtn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.margin20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 5,
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppColors.textDarkGray.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8), //
            ),
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImagePath.bottomSheetClose,
                  width: 35,
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
          SvgPicture.asset(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppFonts.bold(24, AppColors.textDarkGray),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppFonts.regular(15, AppColors.textDarkGray),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomAnimatedButton(
            text: buttonTitle,
            height: 45,
          ),
          const SizedBox(
            height: 16,
          ),
          if (showCancelBtn) ...[
            CustomAnimatedButton(
              onPressed: () {},
              disabledColor: AppColors.backgroundWhite,
              enabledColor: AppColors.backgroundWhite,
              text: "Cancel",
              height: 45,
            ),
            const SizedBox(
              height: 20,
            ),
          ]
        ],
      ),
    );
  }
}
