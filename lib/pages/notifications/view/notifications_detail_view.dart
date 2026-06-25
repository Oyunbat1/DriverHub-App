import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsDetailView extends StatelessWidget {
  const NotificationsDetailView({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> n =
        (Get.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};

    return Scaffold(
      appBar: AppBar(title: Text(n['title'] as String? ?? 'Notification')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              n['title'] as String? ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Time: ${n['time'] ?? ''}'),
            const SizedBox(height: 16),
            Text(n['body'] as String? ?? ''),
          ],
        ),
      ),
    );
  }
}
