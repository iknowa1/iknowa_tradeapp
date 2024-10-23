import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/imagepath.dart';
import '../../../../widgets/DashLineView.dart';
import 'expert_member_service_component.dart';
import 'more_service_component.dart';

class CardComponent extends StatelessWidget {
  final bool? isCertificate;
  final String? image, name, serviceDate, fileName, membershipNo;
  final List<String>? expertList, memberList;
  const CardComponent({super.key, this.isCertificate, this.image, this.name, this.serviceDate, this.expertList, this.memberList, this.fileName, this.membershipNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 14),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(color: AppColors.backgroundWhite, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.textDarkGray.withOpacity(0.1), width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 46,
                height: 46,
                child: CircleAvatar(
                  backgroundColor: AppColors.textDarkGray,
                  child: SvgPicture.asset(
                    image ?? "",
                    width: 23,
                    height: 23,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name ?? "",
                      style: AppFonts.bold(18, AppColors.textDarkGray),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      isCertificate == false ? "Added: $serviceDate" : "MemberShip No: $membershipNo",
                      style: AppFonts.semiBold(14, AppColors.textDarkGray),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      ImagePath.deleteInsurance,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      ImagePath.editInsurance,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
          if ((isCertificate ?? false) && (fileName?.isNotEmpty ?? false)) ...[
            const SizedBox(
              height: 16,
            ),
            const DashLineView(
              dashWith: 5,
              fillRate: 0.7,
              dashColor: AppColors.dashLineColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  ImagePath.pdf,
                  width: 16,
                  height: 16,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "$fileName",
                  style: AppFonts.medium(14, AppColors.textDarkGray),
                )
              ],
            )
          ] else ...[
            if (expertList?.isNotEmpty ?? false) ...[
              const SizedBox(
                height: 16,
              ),
              const DashLineView(
                dashWith: 5,
                fillRate: 0.7,
                dashColor: AppColors.dashLineColor,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Expertise (${expertList?.length})",
                style: AppFonts.bold(14, AppColors.textDarkGray),
              ),
              SizedBox(
                height: 17,
              ),
              Wrap(
                runSpacing: 8.0,
                children: [
                  ...List.generate(
                    expertList?.length ?? 0,
                    (indexed) {
                      if (expertList != null && indexed < 2) {
                        return ExpertMemberServiceComponent(
                          isExpert: true,
                          name: expertList?[indexed],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  if ((expertList?.length ?? 0) > 2) ...[
                    MoreServiceComponent(
                      length: (expertList?.length ?? 0) - 2,
                    )
                  ],
                ],
              ),
            ]
          ],
          if (memberList?.isNotEmpty ?? false) ...[
            SizedBox(
              height: 12,
            ),
            const DashLineView(
              dashWith: 5,
              fillRate: 0.7,
              dashColor: AppColors.dashLineColor,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Members (${memberList?.length})",
              style: AppFonts.bold(14, AppColors.textDarkGray),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ...List.generate(
                  memberList?.length ?? 0,
                  (indexed) {
                    if (memberList != null && indexed < 1) {
                      return ExpertMemberServiceComponent(
                        isExpert: false,
                        name: memberList?[indexed],
                        image: ImagePath.user1,
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                if ((memberList?.length ?? 0) > 1) ...[
                  MoreServiceComponent(
                    length: (memberList?.length ?? 0) - 1,
                  )
                ]
              ],
            ),
          ]
        ],
      ),
    );
  }
}
