import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/imagepath.dart';

class ExpertMemberServiceComponent extends StatelessWidget {
  final String? name, image;
  final bool? isExpert;
  const ExpertMemberServiceComponent({super.key, this.name, this.isExpert, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpert ?? true ? 34 : 38,
      padding: EdgeInsets.only(left: 9, right: 9),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.backgroundDarkGray.withOpacity(0.16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExpert ?? true) ...[
            SizedBox(
              width: 16,
              height: 16,
              child: CircleAvatar(
                  backgroundColor: AppColors.textYellow,
                  child: SvgPicture.asset(
                    ImagePath.serviceRight,
                    fit: BoxFit.cover,
                  )),
            ),
          ] else ...[
            SizedBox(
              width: 22,
              height: 22,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    image ?? "",
                    fit: BoxFit.cover,
                  )),
            ),
          ],
          SizedBox(
            width: 4,
          ),
          Text(
            name ?? "",
            style: AppFonts.bold(14, AppColors.textDarkGray),
          )
        ],
      ),
    );
  }
}
