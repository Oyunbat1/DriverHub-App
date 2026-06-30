import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../../app/routes/app_routes.dart';
import '../view/orders_accept_view.dart';
import '../view/orders_detail_view.dart';
import '../view/orders_list_view.dart';
import '../view/orders_track_view.dart';
class OrdersPages {

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.ordersList,
      page: ()=> OrdersListView(),
    ),
    GetPage<dynamic>(
      name: Routes.orderDetail,
      page: () => const OrdersDetailView(),
    ),
    GetPage<dynamic>(name: Routes.orderAccept, page: () => const OrdersAcceptView()),
    GetPage<dynamic>(name: Routes.orderTrack, page: () => const OrdersTrackView()),

  ];

  static void openOrderDetail(String orderId) => Get.toNamed('/order/$orderId');
  static void openAccept(Map<String, dynamic> order) =>
        Get.toNamed(Routes.orderAccept, arguments: order);
  static void acceptAndTrack() => Get.offAndToNamed(Routes.orderTrack);
  static void backToList() => Get.until((Route<dynamic> route) => route.settings.name == Routes.ordersList,);
}