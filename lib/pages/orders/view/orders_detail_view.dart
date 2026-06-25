
import 'package:driverhub/pages/orders/logic/orders_logic.dart';
import 'package:driverhub/pages/orders/suite/orders_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetailView  extends StatelessWidget{
  const OrdersDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersLogic controller = Get.find<OrdersLogic>();
    final String id = Get.parameters['id'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text('Order #$id')),
      body: Obx((){
        if(controller.state.isLoading.value){
          return const Center(child: CircularProgressIndicator());
        }
        final Map<String, dynamic> order = controller.findById(id);
        if (order.isEmpty) {
          return Center(child: Text('Order $id not found'));
        }
        return Padding(padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Title: ${order['title']}'),
              Text('From:  ${order['from']}'),
              Text('To:    ${order['to']}'),
              Text('Price: ${order['price']}'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=> OrdersPages.openAccept(order),child: Text('Open accept'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}