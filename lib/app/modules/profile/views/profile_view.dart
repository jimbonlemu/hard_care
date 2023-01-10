import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care_pt2/app/modules/faq/controllers/faq_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../../../controllers/auth_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  final faqC = Get.find<FaqController>();

  final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.black,
    buttonColor: Colors.red[900],
  );

  final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF686D76),
    accentColor: Colors.white,
    buttonColor: Colors.red[900],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Color(0xFF373A40) : Colors.white,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Obx(
                  () => AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: Duration(seconds: 2),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: 175,
                      height: 175,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: authC.user.value.photoUrl! == ""
                            ? Image.asset(
                                "assets/logo/noimage.png",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                authC.user.value.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    "${authC.user.value.name!}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "${authC.user.value.email!}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                    leading: Icon(
                      Icons.person_outlined,
                      color: Color(0xff0ab885),
                    ),
                    title: Text(
                      "Ubah Profil",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.FAQ);
                      faqC.getDataFaq();
                    },
                    leading: Icon(
                      Icons.question_answer_outlined,
                      color: Color(0xff0ab885),
                    ),
                    title: Text(
                      "F.A.Q",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.PENGATURAN_AKUN);
                    },
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Color(0xff0ab885),
                    ),
                    title: Text(
                      "Pengaturan Akun",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Peringatan',
                        middleText: 'Apakah anda yakin akan keluar?',
                        onConfirm: () {
                          authC.logout();
                        },
                        onCancel: () {},
                        textConfirm: 'Ya',
                        textCancel: 'Tidak',
                        confirmTextColor: Colors.black,
                        cancelTextColor: Colors.black,
                        buttonColor: Color(0xff0ab885),
                      );
                    },
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Color(0xff0ab885),
                    ),
                    title: Text(
                      "Keluar",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HealthCare",
                  style: TextStyle(
                    color:  Colors.black54,
                  ),
                ),
                Text(
                  "v.0.1",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
