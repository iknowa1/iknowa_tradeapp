// This file contains the route names used throughout the application.
// These route constants are used to navigate between different screens in the app.
// Each constant represents a specific path that maps to a screen defined in the `AppPages` class.

part of 'app_pages.dart';

abstract class Routes {
  static const splash = '/';
  static const introduction = '/introduction';
  static const login = '/login';
  static const loginOption = '/loginOption';
  static const forgotpassword = '/forgotPassword';
  static const emailRegistration = '/emailRegistration';
  static const passwordRegistration = '/passwordRegistration';
  static const otpRegistration = '/otpRegistration';
  static const emailVerificationSuccess = '/emailVerificationSuccess';
  static const addPhoneNumberRegistration = '/addPhoneNumberRegistration';
  static const addProfilePictureRegistration = '/addProfilePictureRegistration';
  static const forgotPasswordEmailLink = '/forgotPasswordEmailLink';
  static const resetPassword = '/resetPassword';
  static const mobileOTPVerification = '/mobileOTPVerification';
  static const biometricAuthentication = '/biometricAuthentication';
  static const setbiometricPascode = '/setbiometricPascode';
  static const dashboard = '/dashboard';
}
