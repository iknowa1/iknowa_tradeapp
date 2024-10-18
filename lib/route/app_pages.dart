/// This file defines the main routing configuration for the application using the GetX package.
/// It maps various screen names (routes) to their respective pages and bindings.
/// Each route corresponds to a specific screen in the application, and the routes are used
/// to navigate between screens. Transitions between screens are also defined here.
import 'package:get/get.dart';
import 'package:trade_app/screens/Registration_module/add_phone_number_screen/binding/add_phone_number_binding.dart';
import 'package:trade_app/screens/Registration_module/add_phone_number_screen/view/add_phone_number_view.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/binding/add_profile_picture_binding.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/view/add_profile_picture_screen.dart';
import 'package:trade_app/screens/Registration_module/email_registration_screen/binding/email_registration_binding.dart';
import 'package:trade_app/screens/Registration_module/email_registration_screen/view/email_registration_screen.dart';
import 'package:trade_app/screens/Registration_module/email_verification_success_screen/binding/email_verification_success_binding.dart';
import 'package:trade_app/screens/Registration_module/email_verification_success_screen/view/email_verification_success_screen.dart';
import 'package:trade_app/screens/Registration_module/mobile_otp_verification_screen/binding/mobile_otp_verification_binding.dart';
import 'package:trade_app/screens/Registration_module/mobile_otp_verification_screen/view/mobile_otp_verification_screen.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/binding/otp_registration_binding.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/view/otp_registration_screen.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/binding/password_registration_binding.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/view/password_registration_screen.dart';
import 'package:trade_app/screens/biometric_authentication_screen/binding/bio_metric_authentication_binding.dart';
import 'package:trade_app/screens/biometric_authentication_screen/view/bio_metric_authentication_screen.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/binding/profile_binding.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/view/profile_screen.dart';
import 'package:trade_app/screens/dashboard_screen/binding/dashboard_binding.dart';
import 'package:trade_app/screens/dashboard_screen/view/dashboard_screen.dart';
import 'package:trade_app/screens/forgot_password_email_link_screen/binding/forgot_password_email_link_binding.dart';
import 'package:trade_app/screens/forgot_password_email_link_screen/view/forgot_password_email_link_screen.dart';
import 'package:trade_app/screens/forgot_password_screen/view/forgot_password_screen.dart';
import 'package:trade_app/screens/introduction_screen/binding/introduction_binding.dart';
import 'package:trade_app/screens/introduction_screen/view/introduction_screen.dart';
import 'package:trade_app/screens/login_option_screen/binding/login_option_binding.dart';
import 'package:trade_app/screens/login_option_screen/view/login_option_screen.dart';
import 'package:trade_app/screens/login_screen/view/login_screen.dart';
import 'package:trade_app/screens/reset_password_screen/reset_password_binding/reset_password_binding.dart';
import 'package:trade_app/screens/reset_password_screen/reset_password_view/reset_password_screen.dart';
import 'package:trade_app/screens/set_passcode_screen/binding/set_passcode_binding.dart';
import 'package:trade_app/screens/set_passcode_screen/view/set_passcode_screen.dart';
import '../screens/forgot_password_screen/binding/forgot_password_binding.dart';
import '../screens/login_screen/bindings/login_bindings.dart';
import '../screens/splash_screen/view/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.introduction,
      page: () => const IntroductionScreen(),
      binding: IntroductionBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.forgotpassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.loginOption,
      page: () => const LoginOptionScreen(),
      binding: LoginOptionBinding(),
    ),
    GetPage(
      name: Routes.emailRegistration,
      page: () => const EmailRegistrationScreen(),
      binding: EmailRegistrationBinding(),
    ),
    GetPage(
      name: Routes.passwordRegistration,
      page: () => const PasswordRegistrationScreen(),
      binding: PasswordRegistrationBinding(),
    ),
    GetPage(
      name: Routes.otpRegistration,
      page: () => const OtpRegistrationScreen(),
      binding: OtpRegistrationBinding(),
    ),
    GetPage(
      name: Routes.emailVerificationSuccess,
      page: () => const EmailVerificationSuccessScreen(),
      binding: EmailVerificationSuccessBinding(),
    ),
    GetPage(
      name: Routes.addPhoneNumberRegistration,
      page: () => const AddPhoneNumberView(),
      binding: AddPhoneNumberBinding(),
    ),
    GetPage(
      name: Routes.addProfilePictureRegistration,
      page: () => const AddProfilePictureScreen(),
      binding: AddProfilePictureBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordEmailLink,
      page: () => const ForgotPasswordEmailLinkScreen(),
      binding: ForgotPasswordEmailLinkBinding(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.mobileOTPVerification,
      page: () => const MobileOtpVerificationScreen(),
      binding: MobileOtpVerificationBinding(),
    ),
    GetPage(
      name: Routes.biometricAuthentication,
      page: () => const BioMetricAuthenticationScreen(),
      binding: BioMetricAuthenticationBinding(),
    ),
    GetPage(
      name: Routes.setbiometricPascode,
      page: () => const SetPasscodeScreen(),
      binding: SetPasscodeBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.dashboardProfile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
