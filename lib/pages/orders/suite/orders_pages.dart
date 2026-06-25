import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../../app/routes/app_routes.dart';
class OrdersPages {
  static void openOrderDetail(String orderId) => Get.toNamed('/order/$orderId');

  static void openAccept(Map<String, dynamic> order) =>
        Get.toNamed(Routes.orderAccept, arguments: order);

  static void acceptAndTrack() => Get.offAndToNamed(Routes.orderTrack);

  static void backToList() => Get.until((Route<dynamic> route) => route.settings.name == Routes.ordersList,);
}