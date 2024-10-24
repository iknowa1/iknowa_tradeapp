import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_app/utils/app_fonts.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_diamentions.dart';
import '../../../../../../../utils/imagepath.dart';
import '../../../../../../../widgets/DashLineView.dart';

class EditServiceComponent extends StatelessWidget {
  final bool? isExpert;
  final int? selected;
  final TextEditingController? controller;
  final List<String>? expertList, memberList;
  final Widget child;
  const EditServiceComponent({super.key, this.isExpert, this.selected, this.controller, this.expertList, this.memberList, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColors.backgroundWhite, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.backgroundDarkGray.withOpacity(0.10), width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isExpert == true ? "Expertise" : "Members",
                style: AppFonts.bold(14, AppColors.backgroundDarkGray),
              ),
              Text(
                "Selected $selected",
                style: AppFonts.regular(14, AppColors.backgroundDarkGray),
              ),
            ],
          ),
          SizedBox(
            height: Dimen.margin12,
          ),
          const DashLineView(
            fillRate: 0.8,
            dashColor: AppColors.dashLineColor,
          ),
          SizedBox(
            height: Dimen.margin12,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 12.0, bottom: 15.0),
                  child: SvgPicture.asset(
                    ImagePath.dropdown,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                fillColor: AppColors.backgroundBlue,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.10), width: 2)),
                hintText: "Search ${isExpert == true ? "Expertise" : "Members"}",
                hintStyle: AppFonts.regular(16, AppColors.backgroundDarkGray)),
          ),
          SizedBox(
            height: Dimen.margin8,
          ),
          child,
        ],
      ),
    );
  }
}
