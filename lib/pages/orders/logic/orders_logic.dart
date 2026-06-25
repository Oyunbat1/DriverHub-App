import 'package:driverhub/app/service/mock_data_service.dart';
import 'package:driverhub/pages/orders/state/orders_state.dart';
import 'package:get/get.dart';

class OrdersLogic extends GetxController {
  final OrdersState state = OrdersState();
  final MockDataService _data = Get.find<MockDataService>();

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  Future<void> loadOrders() async {
    state.isLoading.value = true;
    state.orders.assignAll(await _data.fetchOrders());
    state.isLoading.value = false;
  }


  Map<String, dynamic> findById(String id) {
    return state.orders.firstWhere(
      (Map<String, dynamic> o) => o['id'] == id,
      orElse: () => <String, dynamic>{},
    );
  }
}
