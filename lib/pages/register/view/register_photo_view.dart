import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_logic.dart';
import '../suite/register_pages.dart';

class RegisterPhotoView extends StatelessWidget {
  const RegisterPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterLogic controller = Get.find<RegisterLogic>();

    return Scaffold(
      appBar: AppBar(title: const Text('Register · Step 4/5')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const Text('Attach a photo of your license'),
            const SizedBox(height: 16),

            Obx(() {
              final String path = controller.state.photoPath.value;
              return Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: path.isEmpty
                      ? const Text('No photo yet')
                      : Text('Selected: $path'),
                ),
              );
            }),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => controller.setPhoto('license_photo.jpg'),
              icon: const Icon(Icons.photo_camera),
              label: const Text('Pick photo (simulated)'),
            ),
            const Spacer(),
            Obx(() {
              final bool hasPhoto = controller.state.photoPath.value.isNotEmpty;
              return ElevatedButton(
                onPressed: hasPhoto ? RegisterPages.toDone : null,
                child: const Text('Next'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
