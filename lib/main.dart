import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "HealthCare GetX",
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.white,
              ),
              initialRoute: authC.isSkipIntro.isTrue
                  ? authC.isAuth.isTrue
                      ? Routes.DASHBOARD
                      : Routes.LOGIN
                  : Routes.INTRODUCTION,
              getPages: AppPages.routes,
            ),
          );
        } else if (snapshot.hasData) {
          Get.offAllNamed(Routes.DASHBOARD);
        }
        return FutureBuilder(
          future: authC.firstInitialized(),
          builder: (context, snapshot) => SplashScreen(),
        );
      },
      //  future: Future.delayed(Duration(seconds: 0)),
      // builder: (context, snapshot) {
      //   if (snapshot.connectionState == ConnectionState.done) {
      //     return GetMaterialApp(
      //       title: "ChatApp",
      //       theme: ThemeData(
      //         brightness: Brightness.light,
      //         primaryColor: Colors.white,
      //         accentColor: Colors.black,
      //         buttonColor: Colors.red[900],
      //       ),
      //       initialRoute: Routes.DASHBOARD,
      //       getPages: AppPages.routes,
      //     );
      //   }
      //   return FutureBuilder(
      //     future: authC.firstInitialized(),
      //     builder: (context, snapshot) => SplashScreen(),
      //   );
    );
  }
}
