import 'package:get/get.dart';

import '../logic/notifications_logic.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<NotificationsLogic>(() => NotificationsLogic());
}
