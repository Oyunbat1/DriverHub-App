import 'package:get/get.dart';
import '../../../app/service/auth_service.dart';
import '../state/register_state.dart';


class RegisterLogic extends GetxController {

  final RegisterState state = RegisterState();
  final AuthService _auth = Get.find<AuthService>();


  void setPhone(String phone) {
    final String cleaned = phone.replaceAll(RegExp(r'[\s-]'), '');
    state.phone.value = cleaned.startsWith('+') ? cleaned : '+976$cleaned';
  }

  Future<bool> sendOtp() async {
    state.isLoading.value = true;
    final bool ok = await _auth.sendOtp(state.phone.value);
    state.isLoading.value = false;
    return ok;
  }

  Future<bool> verifyOtp(String code) async {
    state.isLoading.value = true;
    final bool ok = await _auth.verifyOtp(code.trim());
    state.isLoading.value = false;
    return ok;
  }

  void setInfo(String name, String license ,String email ,String password) {
    state.name.value = name.trim();
    state.license.value = license.trim();
    state.email.value = email.trim();
    state.password.value = password.trim();
  }


  void setPhoto(String path) => state.photoPath.value = path;

  Future<bool> submitRegistration() async {
    state.isLoading.value = true;

    state.error.value = '';
    final String? error =
          await _auth.registerEmail(state.email.value, state.password.value);
    if (error != null ) {
      state.error.value = error;
      state.isLoading.value = false;
      return false;
    }

    await Future<void>.delayed(const Duration(milliseconds: 600));
    _auth.saveDriverProfile(<String, dynamic>{
      'name': state.name.value,
      'phone': state.phone.value,
      'license': state.license.value,
      'photo': state.photoPath.value,
      'email': state.email.value,
    });
    state.isLoading.value = false;
    return true;
  }
}
