import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/imagepath.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.leadingImage,
      this.titleText,
      this.backgroundColor,
      this.titleWidget,
      this.titleAlign = TextAlign.center,
      this.onTapBack,
      this.leadingWidget,
      this.actions = const [],
      this.actionRightPadding = 20,
      this.leadingWidth,
      this.elevation = 0,
      this.centerTitle = false});

  final String? leadingImage;
  final String? titleText;
  final TextAlign? titleAlign;
  final VoidCallback? onTapBack;
  final List<Widget> actions;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final double? actionRightPadding;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? elevation;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.textWhite,
      backgroundColor: backgroundColor ?? AppColors.textWhite,
      scrolledUnderElevation: elevation, // This will fix the problem
      elevation: elevation,
      leadingWidth: leadingWidth,
      leading: Container(
        margin: const EdgeInsets.only(left: 12),
        child: leadingWidget ??
            InkWell(
              onTap: () {
                leadingImage == null ? Navigator.of(context).pop() : onTapBack?.call();
              },
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                leadingImage ?? ImagePath.back,
                height: 44,
                width: 44,
              ),
            ),
      ),
      actions: [...actions, SizedBox(width: actionRightPadding)],
      centerTitle: centerTitle,
      title: (titleText ?? "").isNotEmpty
          ? Text(
              titleText!,
              textAlign: titleAlign,
              style: AppFonts.bold(18, AppColors.textBlack),
            )
          : titleWidget ?? Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
