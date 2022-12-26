import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_care_pt2/app/data/models/users_model.dart';
import 'package:health_care_pt2/app/data/models/pasien_model.dart';
import 'package:health_care_pt2/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  int radioBoxKelaminController = 1;

  late TextEditingController namaLengkapController;
  late TextEditingController alamatController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;
  late TextEditingController jenisKelaminController;
  late TextEditingController fotoController;

  var showPassword = true.obs;
  var showConfirmPassword = true.obs;

  final selectedGender = "".obs;

  onChangeGender(var gender) {
    selectedGender.value = gender;
  }

  void showPass() => showPassword.value = !showPassword.value;
  void showPassConfirm() =>
      showConfirmPassword.value = !showConfirmPassword.value;
  void checkValues() {}

  

  @override
  void onInit() {
    fotoController = TextEditingController();
    jenisKelaminController = TextEditingController();
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
    fotoController.dispose();
    jenisKelaminController.dispose();
    namaLengkapController.dispose();
    alamatController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
