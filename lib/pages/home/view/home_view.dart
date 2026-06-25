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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Obx(() => Text('Signed in as: ${controller.state.driverLabel.value}')),
          ],
        ),
      ),
    );
  }
}
