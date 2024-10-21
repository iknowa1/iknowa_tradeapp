import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CustomAnimatedButton extends StatefulWidget {
  final bool isEnabled;
  final bool isLoading;
  final String text;
  final Color enabledColor; // Color for enabled button
  final Color disabledColor; // Color for disabled button
  final Color enabledTextColor; // Color for enabled text button
  final Color disabledTextColor; // Color for disabled text button
  final Color loadingColor; // Color for the activity indicator
  final Color? outlineColor; // Optional color for outline button
  final bool isOutline; // Determines if the button is an outline button
  final VoidCallback? onPressed;
  final bool disableGradient;
  final double height;

  const CustomAnimatedButton({
    super.key,
    this.isEnabled = true,
    this.isLoading = false,
    required this.text,
    this.enabledTextColor = AppColors.textWhite,
    this.disabledTextColor = AppColors.textLightGray,
    this.enabledColor = AppColors.textBlack,
    this.disabledColor = AppColors.textLightGray,
    this.loadingColor = AppColors.textWhite,
    this.outlineColor,
    this.isOutline = false,
    this.onPressed,
    this.disableGradient = false,
    this.height = 55,
  });

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _textScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomAnimatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _controller.forward(); // Start animations
      } else {
        _controller.reverse(); // End animations
      }
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isEnabled && !widget.isLoading) {
      _controller.forward(); // Zoom in
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isEnabled && !widget.isLoading) {
      _controller.reverse(); // Zoom out
    }
  }

  void _onTapCancel() {
    if (widget.isEnabled && !widget.isLoading) {
      _controller.reverse(); // Zoom out if the tap is cancelled
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine button styles based on isEnabled and isOutline
    Color buttonColor = widget.isEnabled ? (widget.isOutline ? Colors.transparent : widget.enabledColor) : widget.disabledColor;

    // Color textColor = widget.isEnabled
    //     ? (widget.isOutline
    //         ? (widget.outlineColor ?? widget.enabledTextColor)
    //         : widget.enabledTextColor)
    //     : AppColors.disableButtonGrayText.withOpacity(0.5);

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        if (widget.isEnabled && !widget.isLoading) {
          _controller.reverse().whenComplete(() {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.disableGradient ? [AppColors.gradientYellowTopColor, AppColors.gradientYellowBottomColor] : [AppColors.textYellow, AppColors.textYellow],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                // color: buttonColor,
                borderRadius: BorderRadius.circular(8),
                border: widget.isEnabled
                    ? widget.isOutline
                        ? Border.all(color: widget.outlineColor ?? Colors.black, width: 1.0)
                        : null
                    : null,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Activity Indicator with FadeTransition
                  if (widget.isLoading)
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: widget.loadingColor,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  if (widget.isLoading) const SizedBox(width: 8),
                  // Space between spinner and text
                  // Button Text with ScaleTransition
                  Transform.scale(
                    scale: _textScaleAnimation.value,
                    child: Text(
                      widget.isLoading ? "Please wait" : widget.text,
                      style: AppFonts.bold(17, widget.isEnabled ? widget.enabledTextColor : AppColors.disableButtonGrayText.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
