import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../logic/home_binding.dart';
import '../view/home_view.dart';


class HomePages {
  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
  static void openOrders()=> Get.toNamed(Routes.ordersList);
  static void openHistory()=> Get.toNamed(Routes.history);
  static void openNotifications() => Get.toNamed(Routes.notifications);
  static void openProfile() => Get.toNamed(Routes.profile);
  static void openSettings() => Get.toNamed(Routes.settings);

  static void logoutToLogin() {
    Get.offAllNamed(Routes.login);
  }

}
