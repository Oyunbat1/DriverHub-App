import 'package:get/get.dart';

import '../logic/auth_logic.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLogic>(() => AuthLogic());
  }
}
