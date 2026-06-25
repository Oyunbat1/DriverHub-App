import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/splash_logic.dart';
import '../suite/splash_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final SplashLogic controller = Get.find<SplashLogic>();

  @override
  void initState() {
    super.initState();
    ever<bool>(controller.state.isChecking, (bool checking) {
      if (!checking) { // checking = false
        SplashPages.goLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.local_taxi, size: 72, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text(
              'DriverHub',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
