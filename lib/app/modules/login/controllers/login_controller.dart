import 'package:get/get.dart';

class LoginController extends GetxController {
  var showPassword = true.obs;

  void showPass() => showPassword.value = !showPassword.value;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
