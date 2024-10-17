import 'package:flutter/material.dart';

import '../core/common/common_service.dart';

/// A base screen widget that provides a common layout structure for
/// the application. It includes an app bar, body, background color,
/// bottom navigation bar, floating action button, and optional padding.
///
/// This widget is useful for maintaining a consistent design and layout
/// across different screens in the application.
class BaseScreen extends StatelessWidget {
  /// Constructs a [BaseScreen] widget with the provided parameters.
  ///
  /// Parameters:
  /// - [appBar]: An optional app bar widget to display at the top of the screen.
  /// - [body]: The main content of the screen. This is a required parameter.
  /// - [backgroundColor]: An optional background color for the screen.
  /// - [bottomNavigationBar]: An optional bottom navigation bar widget.
  /// - [floatingActionButton]: An optional floating action button widget.
  /// - [resizeToAvoidBottomInset]: An optional boolean to control resizing
  ///   of the screen when the keyboard is displayed.
  /// - [padding]: Optional padding to be applied around the body.
  const BaseScreen({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.padding,
  });

  /// The app bar to be displayed at the top of the screen.
  final PreferredSizeWidget? appBar;

  /// The main content of the screen.
  final Widget body;

  /// The background color of the screen.
  final Color? backgroundColor;

  /// The bottom navigation bar to be displayed at the bottom of the screen.
  final Widget? bottomNavigationBar;

  /// The floating action button to be displayed on the screen.
  final Widget? floatingActionButton;

  /// Determines whether the screen should resize when the keyboard is displayed.
  final bool? resizeToAvoidBottomInset;

  /// Padding to be applied around the body of the screen.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // Builds the screen layout using a Scaffold widget.
    return Scaffold(
      // Determines if the screen should resize to avoid overlapping with the keyboard.
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // Sets the background color of the screen.

      backgroundColor: backgroundColor,
      // Sets the app bar for the screen.
      appBar: appBar,
      // Defines the main content of the screen wrapped in a GestureDetector.
      // Tapping on the screen will remove focus from any input fields.
      body: GestureDetector(
        onTap: removeFocus,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          padding: padding,
          child: body,
        ),
      ),
      // Sets the bottom navigation bar of the screen.
      bottomNavigationBar: bottomNavigationBar,
      // Sets the floating action button of the screen.
      floatingActionButton: floatingActionButton,
    );
  }
}
