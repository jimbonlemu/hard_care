import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController namaLengkapController;
  late TextEditingController alamatController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

  var showPassword = true.obs;
  var showConfirmPassword = true.obs;

  void showPass() => showPassword.value = !showPassword.value;
  void showPassConfirm() =>
      showConfirmPassword.value = !showConfirmPassword.value;
  void checkValues() {}

  @override
  void onInit() {
    namaLengkapController = TextEditingController();
    alamatController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaLengkapController.dispose();
    alamatController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
