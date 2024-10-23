import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/utils/app_colors.dart';
import 'package:trade_app/utils/app_fonts.dart';
import 'package:trade_app/utils/imagepath.dart';

import '../model/service_model.dart';
import '../widget/card_component.dart';

class ServiceScreen extends StatelessWidget {
  final List<String>? expertList, memberList;
  final List<ServiceModel>? serviceList;

  const ServiceScreen({super.key, this.expertList, this.memberList, this.serviceList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightBlue,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            "New Services Are Being Verified. Use Existing Ones",
                            style: AppFonts.medium(13, AppColors.textWhite),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardComponent(
                        isCertificate: false,
                        name: serviceList?[index].serviceName,
                        serviceDate: serviceList?[index].serviceDate,
                        image: serviceList?[index].serviceImage,
                        expertList: serviceList?[index].expertList,
                        memberList: serviceList?[index].memberList,
                      );
                    },
                    itemCount: serviceList?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 30,
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
              ))
        ],
      ),
    );
  }
}
