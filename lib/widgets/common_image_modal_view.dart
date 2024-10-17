import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_diamentions.dart';
import '../utils/app_fonts.dart';

void showImageModalSheet({required BuildContext context, required VoidCallback onGalleryTap, required VoidCallback onCameraTap}) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        alignment: Alignment.center,
        height: 160,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.margin20, vertical: Dimen.margin30),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimen.margin24), topRight: Radius.circular(Dimen.margin24))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Upload from device",
              //   style: AppFonts.regular(16.0, AppColors.textBlack),
              // ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: Dimen.margin15),
              //   child: const Divider(
              //     color: AppColors.colorInputBorder,
              //     thickness: 1,
              //   ),
              // ),
              GestureDetector(
                onTap: onGalleryTap,
                child: Text(
                  "Choose from gallery",
                  style: AppFonts.regular(16.0, AppColors.textBlack),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: Dimen.margin15),
                child: const Divider(
                  color: AppColors.colorInputBorder,
                  thickness: 1,
                ),
              ),
              GestureDetector(
                onTap: onCameraTap,
                child: Text(
                  "Take Photo",
                  style: AppFonts.regular(16.0, AppColors.textBlack),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
