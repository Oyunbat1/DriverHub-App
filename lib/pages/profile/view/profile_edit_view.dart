import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/profile_logic.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final ProfileLogic controller = Get.find<ProfileLogic>();
  late final TextEditingController _nameCtrl = TextEditingController(
    text: controller.state.profile['name'] as String? ?? '',
  );
  late final TextEditingController _phoneCtrl = TextEditingController(
    text: controller.state.profile['phone'] as String? ?? ''
  );
  late final TextEditingController _licence = TextEditingController(
      text: controller.state.profile['license'] as String? ?? ''
  );
  bool _saving = false;


  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _licence.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final bool ok = await controller.updateProfile(
      name: _nameCtrl.text,
      phone: _phoneCtrl.text,
      license: _licence.text,
    );
    if (!mounted) {
      return;
    }
    setState(() => _saving = false);
    if (ok) {
      Get.back<void>();
    } else {
      Get.snackbar('Error', 'Could not save profile. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Full name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _licence,
              decoration: const InputDecoration(
                labelText: 'Driver license',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
