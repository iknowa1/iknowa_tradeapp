import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/imagepath.dart';
import 'custom_animated_button.dart';

class EmptyScreen extends StatelessWidget {
  final String? title;
  final String? description;
  final String? emptyImage;
  final String? btnName;
  final void Function()? onBtnPress;

  const EmptyScreen({super.key, this.title, this.description, this.emptyImage, this.btnName, this.onBtnPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            emptyImage ?? ImagePath.slider2,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(height: 10),
          Text(
            title ?? " ",
            style: AppFonts.bold(24, AppColors.textDarkGray),
          ),
          const SizedBox(height: 15),
          Text(
            description ?? "",
            style: AppFonts.regular(16, AppColors.textDarkGray.withOpacity(0.6)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAnimatedButton(
              onPressed: onBtnPress,
              text: btnName ?? "",
              height: 45,
            ),
          ),
        ],
      ),
    );
  }
}
