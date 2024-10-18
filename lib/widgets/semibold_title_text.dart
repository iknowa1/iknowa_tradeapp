import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class SemiboldTitleText extends StatelessWidget {
  const SemiboldTitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.bold(20, AppColors.textDarkGray),
    );
  }
}
