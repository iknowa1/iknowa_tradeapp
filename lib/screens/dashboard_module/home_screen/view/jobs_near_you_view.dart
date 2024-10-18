import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_app/utils/imagepath.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../widgets/see_all_text_view.dart';
import '../../../../widgets/semibold_title_text.dart';

class JobsNearYouView extends StatelessWidget {
  const JobsNearYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.margin20),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SemiboldTitleText(title: "Jobs Near On You"),
              Spacer(),
              SeeAllTextView(text: "View All", onTap: () {}),
              SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(height: Dimen.margin14),
          SizedBox(
            height: Dimen.margin217,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  // height: Dimen.margin207,
                  width: (MediaQuery.sizeOf(context).width * 0.8),
                  padding: const EdgeInsets.only(bottom: Dimen.margin2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1), // Changed to black for testing
                      width: 2,
                    ),
                    color: AppColors.backgroundWhite,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSlimLightBlue,
                                borderRadius: BorderRadius.circular(8), //
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.premiumMember,
                                    width: 25,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Premium Member",
                                    style: AppFonts.bold(13, AppColors.textYellow),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSlimLightBlue,
                                borderRadius: BorderRadius.circular(8), //
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "1",
                                    style: AppFonts.bold(13, AppColors.textDarkGray),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Mile Away",
                                    style: AppFonts.bold(13, AppColors.textMildAway),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Air Source Heat Pump Installation",
                            textAlign: TextAlign.left,
                            style: AppFonts.regular(20, AppColors.textDarkGray),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundRed,
                                borderRadius: BorderRadius.circular(8), //
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.emergency,
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Emergency",
                                    style: AppFonts.bold(13, AppColors.textWhite),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Commercial",
                                    style: AppFonts.bold(13, AppColors.textLightBlue),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem orem Ipsum is simply dummy text of the printing and typesetting indus",
                          maxLines: 2,
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Read more",
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  style: const TextStyle(
                                    color: AppColors.textBlue,
                                    fontFamily: "Mulish",
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: Dimen.margin15),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
