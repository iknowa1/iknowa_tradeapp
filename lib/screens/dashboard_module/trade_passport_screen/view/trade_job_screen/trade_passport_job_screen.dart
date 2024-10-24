import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';
import '../../../../../utils/imagepath.dart';
import '../../../../../widgets/DashLineView.dart';
import '../../../../../widgets/readmore.dart';

class TradePassportJobScreen extends StatelessWidget {
  const TradePassportJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 17),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: InsuranceCard()),
          ],
        ),
      ),
    );
  }
}

class InsuranceCard extends StatelessWidget {
  const InsuranceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 13,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.1), // Changed to black for testing
            width: 2,
          ),
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.backgroundGreen, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.pendingInsurance,
                      ),
                      const SizedBox(width: 5),
                      Text("Completed", style: AppFonts.bold(13, AppColors.textWhite)
                          // TextStyle(
                          //     color: AppColors.textWhite),
                          )
                    ],
                  ),
                ),
                Text("26/07/2024", style: AppFonts.bold(12, AppColors.textDarkGray)),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            const DashLineView(
              dashWith: 5,
              dashHeight: 0.5,
              fillRate: 0.8,
              dashColor: AppColors.dashLineColor,
            ),
            const SizedBox(height: 12),
            Text("Air Source Heat Pump Installation", style: AppFonts.regular(17, AppColors.textDarkGray)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(color: AppColors.backgroundRed, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.expired,
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Expired",
                        style: AppFonts.bold(12, AppColors.textWhite),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.colorTransparent,
                    borderRadius: BorderRadius.circular(8), //
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.commericial,
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Commercial",
                        style: AppFonts.bold(13, AppColors.textLightBlue),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ReadMoreText(
              'Lorem Ipsum is simply dummy text of the printing and type setting.Lorem Ipsum is sim Lorem Ipsum is simply dummy text of the printing and type setting.Lorem Ipsum',
              trimMode: TrimMode.Line,
              trimLines: 2,
              style: AppFonts.regular(15, AppColors.textDarkGray),
              colorClickableText: Colors.pink,
              trimCollapsedText: ' Read More',
              trimExpandedText: ' Show less',
              lessStyle: AppFonts.bold(15, AppColors.textBlue).copyWith(decoration: TextDecoration.underline),
              moreStyle: AppFonts.bold(15, AppColors.textBlue).copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
