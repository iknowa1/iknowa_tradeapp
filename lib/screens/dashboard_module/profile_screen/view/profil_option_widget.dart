import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/model/profile_option_model.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';

import '../../../../utils/imagepath.dart';

class ProfileOptionItem extends StatelessWidget {
  final ProfileOptionModel item;

  const ProfileOptionItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                item.svgIconPath,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 15),
              Text(
                item.title,
                style: AppFonts.semiBold(17, AppColors.textDarkGray),
              ),
            ],
          ),
          SvgPicture.asset(
            ImagePath.profileRightArrow,
            width: 8,
            fit: BoxFit.fitWidth,
          )
          // Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    );
  }
}
