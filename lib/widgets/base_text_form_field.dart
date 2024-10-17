import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/common/common_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_diamentions.dart';
import '../utils/app_fonts.dart';

class BaseTextFormField extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final String? hintText;
  final String? titleText;
  final String? errorText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextCapitalization? textCapitalization;
  final bool? enabled;
  final double? height;
  final TextEditingController? controller;
  final Function(String value)? onChange;
  final Function? onSubmit;
  final bool autofocus;
  final String? prefixIcon;
  final String? suffixIcon;
  final Widget? prefixWidget;
  final bool showPrefixVerticalDivider;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTapSuffixIcon;
  final Function()? onTap;
  final String? prefixText;
  final String? headerText;
  final bool isRequired;

  // final FormFieldValidator<String>? validator;

  const BaseTextFormField({
    super.key,
    this.height,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.maxLine,
    this.hintText,
    this.focusNode,
    this.controller,
    this.nextFocusNode,
    this.enabled,
    this.titleStyle,
    this.titleText,
    this.errorText,
    this.labelStyle,
    this.hintStyle,
    this.onChange,
    this.textCapitalization,
    this.onSubmit,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.minLine,
    this.showPrefixVerticalDivider = true,
    this.obscureText = false,
    this.onTapSuffixIcon,
    this.onTap,
    this.readOnly = false,
    this.prefixText,
    this.headerText = "",
    this.isRequired = false,
    // this.validator,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  late Color _borderColor;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _borderColor = AppColors.colorInputBorder;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      _borderColor = _focusNode.hasFocus ? AppColors.colorInputBorderActive : AppColors.colorInputBorder;
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headerText!.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: AppFonts.medium(17, AppColors.textBlack),
              children: [
                TextSpan(text: widget.headerText),
                if (widget.isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // Animation duration
          curve: Curves.easeInOut,
          // Animation curve
          width: double.infinity,
          height: widget.height ?? 50,
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: Dimen.margin2, color: AppColors.colorInputGrayBorder),
              borderRadius: BorderRadius.circular(Dimen.cardRadius8),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                Container(
                  margin: const EdgeInsets.only(left: Dimen.margin12, right: Dimen.margin0),
                  child: SvgPicture.asset(widget.prefixIcon!),
                ),
              ],
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.prefixIcon != null ? Dimen.margin12 : Dimen.margin16, vertical: Dimen.margin1),
                  child: TextField(
                    controller: widget.controller,
                    minLines: widget.minLine ?? 1,
                    maxLines: widget.maxLine,
                    enabled: widget.enabled ?? true,
                    inputFormatters: widget.inputFormatters ?? [],
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    autofocus: widget.autofocus,
                    focusNode: _focusNode,
                    obscureText: widget.obscureText,
                    readOnly: widget.readOnly,
                    textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
                    decoration: InputDecoration(
                        prefixText: widget.prefixText ?? "",
                        prefixStyle: getTextStyle(AppFonts.regular(17, AppColors.textBlack), Dimen.textSize14),
                        hintText: widget.hintText ?? "",
                        border: InputBorder.none,
                        counterText: "",
                        hintStyle: widget.hintStyle ?? getTextStyle(AppFonts.regular(17, AppColors.textBlack.withOpacity(0.50)), Dimen.textSize14),
                        prefixIcon: widget.prefixWidget ?? Container(),
                        prefixIconConstraints: BoxConstraints(maxWidth: widget.prefixWidget != null ? Dimen.margin50 : Dimen.margin05)),
                    onSubmitted: (val) {
                      if (val.isNotEmpty) {
                        widget.onSubmit?.call();
                      }
                    },
                    onChanged: (val) {
                      widget.onChange?.call(val);
                    },
                    onTap: widget.onTap,
                    onEditingComplete: () {
                      if (widget.nextFocusNode != null) {
                        FocusScope.of(context).requestFocus(widget.nextFocusNode);
                      } else {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    // validator: widget.validator,
                  ),
                ),
              ),
              widget.suffixIcon != null
                  ? InkWell(
                      onTap: widget.onTapSuffixIcon,
                      child: Container(
                        margin: const EdgeInsets.only(right: Dimen.margin12),
                        child: SvgPicture.asset(
                          widget.suffixIcon!,
                          colorFilter: const ColorFilter.mode(Color(0xFF9C9C9C), BlendMode.srcIn),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: Dimen.margin5),
            child: Text(
              widget.errorText!,
              style: const TextStyle(color: Colors.red, fontSize: Dimen.textSize14),
            ),
          ),
      ],
    );
  }
}
