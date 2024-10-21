import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import 'add_workflow_bottomsheet.dart';
import 'home_screen.dart';

class WorkflowCheckListView extends StatefulWidget {
  const WorkflowCheckListView({super.key});

  @override
  State<WorkflowCheckListView> createState() => _WorkflowCheckListViewState();
}

class _WorkflowCheckListViewState extends State<WorkflowCheckListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Dimen.margin50,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Add Business Address",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, AppRoutes.);
                            },
                          style: const TextStyle(fontSize: 15, color: AppColors.backgroundGreen, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Text.rich(
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Access document storage, create calendar events & invite others.",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.bottomSheet(AddWorkflowBottomsheet(
                                  imageUrl: ImagePath.workFlowAddService,
                                  title: "Here we go! Let’s get you your Trade Passport.",
                                  description: "Firstly, add all the services you offer.",
                                  buttonTitle: "ADD SERVICES",
                                  onTap: () {},
                                ));
                                // Navigator.pushNamed(context, AppRoutes.);
                              },
                            style: const TextStyle(fontSize: 13, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w300, decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              index != 4
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DashLineView(
                        dashColor: AppColors.dashLineColor,
                        fillRate: 0.7,
                      ),
                    )
                  : SizedBox(),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: Dimen.margin15),
        itemCount: 5,
      ),
    );
  }
}
