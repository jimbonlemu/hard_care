import 'package:flutter/material.dart';
import 'package:health_care_pt2/app/modules/introduction/views/introduction_view.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
            splash: 'assets/logo/splashscreen.png',
            splashIconSize: 1000,
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xff0ab885),
            nextScreen: IntroductionView(),
          ),
        ),
      ),
    );
  }
}
