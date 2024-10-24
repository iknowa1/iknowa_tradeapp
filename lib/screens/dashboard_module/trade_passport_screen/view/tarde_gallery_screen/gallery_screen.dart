import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../route/app_pages.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';
import '../../../../../utils/imagepath.dart';
import '../../../../../widgets/DashLineView.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "Folders",
                    textAlign: TextAlign.left,
                    style: AppFonts.bold(20, AppColors.textDarkGray),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 80 * 5, child: GalleryCard()),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "Photos",
                    textAlign: TextAlign.left,
                    style: AppFonts.bold(20, AppColors.textDarkGray),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: (5 / 3).ceil() * 120,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsetsDirectional.zero,
                      itemCount: 9,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                      itemBuilder: (context, index) =>
                          // Stack(children: [
                          Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9), // Image border

                                child: Image.asset(
                                  ImagePath.slider2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withOpacity(0.84)),
                                  child: Center(
                                    child: InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            showDragHandle: true,
                                            backgroundColor: AppColors.backgroundWhite,
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26)),
                                                side: BorderSide(width: 1, color: AppColors.backgroundDarkGray.withOpacity(0.16))),
                                            builder: (context) {
                                              return Container(
                                                width: 430,
                                                height: 340,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26)),
                                                    shape: BoxShape.rectangle,
                                                    color: AppColors.backgroundWhite,
                                                    border: Border.all(color: AppColors.backgroundDarkGray.withOpacity(0.16), width: 1),
                                                    boxShadow: [BoxShadow(color: AppColors.backgroundBlack.withOpacity(0.16), blurRadius: 80, offset: Offset(0, 0), spreadRadius: 0)]),
                                                padding: EdgeInsets.only(left: 16, right: 16),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: GestureDetector(
                                                          onTap: () => Navigator.pop(context),
                                                          child: SvgPicture.asset(
                                                            ImagePath.infoImage,
                                                            width: 36,
                                                            height: 36,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 98,
                                                      height: 98,
                                                      child: CircleAvatar(
                                                        backgroundColor: AppColors.dashLineColor,
                                                        // backgroundColor: AppColors.backgroundLightSkyBlue,
                                                        child: SvgPicture.asset(
                                                          ImagePath.commericial,
                                                          // ImagePath.serviceDelete,
                                                          width: 48,
                                                          height: 48,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "Are you sure you want to delete the photo?",
                                                      style: AppFonts.bold(24, AppColors.backgroundDarkGray),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Delete",
                                                        style: AppFonts.bold(14, AppColors.textWhite),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                          backgroundColor: AppColors.backgroundRed,
                                                          minimumSize: Size(double.infinity, 42)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: SvgPicture.asset(ImagePath.delete)),
                                  ),
                                ),
                              )
                            ],
                          )),
                ),
              ],
            )),
            Positioned(
                bottom: 10,
                right: 10,
                child: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: AppColors.textYellow,
                    child: Center(
                      child: SvgPicture.asset(
                        ImagePath.uploadDoc,
                        width: 60,
                        // color: AppColors.backgroundWhite,
                        // Icons.add,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.tradePassportGalleryList);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(ImagePath.fileImage),
                  trailing: SvgPicture.asset(ImagePath.threeDot),
                  title: Text("Properties", style: AppFonts.bold(15, AppColors.textDarkGray)),
                  subtitle: Text("20 May 2022", style: AppFonts.semiBold(13, AppColors.textDarkGray.withOpacity(0.5))),
                ),
                const DashLineView(
                  dashWith: 5,
                  dashHeight: 0.5,
                  fillRate: 0.8,
                  dashColor: AppColors.dashLineColor,
                ),
              ],
            ));
  }
}
