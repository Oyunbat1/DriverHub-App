import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/orders_logic.dart';
import '../suite/orders_pages.dart';

class OrdersListView extends GetView<OrdersLogic> {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Obx(() {
        if (controller.state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.state.orders.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> order = controller.state.orders[index];
            return ListTile(
              title: Text(order['title'] as String),
              subtitle: Text('${order['from']} -> ${order['to']}'),
              trailing: Text('${order['price']}'),
              onTap: () => OrdersPages.openOrderDetail(order['id'] as String),
            );
          },
        );
      }),
    );
  }
}
