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

  Future<void> load() async {
    state.isLoading.value = true;
    final Map<String, dynamic> p = await _auth.fetchDriverProfile();
    final String currentEmail = (p['email'] as String?) ?? '';
    if (currentEmail.isEmpty) {
      p['email'] = _auth.currentUser?.email ?? '';
    }
    state.profile.assignAll(p);
    state.isLoading.value = false;
  }

  /// Updates the editable fields and persists them to Firestore in one write.
  /// Returns true once the save completes, false if it fails.
  Future<bool> updateProfile({
    required String name,
    required String phone,
    required String license,
  }) async {
    final Map<String, dynamic> p = Map<String, dynamic>.from(state.profile);
    p['name'] = name.trim();
    p['phone'] = phone.trim();
    p['license'] = license.trim();
    state.profile.assignAll(p);
    try {
      await _auth.saveDriverProfile(p);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<void> logout() => _auth.signOut();
}
