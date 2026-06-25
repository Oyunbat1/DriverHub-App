import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class HistoryPages {
  static void openDetail(Map<String, dynamic> record) =>
      Get.toNamed(Routes.historyDetail, arguments: record);
}
