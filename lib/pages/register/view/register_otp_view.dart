import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/service/auth_service.dart';
import '../logic/register_logic.dart';
import '../suite/register_pages.dart';


class RegisterOtpView extends GetView<RegisterLogic> {
  const RegisterOtpView({super.key});

  Future<void> _onVerify() async {
    final bool ok = await controller.verifyOtp(controller.codeCtrl.text);
    if (ok) {
      RegisterPages.toInfo();
    } else {
      Get.snackbar(
        'Wrong code',
        'Please re-enter the 6-digit code.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register · Step 2/5')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            Obx(() => Text('Code sent to ${controller.state.phone.value}')),
            const SizedBox(height: 4),

            Text(
              'Demo code: ${AuthService.demoSmsCode}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.codeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '6-digit code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Obx(() {
              final bool busy = controller.state.isLoading.value;
              return ElevatedButton(
                onPressed: busy ? null : _onVerify,
                child: busy ? const Text('Verifying...') : const Text('Verify'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
