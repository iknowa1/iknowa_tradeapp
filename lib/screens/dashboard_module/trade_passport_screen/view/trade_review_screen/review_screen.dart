import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/model/review_model.dart';
import 'package:trade_app/utils/app_fonts.dart';
import 'package:trade_app/utils/imagepath.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../widgets/DashLineView.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewModel>? reviewList;

  const ReviewScreen({super.key, this.reviewList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColors.backgroundWhite, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.textDarkGray.withOpacity(0.1), width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OverAll Rating",
                    style: AppFonts.bold(16, AppColors.backgroundDarkGray),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DashLineView(
                    fillRate: 0.8,
                    dashColor: AppColors.dashLineColor,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "4.3",
                        style: AppFonts.bold(57, AppColors.backgroundDarkGray),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "/5",
                        style: AppFonts.bold(19, AppColors.backgroundDarkGray),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                  RatingBar.readOnly(
                      filledIcon: Icons.star_rounded,
                      emptyIcon: Icons.star_rounded,
                      initialRating: 4.3,
                      maxRating: 5,
                      size: 28,
                      filledColor: AppColors.backgroundYellow,
                      emptyColor: AppColors.backgroundDarkGray.withOpacity(0.24)),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Project Reviews",
              style: AppFonts.bold(16, AppColors.backgroundDarkGray),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(14),
                    margin: index == 0
                        ? EdgeInsets.zero
                        : (reviewList?.length ?? 0) - 1 == index
                            ? EdgeInsets.only(bottom: 16)
                            : EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(color: AppColors.backgroundWhite, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.textDarkGray.withOpacity(0.1), width: 1)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                reviewList?[index].image ?? "",
                                width: 85,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    reviewList?[index].name ?? "",
                                    style: AppFonts.regular(18, AppColors.backgroundDarkGray),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            reviewList?[index].rate.toString() ?? "",
                                            style: AppFonts.bold(18, AppColors.backgroundDarkGray),
                                            textAlign: TextAlign.end,
                                          ),
                                          Text(
                                            "/5",
                                            style: AppFonts.bold(13, AppColors.backgroundDarkGray),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      RatingBar.readOnly(
                                          filledIcon: Icons.star_rounded,
                                          emptyIcon: Icons.star_rounded,
                                          initialRating: reviewList?[index].rate ?? 0.0,
                                          maxRating: 5,
                                          size: 28,
                                          filledColor: AppColors.backgroundYellow,
                                          emptyColor: AppColors.backgroundDarkGray.withOpacity(0.24)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        const DashLineView(
                          fillRate: 0.8,
                          dashColor: AppColors.dashLineColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  ImagePath.locationBlack,
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  reviewList?[index].location ?? "",
                                  style: AppFonts.medium(16, AppColors.backgroundDarkGray),
                                )
                              ],
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "View Details",
                                    style: AppFonts.bold(16, AppColors.gradientTopColor).copyWith(decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () {}))
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: reviewList?.length ?? 0,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
