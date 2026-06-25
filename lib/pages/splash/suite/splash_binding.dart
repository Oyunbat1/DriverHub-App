import 'package:get/get.dart';

import '../logic/splash_logic.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLogic>(() => SplashLogic());
  }
}
