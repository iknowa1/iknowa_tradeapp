import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:trade_app/utils/imagepath.dart';
import 'package:trade_app/widgets/base_screen.dart';
import 'package:trade_app/widgets/base_text_form_field.dart';
import 'package:trade_app/widgets/custom_animated_button.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_diamentions.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../widgets/appbar.dart';
import '../../../../model/service_model.dart';
import '../controller/service_controller.dart';
import '../widget/add_service_list.dart';
import '../widget/add_trade_services_bottomsheet.dart';

class AddServiceScreen extends GetView<ServiceController> {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: AppColors.backgroundLightBlue,
      appBar: const CustomAppBar(
        centerTitle: true,
        elevation: 2,
        titleText: "Add Services",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseTextFormField(
                controller: controller.searchController,
                hintText: "Search Services",
                keyboardType: TextInputType.emailAddress,
                maxLine: 1,
                prefixIcon: ImagePath.dropdown,
                hintStyle: AppFonts.regular(16, AppColors.backgroundDarkGray)),
            SizedBox(
              height: Dimen.margin16,
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    backgroundColor: AppColors.backgroundWhite,
                    barrierColor: AppColors.backgroundLightBlue.withOpacity(0.76),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(26), topRight: Radius.circular(26)),
                        side: BorderSide(width: 2, color: AppColors.backgroundDarkGray.withOpacity(0.16))),
                    AddTradeServicesBottomSheet(
                      controller: controller.categoryController,
                      title: "Add New Trade Services",
                      name: "Service Category Name",
                      buttonTitle: "ADD CATEGORY",
                      onAdd: () {},
                      onCancel: () {
                        Get.back();
                      },
                    ));
              },
              child: Text(
                "ADD NEW TRADE SERVICES",
                style: AppFonts.bold(16, AppColors.textBlue),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textBlue.withOpacity(0.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: AppColors.textBlue, width: 2)),
                  minimumSize: Size(double.infinity, 42)),
            ),
            SizedBox(
              height: Dimen.margin10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (serviceList[index].serviceDate == null) {
                    return AddServiceList(
                      image: serviceList[index].serviceImage,
                      name: serviceList[index].serviceName,
                      type: serviceList[index].serviceType,
                      controller: controller.subCategoryController,
                    );
                  } else {
                    return SizedBox();
                  }
                },
                shrinkWrap: true,
                itemCount: serviceList.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 26, right: 26, bottom: 18, top: 20),
        color: AppColors.backgroundWhite,
        child: CustomAnimatedButton(
          text: "Continue",
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
