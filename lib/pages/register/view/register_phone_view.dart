import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_logic.dart';
import '../suite/register_pages.dart';


class RegisterPhoneView extends StatefulWidget {
  const RegisterPhoneView({super.key});

  @override
  State<RegisterPhoneView> createState() => _RegisterPhoneViewState();
}

class _RegisterPhoneViewState extends State<RegisterPhoneView> {

  final RegisterLogic controller = Get.find<RegisterLogic>();
  final TextEditingController _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _onNext() async {
    controller.setPhone(_phoneCtrl.text);
    final bool sent = await controller.sendOtp();
    if (sent) {
      RegisterPages.toOtp();
    } else {
      Get.snackbar(
        'Could not send code',
        'Use international format, e.g. +9769xxxxxxx.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register · Step 1/5')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            const Text('Enter your phone number'),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone (+976...)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Obx(() {
              final bool busy = controller.state.isLoading.value;
              return ElevatedButton(
                onPressed: busy ? null : _onNext,
                child: busy
                    ? const Text('Sending code...')
                    : const Text('Send code'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
