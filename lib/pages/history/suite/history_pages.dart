import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../logic/history_binding.dart';
import '../view/history_detail_view.dart';
import '../view/history_list_view.dart';

class HistoryPages {
  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: Routes.history,
      page: () => const HistoryListView(),
      binding: HistoryBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.historyDetail,
      page: () => const HistoryDetailView(),
    ),
  ];
  static void openDetail(Map<String, dynamic> record) =>
      Get.toNamed(Routes.historyDetail, arguments: record);
}
