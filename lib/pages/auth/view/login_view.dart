import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/auth_logic.dart';
import '../suite/auth_pages.dart';

class LoginView extends GetView<AuthLogic> {
  const LoginView({super.key});

  Future<void> _onLoginPressed() async {
    final bool ok = await controller.login(
      controller.emailCtrl.text,
      controller.passCtrl.text,
    );
    if (ok) {
      AuthPages.goHomeFresh();
    } else {
      Get.snackbar(
        'Login failed',
        'Check your email and password.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 12),
            const Icon(Icons.local_taxi, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 24),
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
              controller: controller.passCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Obx(() {
              final bool busy = controller.state.isLoading.value;
              return SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: busy ? null : _onLoginPressed,
                  child: busy
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Login'),
                ),
              );
            }),
            const SizedBox(height: 12),
            TextButton(
              onPressed: AuthPages.openForgot,
              child: const Text('Forgot password?'),
            ),
            const Divider(height: 32),
            OutlinedButton(
              onPressed: AuthPages.openRegister,
              child: const Text('Create a driver account'),
            ),
          ],
        ),
      ),
    );
  }
}
