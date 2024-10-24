import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/imagepath.dart';

class EmptyGridCard extends StatelessWidget {
  final String? title;
  final String? addText;
  final String? imgIcon;
  final void Function()? onAddTextPress;
  const EmptyGridCard({super.key, this.title, this.addText, this.onAddTextPress, this.imgIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        SvgPicture.asset(
          imgIcon ?? ImagePath.slider2,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        const SizedBox(height: 25),
        Text(
          title ?? "",
          style: AppFonts.regular(16, AppColors.textDarkGray),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        GestureDetector(
            onTap: onAddTextPress,
            child: Text(addText ?? "", style: AppFonts.bold(16, AppColors.textBlue).copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.textBlue), textAlign: TextAlign.center)),
        const SizedBox(height: 16),
      ],
    );
  }
}
