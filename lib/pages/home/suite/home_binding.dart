import 'package:get/get.dart';

import '../logic/home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }
}
