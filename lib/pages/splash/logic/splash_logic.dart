import 'package:get/get.dart';

import '../state/splash_state.dart';


class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    _warmUp();
  }

  Future<void> _warmUp() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    state.isChecking.value = false;
  }
}
