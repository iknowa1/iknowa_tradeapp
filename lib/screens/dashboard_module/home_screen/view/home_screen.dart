import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:trade_app/core/common/url_provider.dart';
import 'package:trade_app/main.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/controller/home_controller.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/view/workflow_checklist_view.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/widgets/base_screen.dart';
import 'package:trade_app/widgets/custom_home_appbar.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/imagepath.dart';
import '../../../../widgets/DashLineView.dart';
import '../../../../widgets/see_all_text_view.dart';
import '../../../../widgets/semibold_title_text.dart';
import 'day_view_widget.dart';
import 'jobs_near_you_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(title: "Home", onTap: () {}),
        const SizedBox(
          height: 3,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              color: AppColors.backgroundLightBlue,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const JobsNearYouView(),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (controller.addBusinessAddress.value)
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.backgroundYellow),
                              color: AppColors.backgroundYellow.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 80,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                ClipOval(
                                  child: SvgPicture.asset(
                                    ImagePath.addressAlert,
                                    width: 45,
                                    height: 45,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Next Action for workstation setup: ",
                                          style: AppFonts.medium(15, AppColors.textDarkGray),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Add business Address",
                                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                                  style: const TextStyle(
                                                    color: AppColors.textDarkGray,
                                                    fontFamily: "Mulish",
                                                    fontWeight: FontWeight.w800,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    else
                      return SizedBox();
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  // Solo trader dialog
                  Obx(() {
                    if (controller.userDetailModel.value?.userBusinessDetails?.type == "soletrader") {
                      return Padding(
                        padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(top: Dimen.margin0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withOpacity(0.1), // Changed to black for testing
                                width: 2,
                              ),
                              color: AppColors.backgroundWhite,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    Obx(() {
                                      return Container(
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimen.margin6),
                                        ),
                                        child: controller.workStationData.value?.profileImage?.isNotEmpty == true
                                            ? CachedNetworkImage(
                                                imageUrl: "${UrlProvider.imageUrl}${controller.workStationData.value?.profileImage}",
                                                width: 110,
                                                height: 110,
                                                fit: BoxFit.fill,
                                              )
                                            : Image.asset(
                                                ImagePath.user1,
                                                width: 110,
                                                height: 110,
                                                fit: BoxFit.fitWidth,
                                              ),
                                      );
                                    }),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 35,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: AppColors.backgroundYellow,
                                                borderRadius: BorderRadius.circular(8), //
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  SvgPicture.asset(
                                                    ImagePath.soleTrader,
                                                    width: 15,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Obx(() {
                                                    return Text(
                                                      controller.workStationData.value?.workstationAccountType?.name ?? "",
                                                      style: AppFonts.bold(13, AppColors.textWhite),
                                                    );
                                                  }),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Obx(() {
                                              return Text(
                                                controller.workStationData.value?.name ?? "",
                                                style: AppFonts.semiBold(20, AppColors.textDarkGray),
                                                textAlign: TextAlign.left,
                                              );
                                            }),
                                            Container(
                                              width: double.maxFinite,
                                              margin: const EdgeInsets.only(top: 5),
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Add business Address",
                                                      recognizer: TapGestureRecognizer()..onTap = () {},
                                                      style: const TextStyle(
                                                        color: AppColors.textBlue,
                                                        fontFamily: "Mulish",
                                                        fontWeight: FontWeight.w800,
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
                                            ),
                                            Row(
                                              children: [
                                                Obx(() {
                                                  return Text(
                                                    controller.userProjectRating.isEmpty ? "0" : controller.userProjectRating.length.toString(),
                                                    style: AppFonts.semiBold(22, AppColors.textDarkGray),
                                                    textAlign: TextAlign.left,
                                                  );
                                                }),
                                                Text(
                                                  "/5",
                                                  style: AppFonts.semiBold(17, AppColors.textDarkGray),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Obx(() {
                                                  return RatingBar.readOnly(
                                                    size: 30,
                                                    filledIcon: Icons.star_rounded,
                                                    emptyIcon: Icons.star_rounded,
                                                    initialRating: controller.userProjectRating.isEmpty ? 0 : controller.userProjectRating.length.toDouble(),
                                                    filledColor: AppColors.backgroundYellow,
                                                    emptyColor: AppColors.backgroundDarkGray.withOpacity(0.24),
                                                    maxRating: 5,
                                                  );
                                                })
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: DashLineView(
                                    dashColor: AppColors.dashLineColor,
                                    fillRate: 0.8,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Manage Trade Passport",
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
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  WorkStationFlowView(homeController: controller),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
                      child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(top: Dimen.margin0, left: Dimen.margin20, right: Dimen.margin20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1), // Changed to black for testing
                              width: 2,
                            ),
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SemiboldTitleText(title: "Job Overview"),
                                  const Spacer(),
                                  SeeAllTextView(text: "Manage Jobs", onTap: () {}),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    "01 Team Members",
                                    style: AppFonts.regular(15, AppColors.textDarkGray),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              const DashLineView(
                                dashColor: AppColors.dashLineColor,
                                fillRate: 0.8,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              JobOverViewSection(
                                homeController: controller,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
                      child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(top: Dimen.margin0, left: Dimen.margin20, right: Dimen.margin20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1), // Changed to black for testing
                              width: 2,
                            ),
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SemiboldTitleText(title: "Teams"),
                                  const Spacer(),
                                  SeeAllTextView(text: "Manage Teams", onTap: () {}),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: double.maxFinite,
                                  child: Obx(() {
                                    return Text(
                                      "${controller.workStationTeamMemberList.length} Team Members",
                                      style: AppFonts.regular(15, AppColors.textDarkGray),
                                    );
                                  })),
                              const SizedBox(
                                height: 20,
                              ),
                              const DashLineView(
                                dashColor: AppColors.dashLineColor,
                                fillRate: 0.8,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: Dimen.margin60,
                                width: double.infinity,
                                child: Obx(() {
                                  return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        // height: Dimen.margin207,
                                        width: 50,
                                        padding: const EdgeInsets.only(bottom: Dimen.margin2),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Stack(
                                            children: [
                                              ClipOval(
                                                child: controller.workStationTeamMemberList[index].userWorkstation?.user?.userPublicProfile!.profileImage != null
                                                    ? CachedNetworkImage(
                                                        imageUrl: "${UrlProvider.imageUrl}${controller.workStationTeamMemberList[index].userWorkstation?.user?.userPublicProfile?.profileImage}",
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Container(
                                                        width: 50,
                                                        height: 50,
                                                        color: Colors.blue,
                                                        child: Obx(() {
                                                          return Center(
                                                            child: Text(
                                                                style: AppFonts.medium(15.0, AppColors.textWhite),
                                                                controller.workStationTeamMemberList[index].userWorkstation?.user?.firstName != null
                                                                    ? "${controller.workStationTeamMemberList[index].userWorkstation?.user!.firstName?[0] ?? ""}${controller.workStationTeamMemberList[index].userWorkstation?.user!.lastName?[0] ?? ""}"
                                                                    : controller.workStationTeamMemberList[index].userWorkstation?.name?[0] ?? ""),
                                                          );
                                                        }),
                                                      )
                                                // Image.asset(
                                                //         ImagePath.user1,
                                                //         width: 50,
                                                //         height: 50,
                                                //         fit: BoxFit.fill,
                                                //       )
                                                ,
                                              ),
                                              Positioned(
                                                  left: 35,
                                                  child: ClipOval(
                                                    child: Container(
                                                      color: AppColors.backgroundRed,
                                                      height: 10,
                                                      width: 10,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(width: Dimen.margin15),
                                    itemCount: controller.workStationTeamMemberList.length,
                                  );
                                }),
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
                      child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(top: Dimen.margin0, left: Dimen.margin20, right: Dimen.margin20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1), // Changed to black for testing
                              width: 2,
                            ),
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SemiboldTitleText(title: "Trade Network"),
                                  Spacer(),
                                  // SeeAllTextView(text: "Manage Teams", onTap: () {}),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(() {
                                return Container(
                                    width: double.maxFinite,
                                    child: Text(
                                      "${controller.workStationTradeNetworkList.length} Team Members",
                                      style: AppFonts.regular(15, AppColors.textDarkGray),
                                    ));
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              DashLineView(
                                dashColor: AppColors.dashLineColor,
                                fillRate: 0.8,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.maxFinite,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          ClipRect(
                                            child: SvgPicture.asset(
                                              ImagePath.networkConnection,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.textBlue,
                                                      borderRadius: BorderRadius.circular(8), //
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Add Trade Network",
                                                          style: AppFonts.bold(13, AppColors.textWhite),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Your Trade Network will appear here",
                                                    style: AppFonts.regular(13, AppColors.textDarkGray),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ))
                            ],
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
                      child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(top: Dimen.margin0, left: Dimen.margin0, right: Dimen.margin0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1), // Changed to black for testing
                              width: 2,
                            ),
                            color: AppColors.backgroundWhite,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Obx(() {
                            return CalendarControllerProvider(
                                controller: EventController()..addAll(controller.events),
                                child: Container(
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    child: DayViewWidget(
                                      onPressed: (dateValue) {
                                        print("Home screen date is $dateValue");
                                        controller.getCalendarEventByDate(dateValue);
                                      },
                                    )));
                          }))),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SquareContainer extends StatelessWidget {
  final String imageUrl;
  final Color color;
  final String number;
  final String status;

  SquareContainer({
    required this.imageUrl,
    required this.color,
    required this.number,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // 1:1 ratio to make it square
        child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.0),
            ),
            // color: color,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SvgPicture.asset(
                  imageUrl,
                  width: 20,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  number,
                  style: AppFonts.regular(20, AppColors.textDarkGray),
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  status,
                  style: AppFonts.regular(12, AppColors.textDarkGray),
                )
              ],
            ) // Space between containers
            ),
      ),
    );
  }
}

class JobOverViewSection extends StatelessWidget {
  HomeController homeController;

  JobOverViewSection({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobProgress, color: AppColors.textBlue.withOpacity(0.10), number: '${homeController.jobInProgress.value}', status: "In progress");
            }),
            const SizedBox(width: 8),
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobNotStart, color: AppColors.textYellow.withOpacity(0.10), number: '${homeController.jobNotStarted.value}', status: "Not Started");
            }),
            const SizedBox(width: 8),
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobEstimate, color: AppColors.backgroundBrown.withOpacity(0.10), number: '${homeController.jobEstimateSent.value}', status: "Estimates Sent");
            }),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobReject, color: AppColors.backgroundRed.withOpacity(0.10), number: '${homeController.jobRejected.value}', status: "Rejected");
            }),
            const SizedBox(width: 8),
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobDraft, color: AppColors.backgroundPurple.withOpacity(0.10), number: '${homeController.jobDraftJob.value}', status: "Draft Jobs");
            }),
            const SizedBox(width: 8),
            Obx(() {
              return SquareContainer(imageUrl: ImagePath.jobComplete, color: AppColors.backgroundGreen.withOpacity(0.10), number: '${homeController.jobCompleted.value}', status: "Completed Jobs");
            }),
          ],
        ),
      ],
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     // height: (((MediaQuery.of(context).size.width / 3) - 20) * 2) + 22,
//     // width: (((MediaQuery.of(context).size.width / 3) - 20) * 2) + 20,
//     child: Column(
//       children: [
//         Expanded(
//           child: Row(
//             children: [
//               Container(
//                 color: AppColors.textBlue.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 34,
//                 width: (MediaQuery.of(context).size.width / 3) - 34,
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobProgress,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "05",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 color: AppColors.textYellow.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 34,
//                 width: (MediaQuery.of(context).size.width / 3) - 34,
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobNotStart,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "02",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12.w, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 color: AppColors.backgroundBrown.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 34,
//                 width: (MediaQuery.of(context).size.width / 3) - 34,
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobEstimate,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "01",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: Row(
//             children: [
//               Container(
//                 color: AppColors.backgroundRed.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 36,
//                 width: (MediaQuery.of(context).size.width / 3) - 36,
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobReject,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "01",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 color: AppColors.backgroundPurple.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 36,
//                 width: (MediaQuery.of(context).size.width / 3) - 36,
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobDraft,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "03",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 color: AppColors.backgroundGreen.withOpacity(0.10),
//                 height: (MediaQuery.of(context).size.width / 3) - 36,
//                 width: (MediaQuery.of(context).size.width / 3) - 36,
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset(
//                       ImagePath.jobComplete,
//                       width: 25,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "12",
//                       style: AppFonts.regular(20, AppColors.textDarkGray),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       "In progress",
//                       style: AppFonts.regular(12, AppColors.textDarkGray),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
}

class WorkStationFlowView extends StatelessWidget {
  HomeController homeController;

  WorkStationFlowView({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: Dimen.margin20, right: Dimen.margin20),
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimen.margin0, left: Dimen.margin20, right: Dimen.margin20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.1), // Changed to black for testing
                width: 2,
              ),
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Setting Up Your iknowa Workstation",
                      style: AppFonts.bold(17, AppColors.textDarkGray),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.maxFinite,
                    child: Text(
                      "Complete the below steps to activate your workstation!",
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    )),
                SizedBox(
                  height: 20,
                ),
                DashLineView(
                  dashColor: AppColors.dashLineColor,
                  fillRate: 0.8,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Your iknowa account setup",
                          style: AppFonts.bold(17, AppColors.textDarkGray),
                        ),
                        Text(
                          "24% Complete, Few Step Left",
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                        )
                      ],
                    ),
                    Spacer(),
                    SimpleCircularProgressBar(
                      size: 35,
                      progressStrokeWidth: 6,
                      backStrokeWidth: 6,
                      startAngle: 0.2,
                      backColor: AppColors.backgroundLightGreen,
                      progressColors: const [AppColors.backgroundGreen],
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                LinearProgressIndicator(
                  value: 0.2,
                  color: AppColors.backgroundGreen,
                  backgroundColor: AppColors.backgroundLightGreen,
                  semanticsLabel: 'Linear progress indicator',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.textLightGray,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // WorkflowCheckListView(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Container(
                              color: AppColors.textDarkGray,
                              width: 20,
                              height: 20,
                              child: Text(
                                "01",
                                textAlign: TextAlign.center,
                                style: AppFonts.semiBold(12, AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Create a Trade Workstation",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(context, AppRoutes.);
                                      },
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: homeController.workStationFlowStep1.value ? AppColors.backgroundGreen : AppColors.textBlue,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        decoration: homeController.workStationFlowStep1.value ? TextDecoration.lineThrough : TextDecoration.underline),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text.rich(
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Access document storage, create calendar events & invite others.",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textDarkGray,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w300,
                                          decoration: homeController.workStationFlowStep1.value ? TextDecoration.lineThrough : TextDecoration.none),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DashLineView(
                          dashColor: AppColors.dashLineColor,
                          fillRate: 0.7,
                        ),
                      ),
                      // 2nd option
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Container(
                              color: AppColors.textDarkGray,
                              width: 20,
                              height: 20,
                              child: Text(
                                "02",
                                textAlign: TextAlign.center,
                                style: AppFonts.semiBold(12, AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Add Business Address",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(context, AppRoutes.);
                                      },
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: homeController.workStationFlowStep2.value ? AppColors.backgroundGreen : AppColors.textBlue,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        decoration: homeController.workStationFlowStep2.value ? TextDecoration.lineThrough : TextDecoration.underline),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text.rich(
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Build trust and legitimacy for your business",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textDarkGray,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w300,
                                          decoration: homeController.workStationFlowStep2.value ? TextDecoration.lineThrough : TextDecoration.none),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DashLineView(
                          dashColor: AppColors.dashLineColor,
                          fillRate: 0.7,
                        ),
                      ),
                      // 3rd option
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Container(
                              color: AppColors.textDarkGray,
                              width: 20,
                              height: 20,
                              child: Text(
                                "03",
                                textAlign: TextAlign.center,
                                style: AppFonts.semiBold(12, AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Complete ID Verification (KYC)",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(context, AppRoutes.);
                                      },
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: homeController.workStationFlowStep3.value ? AppColors.backgroundGreen : AppColors.textBlue,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        decoration: homeController.workStationFlowStep3.value ? TextDecoration.lineThrough : TextDecoration.underline),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text.rich(
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Increase clients trust & win more Jobs",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textDarkGray,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w300,
                                          decoration: homeController.workStationFlowStep3.value ? TextDecoration.lineThrough : TextDecoration.none),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DashLineView(
                          dashColor: AppColors.dashLineColor,
                          fillRate: 0.7,
                        ),
                      ),
                      // 4th option
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Container(
                              color: AppColors.textDarkGray,
                              width: 20,
                              height: 20,
                              child: Text(
                                "04",
                                textAlign: TextAlign.center,
                                style: AppFonts.semiBold(12, AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Complete Your Trade Passport",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(context, AppRoutes.);
                                      },
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: homeController.workStationFlowStep4.value ? AppColors.backgroundGreen : AppColors.textBlue,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        decoration: homeController.workStationFlowStep4.value ? TextDecoration.lineThrough : TextDecoration.underline),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text.rich(
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Add Services, Certificates, Insurances & other details",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textDarkGray,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w300,
                                          decoration: homeController.workStationFlowStep4.value ? TextDecoration.lineThrough : TextDecoration.none),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DashLineView(
                          dashColor: AppColors.dashLineColor,
                          fillRate: 0.7,
                        ),
                      ),
                      // 5th option
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Container(
                              color: AppColors.textDarkGray,
                              width: 20,
                              height: 20,
                              child: Text(
                                "05",
                                textAlign: TextAlign.center,
                                style: AppFonts.semiBold(12, AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text.rich(
                              maxLines: 2,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Submit Your Workstation for Verification",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.pushNamed(context, AppRoutes.);
                                      },
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: homeController.workStationFlowStep5.value ? AppColors.backgroundGreen : AppColors.textBlue,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        decoration: homeController.workStationFlowStep5.value ? TextDecoration.lineThrough : TextDecoration.underline),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Obx(() {
                              return Text.rich(
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Access courses, jobs & trade network.",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textDarkGray,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w300,
                                          decoration: homeController.workStationFlowStep5.value ? TextDecoration.lineThrough : TextDecoration.none),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundYellow,
                    borderRadius: BorderRadius.circular(8), //
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        "SUBMIT WORKSTATION FOR VERIFICATION",
                        textAlign: TextAlign.center,
                        style: AppFonts.bold(13, AppColors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            )));
  }
}

class ResponsiveWidget extends StatelessWidget {
  final double? width;
  final double breakPoint;

  final Widget mobileWidget;

  const ResponsiveWidget({
    super.key,
    this.width,
    this.breakPoint = BreakPoints.web,
    required this.mobileWidget,
  });

  @override
  Widget build(BuildContext context) {
    final width = this.width ?? MediaQuery.of(context).size.width;

    return mobileWidget;
  }
}

class BreakPoints {
  static const double web = 800;
}
