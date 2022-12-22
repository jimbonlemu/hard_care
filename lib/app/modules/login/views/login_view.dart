import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_pt2/app/anim/animation.dart';
import 'package:health_care_pt2/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';
import '../../../controllers/auth_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo/login_page.png'),
                  ),
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
                              "Masuk",
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
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
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
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: TextFormField(
                                  // controller: _emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Obx(
                                  () => TextFormField(
                                    // controller: _passwordController,
                                    obscureText: controller.showPassword.value,
                                    decoration: InputDecoration(
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
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      InkWell(
                        onTap: () {
                          authC.login();
                          // checkValues();
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
                              "Masuk",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
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
                                "Tidak Memiliki Akun?",
                                style: TextStyle(
                                  color: Color(0xff525252),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.REGISTER),
                              child: Text(
                                "Buat Akun",
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
    // body: SafeArea(
    //   child: Padding(
    //     padding: const EdgeInsets.all(30),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             width: Get.width * 0.7,
    //             height: Get.width * 0.7,
    //             child: Lottie.asset("assets/lottie/login.json"),
    //           ),
    //           SizedBox(height: 20),

    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFormField(
    //             decoration: InputDecoration(
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(200),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 50),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10),
    //             child: ElevatedButton(
    //               onPressed: () => authC.login(),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     width: 50,
    //                     height: 50,
    //                     child: Image.asset("assets/logo/google.png"),
    //                   ),
    //                   SizedBox(width: 15),
    //                   Text(
    //                     "Sign In with Google",
    //                     style: TextStyle(fontSize: 20),
    //                   ),
    //                 ],
    //               ),
    //               style: ElevatedButton.styleFrom(
    //                 primary: Colors.red[900],
    //                 padding: EdgeInsets.symmetric(vertical: 12),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(50),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // );
  }
}
