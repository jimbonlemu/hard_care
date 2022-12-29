import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UbahPasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

  var showPassword = true.obs;
  var showConfirmPassword = true.obs;

  void showPass() => showPassword.value = !showPassword.value;
  void showPassConfirm() =>
      showConfirmPassword.value = !showConfirmPassword.value;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPassController.dispose();
  }
}
