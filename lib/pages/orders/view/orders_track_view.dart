

import 'package:flutter/material.dart';

import '../suite/orders_pages.dart';

class OrdersTrackView extends StatelessWidget {

  const OrdersTrackView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Trip in progress')),
      body: Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.navigation, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 16),
            const Text('Driving to destination...'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: OrdersPages.backToList,
              child: const Text('Finish & back to orders'),
            ),
          ],
        ),
      ),
    );

  }

}