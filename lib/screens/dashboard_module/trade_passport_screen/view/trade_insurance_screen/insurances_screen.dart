import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_app/route/app_pages.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';
import '../../../../../utils/imagepath.dart';
import '../../../../../widgets/DashLineView.dart';

class InsurancesScreen extends StatelessWidget {
  const InsurancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 17),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
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
                          child: Text(
                            "New insurance under review. Existing coverage valid.",
                            style: AppFonts.medium(13, AppColors.textWhite),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(child: InsuranceCard()),
                ],
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.addInsuranceScreen);
                    },
                    child: ClipOval(
                      child: Container(
                        width: 60,
                        height: 60,
                        color: AppColors.textYellow,
                        child: const Center(
                          child: Icon(
                            size: 40,
                            color: AppColors.backgroundWhite,
                            Icons.add,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          )),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.backgroundYellow, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.pendingInsurance,
                      ),
                      const SizedBox(width: 5),
                      Text("Pending", style: AppFonts.bold(13, AppColors.textWhite)
                          // TextStyle(
                          //     color: AppColors.textWhite),
                          )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
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
                    SizedBox(
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
            const SizedBox(height: 12),
            const DashLineView(
              dashWith: 5,
              dashHeight: 0.5,
              fillRate: 0.8,
              dashColor: AppColors.dashLineColor,
            ),
            const SizedBox(height: 12),
            Text("Public liability (Zurich)", style: AppFonts.bold(16, AppColors.textDarkGray)),
            const SizedBox(height: 5),
            Text("Coverage: £5,000,000.00", style: AppFonts.regular(14, AppColors.textDarkGray)),
            const SizedBox(height: 5),
            Row(
              children: [
                Text("Expiry: 15 Oct 2024", style: AppFonts.regular(14, AppColors.textDarkGray)),
                const SizedBox(width: 6),
                if (index == 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(color: AppColors.backgroundRed, borderRadius: BorderRadius.circular(3)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
