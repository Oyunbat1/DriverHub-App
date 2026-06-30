import 'package:get/get.dart';

class ProfileState {

  final RxMap<String, dynamic> profile = <String, dynamic>{}.obs;
  final RxBool isLoading = false.obs;
}
