import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/settings_logic.dart';
import '../suite/settings_pages.dart';

class SettingsView extends GetView<SettingsLogic> {
  const SettingsView({super.key});

  Future<void> _pickLanguage() async {
    final String? picked = await SettingsPages.openLanguagePicker();
    if (picked != null) {
      controller.setLanguage(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          Obx(() => SwitchListTile(
                title: const Text('Notifications'),
                value: controller.state.notificationsOn.value,
                onChanged: controller.toggleNotifications,
              )),
          Obx(() => ListTile(
                title: const Text('Language'),
                subtitle: Text(controller.state.language.value),
                trailing: const Icon(Icons.chevron_right),
                onTap: _pickLanguage,
              )),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.chevron_right),
            onTap: SettingsPages.openAbout,
          ),
        ],
      ),
    );
  }
}
