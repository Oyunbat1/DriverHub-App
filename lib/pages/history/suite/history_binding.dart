import 'package:get/get.dart';

import '../logic/history_logic.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<HistoryLogic>(() => HistoryLogic());
}
