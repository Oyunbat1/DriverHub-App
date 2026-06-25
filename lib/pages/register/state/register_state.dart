import 'package:get/get.dart';

class RegisterState {
  final RxString phone = ''.obs;
  final RxString name = ''.obs;
  final RxString email= ''.obs;
  final RxString password = ''.obs;
  final RxString license = ''.obs;
  final RxString photoPath = ''.obs;
  final RxString error = ''.obs;
  final RxBool isLoading = false.obs;
}
