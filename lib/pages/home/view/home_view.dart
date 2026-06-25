import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/home_logic.dart';
import '../suite/home_pages.dart';


class HomeView extends GetView<HomeLogic> {
  const HomeView({super.key});

  Future<void> _onLogout() async{
    await controller.logout();
    HomePages.logoutToLogin();
  }


  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> tiles = <Map<String, dynamic>>[
      <String, dynamic>{'label': 'Orders', 'icon': Icons.list_alt, 'onTap': HomePages.openOrders},
      <String, dynamic>{'label': 'History', 'icon': Icons.history, 'onTap': HomePages.openHistory},
      <String, dynamic>{'label': 'Notifications', 'icon': Icons.notifications, 'onTap':
      HomePages.openNotifications},
      <String, dynamic>{'label': 'Profile', 'icon': Icons.person, 'onTap': HomePages.openProfile},
      <String, dynamic>{'label': 'Settings', 'icon': Icons.settings, 'onTap':
      HomePages.openSettings},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            onPressed: _onLogout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          Obx(() => Text('Signed in as: ${controller.state.driverLabel.value}')),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: tiles.map((Map<String, dynamic> t) {
                return Card(
                  child: InkWell(
                    onTap: t['onTap'] as VoidCallback,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(t['icon'] as IconData, size: 40, color: Colors.deepPurple),
                        const SizedBox(height: 8),
                        Text(t['label'] as String),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
