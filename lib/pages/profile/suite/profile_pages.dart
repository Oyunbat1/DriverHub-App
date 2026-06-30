import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../logic/profile_binding.dart';
import '../view/profile_edit_view.dart';
import '../view/profile_view.dart';

class ProfilePages {
  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.profileEdit,
      page: () => const ProfileEditView(),
    ),
  ];

  static void openEdit() => Get.toNamed(Routes.profileEdit);
  static void logout() => Get.offAllNamed(Routes.login);
}
