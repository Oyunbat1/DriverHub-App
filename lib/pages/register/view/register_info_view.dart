import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_logic.dart';
import '../suite/register_pages.dart';

// STEP 3 of 5: personal info + the email/password the real account is made with.
class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({super.key});

  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  final RegisterLogic controller = Get.find<RegisterLogic>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _licenseCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _licenseCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _onNext() {
    final bool anyEmpty = _nameCtrl.text.trim().isEmpty ||
        _licenseCtrl.text.trim().isEmpty ||
        _emailCtrl.text.trim().isEmpty ||
        _passwordCtrl.text.isEmpty;
    if (anyEmpty) {
      Get.snackbar(
        'Missing info',
        'Please fill in all fields.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // Firebase requires passwords of at least 6 characters.
    if (_passwordCtrl.text.length < 6) {
      Get.snackbar(
        'Weak password',
        'Password must be at least 6 characters.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    controller.setInfo(
      _nameCtrl.text,
      _licenseCtrl.text,
      _emailCtrl.text,
      _passwordCtrl.text,
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
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Full name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _licenseCtrl,
              decoration: const InputDecoration(
                labelText: 'Driver license number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordCtrl,
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
