import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_diamentions.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../utils/imagepath.dart';

class AddServiceList extends StatelessWidget {
  final String? image;
  final String? name;
  final String? type;
  final TextEditingController? controller;
  const AddServiceList({super.key, this.image, this.name, this.type, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 14, bottom: 20, left: 14),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: AppColors.backgroundWhite, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.backgroundDarkGray.withOpacity(0.10), width: 2)),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        horizontalTitleGap: 2,
        child: ExpansionTile(
          shape: Border(),
          visualDensity: VisualDensity(horizontal: -0.4, vertical: -0.4),
          title: Row(
            children: [
              SizedBox(
                width: 46,
                height: 46,
                child: CircleAvatar(
                  backgroundColor: AppColors.textDarkGray,
                  child: SvgPicture.asset(
                    image ?? "",
                    width: 23,
                    height: 23,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: Dimen.margin8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "",
                      style: AppFonts.bold(18, AppColors.backgroundDarkGray),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      type ?? "",
                      style: AppFonts.semiBold(14, AppColors.backgroundDarkGray),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ),
              )
            ],
          ),
          trailing: SvgPicture.asset(
            ImagePath.addInsuranceDownArrow,
            fit: BoxFit.cover,
          ),
          leading: Checkbox(
            value: false,
            onChanged: (value) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity(vertical: -0.4, horizontal: -0.4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.50), width: 2)),
          ),
          children: [
            Column(
              children: [
                SizedBox(
                  height: Dimen.margin16,
                ),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      filled: true,
                      fillColor: AppColors.backgroundBlue,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.10), width: 2)),
                      hintText: "Enter sub-category",
                      hintStyle: AppFonts.regular(16, AppColors.backgroundDarkGray)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
