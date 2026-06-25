

import 'package:driverhub/pages/orders/suite/orders_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAcceptView extends StatelessWidget{
  const OrdersAcceptView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> order =
        (Get.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};
    return Scaffold(
      appBar: AppBar(title: const Text('Accept order')),
      body: Padding(padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: <Widget>[
          const Text('You are about to accept:'),
          const SizedBox(height: 8),
          Text('#${order['id']} - ${order['title']}'),
          Text('${order['from']} -> ${order['to']}'),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: OrdersPages.acceptAndTrack, child: Text('Accept and Track'),),
          )
        ],
      ),
      ),
    );
  }
}