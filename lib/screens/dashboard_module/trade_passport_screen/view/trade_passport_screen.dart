import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/controller/trade_passport_controller.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/model/certification_model.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_certificate_screen/certification_screen.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_review_screen/review_screen.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_service_screen/service_screen.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_overview_screen/trade_overview_screen.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/view/trade_job_screen/trade_passport_job_screen.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/custom_home_appbar.dart';
import '../model/review_model.dart';
import '../model/service_model.dart';
import 'tarde_gallery_screen/gallery_screen.dart';
import 'trade_insurance_screen/insurances_screen.dart';

class TradePassportScreen extends StatefulWidget {
  const TradePassportScreen({super.key});

  @override
  State<TradePassportScreen> createState() => _TradePassportScreenState();
}

class _TradePassportScreenState extends State<TradePassportScreen> with SingleTickerProviderStateMixin {
  final controller = Get.put(TradePassportController());

  @override
  void initState() {
    controller.tabController = TabController(length: 7, vsync: this);
    controller.tabController.index = 0;
    controller.selectedTab.value = 0;
    controller.tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.backgroundWhite,
        child: Column(
          children: [
            CustomHomeAppBar(title: "Trade Passport", onTap: () {}),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 1,
              child: Container(
                color: AppColors.backgroundWhite,
                height: 40,
                child: TabBar(
                    onTap: (selectedIndex) {
                      controller.selectedTab.value = selectedIndex;
                    },
                    controller: controller.tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    padding: EdgeInsets.zero,
                    indicatorColor: AppColors.gradientTopColor,
                    unselectedLabelColor: AppColors.textDarkGray,
                    labelColor: AppColors.gradientTopColor,
                    indicatorPadding: const EdgeInsets.all(-2),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 5,
                    dividerHeight: 1,
                    dividerColor: AppColors.backgroundBlack,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeOverview,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 0 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Overview",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeService,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 1 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Services",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeCertificate,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 2 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Certifications",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeInsurance,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 3 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Insurances",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeJob,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 4 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Job",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeReview,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 5 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Reviews",
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            Obx(() {
                              return SvgPicture.asset(ImagePath.tradeGallery,
                                  colorFilter: ColorFilter.mode(controller.selectedTab.value == 6 ? AppColors.selectedTabBlue : AppColors.backgroundDarkGray, BlendMode.srcIn));
                            }),
                            const SizedBox(width: 11),
                            const Text(
                              "Gallery",
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              height: 1,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  TradeOverviewScreen(screenColor: AppColors.backgroundLightBlue),
                  ServiceScreen(
                    serviceList: serviceList,
                  ),
                  CertificationScreen(certificateList: certificationList),
                  const InsurancesScreen(),
                  const TradePassportJobScreen(),
                  ReviewScreen(reviewList: reviewList),
                  const GalleryScreen(),
                ],
              ),
            ),
          ],
        ));
  }
}
