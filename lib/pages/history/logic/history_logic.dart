import 'package:driverhub/app/service/mock_data_service.dart';
import 'package:get/get.dart';

import '../state/history_state.dart';

class HistoryLogic extends GetxController {
  final HistoryState state = HistoryState();
  final MockDataService _data = Get.find<MockDataService>();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    state.isLoading.value = true;
    state.items.assignAll(await _data.fetchHistory());
    state.isLoading.value = false;
  }
}
