import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/history_logic.dart';
import '../suite/history_pages.dart';

class HistoryListView extends GetView<HistoryLogic> {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip history')),
      body: Obx(() {
        if (controller.state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.state.items.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> r = controller.state.items[index];
            return ListTile(
              title: Text(r['title'] as String),
              subtitle: Text(r['date'] as String),
              trailing: Text('${r['price']}'),
              onTap: () => HistoryPages.openDetail(r),
            );
          },
        );
      }),
    );
  }
}
