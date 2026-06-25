import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class ProfilePages {
  static void openEdit() => Get.toNamed(Routes.profileEdit);
  static void logout() => Get.offAllNamed(Routes.login);
}
