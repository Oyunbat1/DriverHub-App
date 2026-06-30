import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../logic/notifications_binding.dart';
import '../view/notifications_detail_view.dart';
import '../view/notifications_list_view.dart';

class NotificationsPages {
  static List<GetPage<dynamic>> pages =[
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
  static void openDetail(Map<String, dynamic> notif) =>
      Get.toNamed(Routes.notificationDetail, arguments: notif);
}
