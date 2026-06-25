import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class AuthPages {

  static void openForgot() {
    Get.toNamed(Routes.forgotPassword);
  }

  static void openRegister() {
    Get.toNamed(Routes.registerPhone);
  }

  static void goHomeFresh() {
    Get.offAllNamed(Routes.home);
  }

  static void backToLogin() {
    Get.back<void>();
  }
}
