import 'package:driverhub/app/service/auth_service.dart';
import 'package:get/get.dart';

import '../state/profile_state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();
  final AuthService _auth = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() {
    final Map<String, dynamic> p = Map<String, dynamic>.from(_auth.driverProfile);
    final String currentEmail = (p['email'] as String?) ?? '';
    if (currentEmail.isEmpty) {
      p['email'] = _auth.currentUser?.email ?? '';
    }
    state.profile.assignAll(p);
  }

  void updateName(String name) {
    final Map<String, dynamic> p = Map<String, dynamic>.from(state.profile);
    p['name'] = name.trim();
    state.profile.assignAll(p);
    _auth.saveDriverProfile(p);
  }

  Future<void> logout() => _auth.signOut();
}
