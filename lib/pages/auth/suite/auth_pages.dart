import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../register/logic/register_binding.dart';
import '../../register/view/register_done_view.dart';
import '../../register/view/register_info_view.dart';
import '../../register/view/register_otp_view.dart';
import '../../register/view/register_phone_view.dart';
import '../../register/view/register_photo_view.dart';
import '../../splash/logic/splash_binding.dart';
import '../../splash/view/splash_view.dart';
import '../logic/auth_binding.dart';
import '../view/forgot_password_view.dart';
import '../view/login_view.dart';

class AuthPages {
static List<GetPage<dynamic>> pages = [
  GetPage<dynamic>(
    name: Routes.splash,
    page: () => const SplashView(),
    binding: SplashBinding(),
  ),

  GetPage<dynamic>(
    name: Routes.login,
    page: () => const LoginView(),
    binding: AuthBinding(),
  ),
  GetPage<dynamic>(
    name: Routes.forgotPassword,
    page: () => const ForgotPasswordView(),
    binding: AuthBinding(),
  ),

  GetPage<dynamic>(
    name: Routes.registerPhone,
    page: () => const RegisterPhoneView(),
    binding: RegisterBinding(),
  ),
  GetPage<dynamic>(
    name: Routes.registerOtp,
    page: () => const RegisterOtpView(),
  ),
  GetPage<dynamic>(
    name: Routes.registerInfo,
    page: () => const RegisterInfoView(),
  ),
  GetPage<dynamic>(
    name: Routes.registerPhoto,
    page: () => const RegisterPhotoView(),
  ),
  GetPage<dynamic>(
    name: Routes.registerDone,
    page: () => const RegisterDoneView(),
  ),
];


  static void openForgot() {
    Get.toNamed(Routes.forgotPassword);
  }

  static void openRegister() {
    Get.toNamed(Routes.registerPhone);
  }

  static void goHomeFresh() {
    Get.offAllNamed(Routes.home);
  }

  static void backToLogin() {
    Get.back<void>();
  }
}
