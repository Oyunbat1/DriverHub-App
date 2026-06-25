import 'package:get/get.dart';

import '../state/settings_state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();

  void setLanguage(String lang) => state.language.value = lang;
  void toggleNotifications(bool value) => state.notificationsOn.value = value;
}
