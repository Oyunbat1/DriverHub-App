import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/service/auth_service.dart';
import '../state/auth_state.dart';

class AuthLogic extends GetxController {
  final AuthState state = AuthState();
  final AuthService _auth = Get.find<AuthService>();

  // Owned by the logic so the views can stay stateless (GetView).
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  void onClose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.onClose();
  }

  Future<bool> login(String email, String password) async {
    state.isLoading.value = true;
    final bool ok = await _auth.signInEmail(email.trim(), password);
    state.isLoading.value = false;
    return ok;
  }


  Future<bool> sendReset(String email) async {
    state.isLoading.value = true;
    final bool ok = await _auth.sendPasswordReset(email.trim());
    state.isLoading.value = false;
    return ok;
  }
}
