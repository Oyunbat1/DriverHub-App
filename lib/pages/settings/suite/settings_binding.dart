import 'package:get/get.dart';

import '../logic/settings_logic.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<SettingsLogic>(() => SettingsLogic());
}
