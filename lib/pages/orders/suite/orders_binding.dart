
import 'package:driverhub/pages/orders/logic/orders_logic.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<OrdersLogic>(()=> OrdersLogic());
  }
}