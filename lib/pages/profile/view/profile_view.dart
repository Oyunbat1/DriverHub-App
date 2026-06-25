import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/profile_logic.dart';
import '../suite/profile_pages.dart';

class ProfileView extends GetView<ProfileLogic> {
  const ProfileView({super.key});

  Future<void> _onLogout() async {
    await controller.logout();
    ProfilePages.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Obx(() {
        final Map<String, dynamic> p = controller.state.profile;
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name:    ${p['name'] ?? '-'}'),
              Text('Email:   ${p['email'] ?? '-'}'),
              Text('Phone:   ${p['phone'] ?? '-'}'),
              Text('License: ${p['license'] ?? '-'}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: ProfilePages.openEdit,
                child: const Text('Edit profile'),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: _onLogout,
                child: const Text('Log out'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
