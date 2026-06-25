import 'package:get/get.dart';

class HistoryState {
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
}
