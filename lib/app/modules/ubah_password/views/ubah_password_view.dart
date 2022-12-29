import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0ab885),
        title: Text('Ubah Password'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.showPassword.value,
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.showPass();
                    },
                    child: Icon(
                      controller.showPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xff525252).withOpacity(0.5),
                    ),
                  ),
                  labelText: "Password Baru",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.showConfirmPassword.value,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.showPassConfirm();
                    },
                    child: Icon(
                      controller.showConfirmPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xff525252).withOpacity(0.5),
                    ),
                  ),
                  labelText: "Konfirmasi Password Baru",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Ubah Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0ab885),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
