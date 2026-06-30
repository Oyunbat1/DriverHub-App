import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../logic/settings_binding.dart';
import '../view/settings_about_view.dart';
import '../view/settings_language_view.dart';
import '../view/settings_view.dart';

class SettingsPages {

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.settingsLanguage,
      page: () => const SettingsLanguageView(),
    ),
    GetPage<dynamic>(
      name: Routes.settingsAbout,
      page: () => const SettingsAboutView(),
    ),
  ];

  static Future<String?>? openLanguagePicker() =>
      Get.toNamed<String>(Routes.settingsLanguage);

  static void openAbout() => Get.toNamed(Routes.settingsAbout);


  static void selectLanguage(String code) => Get.back<String>(result: code);
}
