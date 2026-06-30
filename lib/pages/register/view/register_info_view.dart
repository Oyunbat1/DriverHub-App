import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_logic.dart';
import '../suite/register_pages.dart';

class RegisterInfoView extends GetView<RegisterLogic> {
  const RegisterInfoView({super.key});

  void _onNext() {
    final bool anyEmpty = controller.nameCtrl.text.trim().isEmpty ||
        controller.licenseCtrl.text.trim().isEmpty ||
        controller.emailCtrl.text.trim().isEmpty ||
        controller.passwordCtrl.text.isEmpty;
    if (anyEmpty) {
      Get.snackbar(
        'Missing info',
        'Please fill in all fields.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // Firebase requires passwords of at least 6 characters.
    if (controller.passwordCtrl.text.length < 6) {
      Get.snackbar(
        'Weak password',
        'Password must be at least 6 characters.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    controller.setInfo(
      controller.nameCtrl.text,
      controller.licenseCtrl.text,
      controller.emailCtrl.text,
      controller.passwordCtrl.text,
    );
    RegisterPages.toPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register · Step 3/5')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controller.nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Full name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.licenseCtrl,
              decoration: const InputDecoration(
                labelText: 'Driver license number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password (min 6 chars)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _onNext,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
