
import 'package:get/get.dart';

class OrdersState {
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
}