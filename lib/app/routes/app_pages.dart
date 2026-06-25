import 'package:get/get.dart';

import '../../pages/auth/suite/auth_binding.dart';
import '../../pages/auth/view/forgot_password_view.dart';
import '../../pages/auth/view/login_view.dart';
import '../../pages/home/suite/home_binding.dart';
import '../../pages/home/view/home_view.dart';
import '../../pages/register/suite/register_binding.dart';
import '../../pages/register/view/register_done_view.dart';
import '../../pages/register/view/register_info_view.dart';
import '../../pages/register/view/register_otp_view.dart';
import '../../pages/register/view/register_phone_view.dart';
import '../../pages/register/view/register_photo_view.dart';
import '../../pages/splash/suite/splash_binding.dart';
import '../../pages/splash/view/splash_view.dart';
import 'app_routes.dart';


abstract class AppPages {
  static const String initial = Routes.splash;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
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


    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(name: Routes.ordersList, page: OrderDetailView(), binding: OrderBinding() ),
  ];
}
