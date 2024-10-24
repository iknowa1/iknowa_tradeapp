import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/model/certification_model.dart';
import 'package:trade_app/screens/dashboard_module/trade_passport_screen/widget/card_component.dart';

import '../../../../../route/app_pages.dart';
import '../../../../../utils/app_colors.dart';

class CertificationScreen extends StatelessWidget {
  final List<CertificationModel>? certificateList;
  const CertificationScreen({super.key, this.certificateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 16, left: 16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CardComponent(
                  isCertificate: true,
                  image: certificateList?[index].certificateImage,
                  name: certificateList?[index].certificateName,
                  fileName: certificateList?[index].fileName,
                  membershipNo: certificateList?[index].membershipNo,
                  memberList: certificateList?[index].memberList,
                );
              },
              shrinkWrap: true,
              itemCount: certificateList?.length ?? 0,
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.addCertificateScreen);
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
      ),
    );
  }
}
