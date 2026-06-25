import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailView extends StatelessWidget {
  const HistoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> r =
        (Get.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};

    return Scaffold(
      appBar: AppBar(title: Text('Trip #${r['id'] ?? ''}')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Title:  ${r['title'] ?? ''}'),
            Text('Date:   ${r['date'] ?? ''}'),
            Text('Price:  ${r['price'] ?? ''}'),
            Text('Status: ${r['status'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}
