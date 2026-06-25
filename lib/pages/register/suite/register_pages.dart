import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class RegisterPages {
  static void toOtp() => Get.toNamed(Routes.registerOtp);
  static void toInfo() => Get.toNamed(Routes.registerInfo);
  static void toPhoto() => Get.toNamed(Routes.registerPhoto);
  static void toDone() => Get.toNamed(Routes.registerDone);


  static void finishToHome() {
    Get.offNamedUntil(Routes.home, (Route<dynamic> route) => false);
  }
}
