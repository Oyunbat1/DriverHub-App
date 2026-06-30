import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/auth_logic.dart';
import '../suite/auth_pages.dart';

class ForgotPasswordView extends GetView<AuthLogic> {
  const ForgotPasswordView({super.key});

  Future<void> _onSendPressed() async {
    final bool ok = await controller.sendReset(controller.emailCtrl.text);
    if (ok) {
      Get.snackbar(
        'Email sent',
        'Check your inbox to reset your password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      AuthPages.backToLogin();
    } else {
      Get.snackbar(
        'Could not send',
        'Please check the email address.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot password')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 12),
            const Text('Enter your email and we will send a reset link.'),
            const SizedBox(height: 16),
            TextField(
              controller: controller.emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Obx(() {
              final bool busy = controller.state.isLoading.value;
              return SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: busy ? null : _onSendPressed,
                  child: busy
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Send reset link'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
