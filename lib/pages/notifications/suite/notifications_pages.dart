import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class NotificationsPages {
  static void openDetail(Map<String, dynamic> notif) =>
      Get.toNamed(Routes.notificationDetail, arguments: notif);
}
