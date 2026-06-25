import 'package:get/get.dart';

import '../../../app/service/auth_service.dart';
import '../state/home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  final AuthService _auth = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    final String email = _auth.currentUser?.email ?? '';
    final Map<String, dynamic> profile = _auth.driverProfile;
    final String name = (profile['name'] as String?) ?? '';
    final String phone = (profile['phone'] as String?) ?? '';

    if (email.isNotEmpty) {
      state.driverLabel.value = email;
    } else if (name.isNotEmpty) {
      state.driverLabel.value = '$name ($phone)';
    } else {
      state.driverLabel.value = 'Driver';
    }
  }

  Future<void> logout() => _auth.signOut();
}
