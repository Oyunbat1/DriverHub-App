import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';


class HomePages {
  static void logoutToLogin() {
    Get.offAllNamed(Routes.login);
  }

}
