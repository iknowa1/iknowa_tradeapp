import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_app/utils/app_diamentions.dart';
import 'package:trade_app/utils/app_fonts.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../widgets/DashLineView.dart';
import '../../../../../widgets/empty_gride_card.dart';

class TradeOverviewScreen extends StatelessWidget {
  Color? screenColor;

  bool isDescription = false;

  TradeOverviewScreen({super.key, required this.screenColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.backgroundDarkYellow),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SvgPicture.asset(
                        ImagePath.serviceInfo,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Next Action for workstation setup: ",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textWhite,
                                  fontFamily: "Mulish",
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text: "Submit Your Workstation for Verification",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textWhite,
                                  fontFamily: "Mulish",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 118,
                            width: 118,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundUserProfile.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(Dimen.btRadius8),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                ImagePath.profilePlaceholder,
                                colorFilter: const ColorFilter.mode(AppColors.userProfileColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sparks Property Ltd", style: AppFonts.regular(17.0, AppColors.textDarkGray)),
                              const SizedBox(height: 9),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimen.margin6),
                                  color: AppColors.backgroundLightYellow,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImagePath.ltdCompany,
                                      width: 15,
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text("LIMITED COMPANY")
                                  ],
                                ),
                              ),
                              const SizedBox(height: 9),
                              Row(
                                children: [
                                  Text(
                                    "4.3",
                                    style: AppFonts.semiBold(22, AppColors.textDarkGray),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "/5",
                                    style: AppFonts.semiBold(17, AppColors.textDarkGray),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  RatingBar.readOnly(
                                    size: 25,
                                    filledIcon: Icons.star_rounded,
                                    emptyIcon: Icons.star_rounded,
                                    initialRating: 3.5,
                                    filledColor: AppColors.backgroundYellow,
                                    emptyColor: AppColors.backgroundDarkGray.withOpacity(0.24),
                                    maxRating: 5,
                                  )
                                ],
                              ),
                              const SizedBox(height: 9),
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.generatePassport, width: 25, height: 25),
                                  const SizedBox(width: 7),
                                  const Text(
                                    "Generate Passport",
                                    style: TextStyle(color: AppColors.textBlue, decoration: TextDecoration.underline, decorationColor: AppColors.textBlue, fontWeight: FontWeight.w600, fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 17),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 21.0, bottom: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              "Flat 20, Treeline court, Uxbridge Road",
                              overflow: TextOverflow.ellipsis,
                            )),
                            Row(
                              children: [
                                const SizedBox(width: 9),
                                SvgPicture.asset(ImagePath.locationBlack),
                                const SizedBox(width: 3),
                                const Text("W12 9RE"),
                              ],
                            )
                          ],
                        ),
                      ),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Edit Workstation",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // const Text(
                      //   "Genrate Passport",
                      //   style: TextStyle(color: AppColors.textBlue, decoration: TextDecoration.underline, decorationColor: AppColors.textBlue),
                      // ),
                      // SizedBox(height: 15)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rates",
                            style: AppFonts.bold(15, AppColors.textDarkGray),
                          ),
                          SvgPicture.asset(
                            ImagePath.infoImage,
                            height: 20,
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Hourly Rate:"),
                          Text(
                            "£50.00",
                            style: AppFonts.semiBold(15, AppColors.textDarkGray),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Daily Rate:"),
                          Text(
                            "£400.00",
                            style: AppFonts.semiBold(15, AppColors.textDarkGray),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Emergency Call Out Fee:"),
                          Text(
                            "£100.00",
                            style: AppFonts.semiBold(15, AppColors.textDarkGray),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Emergency Call out Hourly Rate:"),
                          Text(
                            "£60.00",
                            style: AppFonts.semiBold(15, AppColors.textDarkGray),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Video Consultation:"),
                          Text(
                            "£40.00/hrs",
                            style: AppFonts.semiBold(15, AppColors.textDarkGray),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 17),
                      child: Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Edit Rates",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: AppColors.backgroundWhite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Services",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            SvgPicture.asset(
                              ImagePath.infoImage,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      Container(padding: const EdgeInsets.symmetric(vertical: 16), child: ServiceTypeGrid()),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Manage Services",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Insurance",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            SvgPicture.asset(
                              ImagePath.infoImage,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.dashLineColor,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(color: AppColors.backgroundUserProfile.withOpacity(0.16), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(color: AppColors.backgroundYellow, borderRadius: BorderRadius.circular(3)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.pendingInsurance,
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Pending",
                                          style: AppFonts.bold(15, AppColors.textWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.deleteInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.editInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 14),
                            const Divider(
                              height: 1,
                              color: AppColors.dashLineColor,
                            ),
                            const SizedBox(height: 17),
                            Text(
                              "Public liability (Zurich)",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Insurance Number: 1234567",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Coverage: £5,000,000.00",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Expiry: 15 Oct 2024",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(color: AppColors.backgroundUserProfile.withOpacity(0.16), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(color: AppColors.backgroundYellow, borderRadius: BorderRadius.circular(3)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.pendingInsurance,
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Pending",
                                          style: AppFonts.bold(15, AppColors.textWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.deleteInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.editInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 14),
                            const Divider(
                              height: 1,
                              color: AppColors.dashLineColor,
                            ),
                            const SizedBox(height: 17),
                            Text(
                              "Public liability (Zurich)",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Insurance Number: 1234567",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Coverage: £5,000,000.00",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            // SizedBox(height: 11),
                            Text(
                              "Expiry: 15 Oct 2024",
                              style: AppFonts.regular(15, AppColors.textDarkGray),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "+2 More Insurance",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textYellow,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Manage Insurance",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Certificates",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            SvgPicture.asset(
                              ImagePath.infoImage,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(color: AppColors.backgroundUserProfile.withOpacity(0.16), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(color: AppColors.backgroundYellow, borderRadius: BorderRadius.circular(3)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.pendingInsurance,
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Pending",
                                          style: AppFonts.bold(15, AppColors.textWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.deleteInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.editInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 14),
                            const DashLineView(
                              dashWith: 4,
                              dashHeight: 0.5,
                              dashColor: AppColors.dashLineColor,
                              fillRate: 0.7,
                            ),
                            // const Divider(
                            //   height: 1,
                            //   color: AppColors.dashLineColor,
                            // ),
                            const SizedBox(height: 11),
                            Row(
                              children: [
                                Container(
                                  height: 46,
                                  width: 46,
                                  child: Center(child: SvgPicture.asset(ImagePath.work, height: 46, width: 46)),
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Gas Safe Registry",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.bold(15, AppColors.textDarkGray),
                                      ),
                                      Text(
                                        "Membership No: 52212545",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.regular(15, AppColors.textDarkGray.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 11),
                            const DashLineView(
                              dashWith: 4,
                              dashHeight: 0.5,
                              dashColor: AppColors.dashLineColor,
                              fillRate: 0.7,
                            ),
                            // const Divider(height: 1, color: AppColors.dashLineColor),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.pdf,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "Accreditation.pdf",
                                    style: AppFonts.regular(15, AppColors.textDarkGray),
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(color: AppColors.backgroundUserProfile.withOpacity(0.16), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(color: AppColors.backgroundYellow, borderRadius: BorderRadius.circular(3)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.pendingInsurance,
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Pending",
                                          style: AppFonts.bold(15, AppColors.textWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.deleteInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          ImagePath.editInsurance,
                                          height: 30,
                                          width: 30,
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 14),
                            const DashLineView(
                              dashWith: 4,
                              dashHeight: 0.5,
                              dashColor: AppColors.dashLineColor,
                              fillRate: 0.7,
                            ),
                            const SizedBox(height: 11),
                            Row(
                              children: [
                                Container(
                                  height: 46,
                                  width: 46,
                                  child: Center(child: SvgPicture.asset(ImagePath.work, height: 46, width: 46)),
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Gas Safe Registry",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.bold(15, AppColors.textDarkGray),
                                      ),
                                      Text(
                                        "Membership No: 52212545",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.regular(15, AppColors.textDarkGray.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 11),
                            const DashLineView(
                              dashWith: 4,
                              dashHeight: 0.5,
                              dashColor: AppColors.dashLineColor,
                              fillRate: 0.7,
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.pdf,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "Accreditation.pdf",
                                    style: AppFonts.regular(15, AppColors.textDarkGray),
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "+2 More Insurance",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textYellow,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Manage Certification",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Description",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                            SvgPicture.asset(
                              ImagePath.infoImage,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      if (isDescription) ...[
                        Center(
                          child: EmptyGridCard(
                            title: "Your Description will appear here",
                            addText: "Add Description",
                            imgIcon: ImagePath.addDescription,
                            onAddTextPress: () {},
                          ),
                        )
                      ] else if (!isDescription) ...[
                        const SizedBox(height: 16),
                        Text(
                          """
Hi I am Keano Chang. Lorem ipsum dolor sit amet consectetur. 
                     
Sed odio tristique a libero. Habitant duis congue nunc etiam malesuada risus. Tellus rhoncus vel est arcu.

Lorem ipsum dolor sit amet consectetur. Sed odio tristique a libero. Habitant duis congue nunc etiam malesuada risus. Tellus rhoncus vel est arcu.Ornare nisi sed odio id. Eget in vestibulum lorem lectus justo enim.""",
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 16),
                        const DashLineView(
                          dashColor: AppColors.dashLineColor,
                          fillRate: 0.7,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.maxFinite,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Edit Description",
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  style: const TextStyle(
                                    color: AppColors.textBlue,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1), // Changed to black for testing
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Dimen.btRadius8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Galley ",
                              style: AppFonts.bold(15, AppColors.textDarkGray),
                            ),
                          ],
                        ),
                      ),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                          height: Dimen.margin120,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 120,
                                width: 120,
                                padding: const EdgeInsets.only(bottom: Dimen.margin2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8), // Add rounded corners here
                                  child: CachedNetworkImage(
                                    imageUrl: "https://miro.medium.com/v2/resize:fit:720/format:webp/1*U4gZLnRtHEeJuc6tdVLwPw.png",
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => CircularProgressIndicator(), // Optional placeholder
                                    errorWidget: (context, url, error) => Icon(Icons.error), // Optional error widget
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: Dimen.margin15),
                            itemCount: 4,
                          )),
                      const SizedBox(height: 15),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "+3 more",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textYellow,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Manage Galley",
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceTypeGrid extends StatelessWidget {
  int? count = 9;
  ServiceTypeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsetsDirectional.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: (count ?? 0) > 9 ? 9 : count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 14.0, mainAxisSpacing: 14.0),
        itemBuilder: (context, index) => index != 8
            ? Container(
                height: 100,
                width: 114,
                decoration: BoxDecoration(color: AppColors.backgroundUserProfile.withOpacity(0.16), borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.backgroundBlue),
                      child: SvgPicture.asset(
                        ImagePath.infoImage,
                        fit: BoxFit.none,
                      ),
                    ),
                    const Text("this is Text")
                  ],
                ),
              )
            : Container(
                height: 100,
                width: 114,
                decoration: BoxDecoration(
                  color: AppColors.backgroundYellow.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.backgroundYellow, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.backgroundYellow),
                      child: const Center(
                          child: Text(
                        "3+",
                        style: TextStyle(color: AppColors.textWhite),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    const Text("More")
                  ],
                ),
              ));
  }
}
