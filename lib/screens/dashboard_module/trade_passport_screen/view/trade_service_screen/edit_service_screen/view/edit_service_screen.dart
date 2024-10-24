import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_diamentions.dart';
import 'package:trade_app/widgets/base_screen.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../utils/imagepath.dart';
import '../../../../model/service_model.dart';
import '../controller/EditServiceController.dart';
import '../widget/edit_service_component.dart';

class EditServiceScreen extends GetView<EditServiceController> {
  const EditServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: AppColors.backgroundLightBlue,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.backgroundWhite,
          surfaceTintColor: AppColors.backgroundWhite,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SvgPicture.asset(
              ImagePath.back,
              width: 21,
              height: 21,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Edit Services",
            textAlign: TextAlign.center,
            style: AppFonts.semiBold(26, AppColors.textDarkGray),
          ),
          centerTitle: true,
          elevation: 6,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 26, left: 16, right: 16),
            child: Column(
              children: [
                Obx(
                  () {
                    return Row(
                      children: [
                        SizedBox(
                          width: 46,
                          height: 46,
                          child: CircleAvatar(
                            backgroundColor: AppColors.textDarkGray,
                            child: SvgPicture.asset(
                              serviceList[controller.index.value].serviceImage ?? "",
                              width: 23,
                              height: 23,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimen.margin8,
                        ),
                        Text(
                          serviceList[controller.index.value].serviceName ?? "",
                          style: AppFonts.bold(18, AppColors.backgroundDarkGray),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: Dimen.margin16,
                ),
                EditServiceComponent(
                  child: Obx(() {
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      children: serviceList[controller.index.value].expertList?.map(
                            (e) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColors.backgroundUserProfile.withOpacity(0.16)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      splashRadius: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.50), width: 2)),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity(horizontal: -0.4, vertical: -0.4),
                                      activeColor: AppColors.textBlue,
                                      value: controller.isSelected.value,
                                      onChanged: (value) {
                                        controller.isSelected.value = !controller.isSelected.value;
                                      },
                                    ),
                                    Text(
                                      e,
                                      style: AppFonts.bold(14, AppColors.backgroundDarkGray),
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList() ??
                          [],
                    );
                  }),
                  controller: controller.searchExpertiseController,
                  isExpert: true,
                  selected: 2,
                ),
                SizedBox(
                  height: Dimen.margin16,
                ),
                EditServiceComponent(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          20,
                          (index) {
                            return Container(
                              width: 96,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(color: const Color(0xFFF6F6F8), borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.50), width: 2)),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: VisualDensity(horizontal: -0.4, vertical: -0.4),
                                          activeColor: Color(0xFF4B4BFF),
                                        )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          ImagePath.user1,
                                          width: 56,
                                          height: 56,
                                          fit: BoxFit.cover,
                                        )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "nnskcn",
                                      style: AppFonts.bold(14, AppColors.textDarkGray),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  isExpert: false,
                  selected: 3,
                  controller: controller.searchMemberController,
                ),
              ],
            ),
          ),
        ));
  }
}
