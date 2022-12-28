import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_care_pt2/app/modules/faq/controllers/faq_controller.dart';
import 'package:health_care_pt2/app/modules/jadwal/controllers/jadwal_controller.dart';
import 'package:health_care_pt2/app/modules/jadwal/views/jadwal_view.dart';
import 'package:health_care_pt2/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:health_care_pt2/app/modules/navbar/views/navbar_view.dart';
import 'package:health_care_pt2/app/modules/pengaturan_akun/controllers/pengaturan_akun_controller.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../search/views/search_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final jadwalController = Get.put(JadwalController());
  final navbarController = Get.put(NavbarController());
  final faqController = Get.put(FaqController());
  final pengaturanAkunController = Get.put(PengaturanAkunController());

  final screens = [
    NavbarView(),
    HomeView(),
    SearchView(),
    JadwalView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            child: GNav(
              backgroundColor: Color(0xffffffff),
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0xff0ab885),
              color: Color.fromARGB(255, 0, 0, 0),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                ),
                GButton(
                  icon: Icons.message,
                  text: 'Pesan',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Tenaga Medis',
                ),
                GButton(
                  icon: Icons.calendar_month_rounded,
                  text: 'Jadwal',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profil',
                ),
              ],
              onTabChange: (value) {
                controller.changeIndex(value);
                jadwalController.getData();
              },
            ),
          ),
        ),
      ),
    );
  }
}
