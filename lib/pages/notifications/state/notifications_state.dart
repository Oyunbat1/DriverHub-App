import 'package:get/get.dart';

class NotificationsState {
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
}
