import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/notifications_logic.dart';
import '../suite/notifications_pages.dart';

class NotificationsListView extends GetView<NotificationsLogic> {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Obx(() {
        if (controller.state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.state.items.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> n = controller.state.items[index];
            return ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(n['title'] as String),
              subtitle: Text(n['body'] as String),
              trailing: Text(n['time'] as String),
              onTap: () => NotificationsPages.openDetail(n),
            );
          },
        );
      }),
    );
  }
}
