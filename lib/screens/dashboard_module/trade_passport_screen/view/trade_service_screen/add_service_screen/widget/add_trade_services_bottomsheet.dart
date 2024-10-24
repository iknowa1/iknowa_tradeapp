import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/app_diamentions.dart';
import '../../../../../../../utils/app_fonts.dart';
import '../../../../../../../utils/imagepath.dart';

class AddTradeServicesBottomSheet extends StatelessWidget {
  final String? title, name, buttonTitle;
  final TextEditingController? controller;
  final void Function()? onAdd, onCancel;
  const AddTradeServicesBottomSheet({super.key, this.title, this.name, this.controller, this.buttonTitle, this.onAdd, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.textDarkGray.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8), //
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImagePath.bottomSheetClose,
                  width: 35,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimen.margin30,
          ),
          Text(
            title ?? "",
            style: AppFonts.bold(26, AppColors.backgroundDarkGray),
          ),
          SizedBox(
            height: Dimen.margin30,
          ),
          Text(
            name ?? "",
            style: AppFonts.bold(16, AppColors.backgroundDarkGray),
          ),
          SizedBox(
            height: Dimen.margin10,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                fillColor: AppColors.backgroundBlue,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: AppColors.backgroundDarkGray.withOpacity(0.10), width: 2)),
                hintText: "Enter Category Name",
                hintStyle: AppFonts.regular(16, AppColors.backgroundDarkGray)),
          ),
          SizedBox(
            height: Dimen.margin30,
          ),
          ElevatedButton(
            onPressed: onAdd,
            child: Text(
              buttonTitle ?? "",
              style: AppFonts.bold(14, AppColors.textWhite),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), backgroundColor: AppColors.backgroundYellow, minimumSize: Size(double.infinity, Dimen.margin42)),
          ),
          SizedBox(
            height: Dimen.margin16,
          ),
          ElevatedButton(
            onPressed: onCancel,
            child: Text(
              "CANCEL",
              style: AppFonts.bold(14, AppColors.textBlue),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: AppColors.backgroundWhite, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), minimumSize: Size(double.infinity, Dimen.margin42)),
          ),
        ],
      ),
    );
  }
}
