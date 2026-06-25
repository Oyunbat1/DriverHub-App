import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_logic.dart';
import '../suite/register_pages.dart';


class RegisterDoneView extends StatelessWidget {
  const RegisterDoneView({super.key});

  Future<void> _onFinish(RegisterLogic controller) async {
    final bool ok = await controller.submitRegistration();
    if (ok) {
      RegisterPages.finishToHome();
    } else {
      Get.snackbar(
        'Could not register',
        controller.state.error.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final RegisterLogic controller = Get.find<RegisterLogic>();

    return Scaffold(
      appBar: AppBar(title: const Text('Register · Step 5/5')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Review your details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Obx(() => Text('Phone:   ${controller.state.phone.value}')),
            Obx(() => Text('Name:    ${controller.state.name.value}')),
            Obx(() => Text('Email:   ${controller.state.email.value}')),
            Obx(() => Text('License: ${controller.state.license.value}')),
            Obx(() => Text('Photo:   ${controller.state.photoPath.value}')),
            const Spacer(),
            Obx(() {
              final bool busy = controller.state.isLoading.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: busy ? null : () => _onFinish(controller),
                  child: busy
                      ? const Text('Finishing...')
                      : const Text('Finish & go to Home'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
