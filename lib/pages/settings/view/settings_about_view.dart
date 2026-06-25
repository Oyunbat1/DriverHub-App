import 'package:flutter/material.dart';

class SettingsAboutView extends StatelessWidget {
  const SettingsAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'DriverHub\n\nLearning project for LaS-Vegas + GetX.\nVersion 1.0.0',
        ),
      ),
    );
  }
}
