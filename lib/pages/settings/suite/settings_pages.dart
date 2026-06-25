import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class SettingsPages {
  static Future<String?>? openLanguagePicker() =>
      Get.toNamed<String>(Routes.settingsLanguage);

  static void openAbout() => Get.toNamed(Routes.settingsAbout);


  static void selectLanguage(String code) => Get.back<String>(result: code);
}
