import 'package:driverhub/pages/orders/suite/orders_binding.dart';
import 'package:driverhub/pages/orders/view/orders_accept_view.dart';
import 'package:driverhub/pages/orders/view/orders_detail_view.dart';
import 'package:driverhub/pages/orders/view/orders_list_view.dart';
import 'package:driverhub/pages/orders/view/orders_track_view.dart';
import 'package:get/get.dart';

import '../../pages/auth/suite/auth_binding.dart';
import '../../pages/auth/view/forgot_password_view.dart';
import '../../pages/auth/view/login_view.dart';
import '../../pages/history/suite/history_binding.dart';
import '../../pages/history/view/history_detail_view.dart';
import '../../pages/history/view/history_list_view.dart';
import '../../pages/home/suite/home_binding.dart';
import '../../pages/home/view/home_view.dart';
import '../../pages/notifications/suite/notifications_binding.dart';
import '../../pages/notifications/view/notifications_detail_view.dart';
import '../../pages/notifications/view/notifications_list_view.dart';
import '../../pages/profile/suite/profile_binding.dart';
import '../../pages/profile/view/profile_edit_view.dart';
import '../../pages/profile/view/profile_view.dart';
import '../../pages/register/suite/register_binding.dart';
import '../../pages/register/view/register_done_view.dart';
import '../../pages/register/view/register_info_view.dart';
import '../../pages/register/view/register_otp_view.dart';
import '../../pages/register/view/register_phone_view.dart';
import '../../pages/register/view/register_photo_view.dart';
import '../../pages/settings/suite/settings_binding.dart';
import '../../pages/settings/view/settings_about_view.dart';
import '../../pages/settings/view/settings_language_view.dart';
import '../../pages/settings/view/settings_view.dart';
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
    GetPage(
        name: Routes.ordersList,
        page: ()=> OrdersListView(),
        binding: OrdersBinding() ),
    GetPage<dynamic>(
      name: Routes.orderDetail,
      page: () => const OrdersDetailView(),
      binding: OrdersBinding(),
    ),
    GetPage<dynamic>(name: Routes.orderAccept, page: () => const OrdersAcceptView()),
    GetPage<dynamic>(name: Routes.orderTrack, page: () => const OrdersTrackView()),


    GetPage<dynamic>(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.profileEdit,
      page: () => const ProfileEditView(),
    ),

    // history
    GetPage<dynamic>(
      name: Routes.history,
      page: () => const HistoryListView(),
      binding: HistoryBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.historyDetail,
      page: () => const HistoryDetailView(),
    ),

    // settings
    GetPage<dynamic>(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.settingsLanguage,
      page: () => const SettingsLanguageView(),
    ),
    GetPage<dynamic>(
      name: Routes.settingsAbout,
      page: () => const SettingsAboutView(),
    ),

    // notifications
    GetPage<dynamic>(
      name: Routes.notifications,
      page: () => const NotificationsListView(),
      binding: NotificationsBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.notificationDetail,
      page: () => const NotificationsDetailView(),
    ),
  ];
}
