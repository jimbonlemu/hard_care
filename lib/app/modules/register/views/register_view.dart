import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
              SizedBox(
                height: 100,
              ),
              FadeAnimation(
                1.1,
                Container(
                  child: Center(
                    child: Text(
                      "Lengkapi Formulir Registrasi",
                      style: GoogleFonts.inter(
                        color: Color(0xff0ab885),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: FadeAnimation(
                    1.3,
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
                      child: Column(children: [
                        Lottie.asset(
                          'assets/lottie/filled_form.json',
                        ),
                      ]),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20),
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
                                initialValue: authC.user.value.email!,
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
                        onTap: () {},
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
                              "Kirim",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
