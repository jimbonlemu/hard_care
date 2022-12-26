import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_pt2/app/routes/app_pages.dart';

import '../../../anim/animation.dart';
import '../../../controllers/auth_controller.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo/login_page.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 50,
                      top: 25,
                      width: 300,
                      height: 200,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/logo/healthCareLogo.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 350),
                          child: Center(
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.inter(
                                color: Color(0xff0ab885),
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: controller.namaLengkapController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nama Lengkap",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: controller.alamatController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Alamat",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //     border: Border(
                            //       bottom: BorderSide(
                            //         color: Colors.grey.withOpacity(0.100),
                            //       ),
                            //     ),
                            //   ),
                            //   child: TextFormField(
                            //     controller: controller.jenisKelaminController,
                            //     decoration: InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText: "Jenis Kelamin",
                            //       hintStyle: TextStyle(
                            //         color: Colors.grey[400],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: Obx(() => TextFormField(
                                    controller: controller.passwordController,
                                    obscureText: controller.showPassword.value,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            controller.showPass();
                                          },
                                          child: Icon(
                                            controller.showPassword.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Color(0xff525252)
                                                .withOpacity(0.5),
                                          ),
                                        )),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Obx(() => TextFormField(
                                    controller:
                                        controller.confirmPassController,
                                    obscureText:
                                        controller.showConfirmPassword.value,
                                    decoration: InputDecoration(
                                      hintText: "Konfirmasi Password",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.showPassConfirm();
                                        },
                                        child: Icon(
                                          controller.showConfirmPassword.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xff525252)
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Pilih Gender : '),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: "Laki-laki",
                                          groupValue:
                                              controller.selectedGender.value,
                                          onChanged: (value) {
                                            controller.onChangeGender(value);
                                          },
                                          activeColor: Colors.teal,
                                        )),
                                    Text('Laki-laki')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() => Radio(
                                          value: "Perempuan",
                                          groupValue:
                                              controller.selectedGender.value,
                                          onChanged: (value) {
                                            controller.onChangeGender(value);
                                          },
                                          activeColor: Colors.teal,
                                        )),
                                    Text('Perempuan')
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      GestureDetector(
                        onTap: () {
                          authC.register(
                              controller.namaLengkapController.text,
                              controller.emailController.text,
                              controller.selectedGender.value,
                              controller.alamatController.text,
                              controller.fotoController.text,
                              controller.passwordController.text,
                              controller.confirmPassController.text);
                          print([
                            "ACCOUNT INFO!",
                            controller.namaLengkapController.text,
                            controller.emailController.text,
                            controller.selectedGender.value,
                            controller.alamatController.text,
                            controller.fotoController.text,
                            controller.passwordController.text
                          ]);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(10, 184, 133, 1.000),
                                Color.fromRGBO(10, 184, 133, .600),
                              ])),
                          child: Center(
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      1.5,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Sudah Memiliki Akun?",
                                style: TextStyle(
                                  color: Color(0xff525252),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Color(0xff0ab885),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
