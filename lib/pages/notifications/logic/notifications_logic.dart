import 'package:driverhub/app/service/mock_data_service.dart';
import 'package:get/get.dart';

import '../state/notifications_state.dart';

class NotificationsLogic extends GetxController {
  final NotificationsState state = NotificationsState();
  final MockDataService _data = Get.find<MockDataService>();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    state.isLoading.value = true;
    state.items.assignAll(await _data.fetchNotifications());
    state.isLoading.value = false;
  }
}
